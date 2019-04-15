package org.apache.drill.test.framework.ssh;

import static java.nio.charset.StandardCharsets.UTF_8;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.attribute.BasicFileAttributes;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jcraft.jsch.ChannelExec;

/**
 * Represent a scp or copy to remote host task.
 *
 * Code reused from implementation of CopyToRemote.java in
 * {@link - https://repository.mapr.com/nexus/content/groups/mapr-public/com/mapr/db/ycsb-driver/}
 */
public class CopyToRemote extends SSHTask<CopyToRemote> {
    private static final Logger LOG = LoggerFactory .getLogger(CopyToRemote.class);

    final private File localFile;
    private String remoteFilePath;

    public CopyToRemote(final DrillCluster cluster,
                        final String host,
                        final String localFile,
                        final String remoteFile) {
        super(cluster, host);
        this.localFile = new File(localFile);
        this.remoteFilePath = remoteFile;
    }

    @Override
    public CopyToRemote run(SSHSession session) throws Exception {
        LOG.info("Copying {} to {}", localFile, remoteFilePath);

        StringBuilder command = new StringBuilder("scp -p -t ").append(remoteFilePath);
        ChannelExec channel = session.openChannelExec("exec");
        channel.setCommand(command.toString());

        OutputStream out = channel.getOutputStream();
        InputStream in = channel.getInputStream();

        channel.connect();
        checkAck(in);

        // send file lastModifiedTime and lastAccessTime
        command.setLength(0);
        Path localFileDir = Paths.get(localFile.getParent());
        Path localFilePath = localFileDir.resolve(localFile.getName());
        BasicFileAttributes attrs = Files.readAttributes(localFilePath,
                BasicFileAttributes.class);
        command.append("T").append(attrs.lastModifiedTime().toMillis() / 1000).append(" 0");
        command.append(" ").append(attrs.lastAccessTime().toMillis() / 1000).append(" 0\n");
        LOG.debug("Transmiting last modified and access time . . .");
        out.write(command.toString().getBytes(UTF_8));
        out.flush();
        checkAck(in);

        // send "C0644 filesize filename"
        command.setLength(0);
        long filesize = localFile.length();
        command.append("C0644 ").append(filesize).append(" ").append(localFile.getName()).append('\n');
        LOG.debug("Transmiting file size and name . . .");
        out.write(command.toString().getBytes(UTF_8));
        out.flush();
        checkAck(in);

        // send the content of lfile
        FileInputStream fis = new FileInputStream(localFile);
        LOG.debug("Transmiting file content . . .");
        byte[] buf = new byte[1024];
        long transmitted = 0;
        long lastPercentTransmitted = 0;
        while (true) {
            int len = fis.read(buf, 0, buf.length);
            if (len <= 0)
                break;
            out.write(buf, 0, len);
            transmitted += len;
            long percentTransmitted = transmitted*100/filesize;
            if (percentTransmitted > lastPercentTransmitted
                    && percentTransmitted % 10 == 0) {
                lastPercentTransmitted = percentTransmitted;
                LOG.debug("{}% complete", percentTransmitted);
            }
        }
        fis.close();
        buf[0] = 0; // send '\0'
        out.write(buf, 0, 1);
        out.flush();
        checkAck(in);
        out.close();

        channel.disconnect();
        LOG.debug("Transmission complete.");
        return this;
    }

}
