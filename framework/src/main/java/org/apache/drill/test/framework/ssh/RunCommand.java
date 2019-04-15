package org.apache.drill.test.framework.ssh;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jcraft.jsch.ChannelExec;

/**
 * Task to run specified command on a remote host.
 * Code reused from implementation of RunCommand.java in
 * {@link - https://repository.mapr.com/nexus/content/groups/mapr-public/com/mapr/db/ycsb-driver/}
 */
public class RunCommand extends SSHTask<RunCommand> {
    private static final Logger LOG = LoggerFactory.getLogger(RunCommand.class);
    private static final CharsetDecoder DECODER = StandardCharsets.UTF_8.newDecoder()
            .onMalformedInput(CodingErrorAction.REPLACE)
            .onUnmappableCharacter(CodingErrorAction.REPLACE);

    private String cmd;
    private String output;
    private int exitCode;

    public RunCommand(final DrillCluster cluster, final String host, final String cmd) {
        super(cluster, host);
        this.cmd = cmd;
    }

    @Override
    public RunCommand run(SSHSession session) throws Exception {
        ChannelExec channel = session.openChannelExec("exec");
        channel.setCommand(cmd);
        channel.setInputStream(null);

        LOG.info("Executing command '{}'.", cmd);
        channel.connect();

        BufferedReader stdErrReader = new BufferedReader(
                new InputStreamReader(channel.getErrStream(), DECODER), 1024);
        BufferedReader stdOutReader = new BufferedReader(
                new InputStreamReader(channel.getInputStream(), DECODER), 1024);

        LOG.debug("Reading from stream.");
        final StringBuilder out = new StringBuilder();
        out.append("Error:\n"); // must read err before out
        if (!consumeReader(channel, stdErrReader, out)) {
            out.setLength(0);
        }
        int bufLen = out.length();
        out.append("Output:\n");
        if (!consumeReader(channel, stdOutReader, out)) {
            out.setLength(bufLen);
        }

        if (out.length() > 0) {
            output = out.toString();
            LOG.debug("\n{}", output);
        }

        LOG.debug("Command completed, exit-status: {}.", exitCode = channel.getExitStatus());
        channel.disconnect();
        LOG.debug("Channel disconnected.");
        return this;
    }

    private boolean consumeReader(ChannelExec channel,
                                  BufferedReader reader, StringBuilder out) throws IOException {
        boolean hadData = false;
        while (true) {
            int ch;
            while ((ch = reader.read()) > 0) {
                hadData = true;
                out.append((char)ch);
            }
            if (channel.isClosed()) {
                break;
            }
            try {
                Thread.sleep(1000);
            } catch (Exception ee) {}
        }
        return hadData;
    }

    public String getOutput() throws Exception {
        return output;
    }

    public int getExitCode() {
        return exitCode;
    }

}
