package org.apache.drill.test.framework.ssh;

import java.io.File;
import java.util.concurrent.atomic.AtomicInteger;

import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import com.jcraft.jsch.UserInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * Represents a SSH session object that can be used to talk to a host as a particular user.
 * These SSH sessions are managed by {@link SessionManager}.
 *
 * Code reused from implementation of SSHSession.java in
 * {@link - https://repository.mapr.com/nexus/content/groups/mapr-public/com/mapr/db/ycsb-driver/}
 */
public class SSHSession {
    static Logger logger = LoggerFactory.getLogger(SSHSession.class);

    final private static String userHome = System.getProperty("user.home");
    final private static File sshDir = new File(userHome, ".ssh");
    private static JSch jsch = null;
    final static private AtomicInteger idTracker = new AtomicInteger();

    private final Session session;
    private final String id;

    public SSHSession(final String user, final String host)
            throws JSchException {
        id = String.valueOf(idTracker.incrementAndGet());
        session = getJSch().getSession(user, host, 22);
        session.setConfig("HashKnownHosts", "yes");
        session.setConfig("StrictHostKeyChecking", "no");
        session.setUserInfo(new UserInfo() {
            @Override
            public String getPassphrase() {
                //Auto-generated method stub
                return null;
            }

            @Override
            public String getPassword() {
                //Auto-generated method stub
                return null;
            }

            @Override
            public boolean promptPassword(String message) {
                //Auto-generated method stub
                return false;
            }

            @Override
            public boolean promptPassphrase(String message) {
                //Auto-generated method stub
                return false;
            }

            @Override
            public boolean promptYesNo(String message) {
                //Auto-generated method stub
                return false;
            }

            @Override
            public void showMessage(String message) {
                //Auto-generated method stub
            }
        });
        logger.info("Connecting to '{}' as '{}'.", host, user);
        session.connect();
        logger.info("Success.");
    }

//    public String substituteId(String orginal) {
//        return orginal.replaceAll("\\$\\{node_id}", id).replaceAll("\\$\\{node_host}", session.getHost());
//    }

    public Session getSession() {
        return session;
    }

    private static synchronized JSch getJSch() throws JSchException {
        if (jsch == null) {
            jsch = new JSch();
            addIdFile(jsch, "id_rsa");
            addIdFile(jsch, "id_dsa");
            addIdFile(jsch, "id_rsa.ppk");
            jsch.setKnownHosts(new File(sshDir, "known_hosts").getAbsolutePath());
        }
        return jsch;
    }

    private static void addIdFile(JSch jsch, String fileName) throws JSchException {
        File idFile = new File(sshDir, fileName);
        if (idFile.exists()) {
            jsch.addIdentity(idFile.getAbsolutePath());
        }
    }

    public boolean isConnected() {
        return session.isConnected();
    }

    public void disconnect() {
        session.disconnect();
    }

    public String getUserName() {
        return session.getUserName();
    }

    public String getHost() {
        return session.getHost();
    }

    public ChannelExec openChannelExec(String exec)
            throws JSchException {
        return (ChannelExec) session.openChannel(exec);
    }

}

