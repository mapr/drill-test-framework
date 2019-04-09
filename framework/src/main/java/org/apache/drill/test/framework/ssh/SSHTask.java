package org.apache.drill.test.framework.ssh;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.concurrent.Callable;

/**
 * Class represents an SSH task ro be run on a host.
 *
 * Code reused from implementation of NodeTask.java in
 * {@link - https://repository.mapr.com/nexus/content/groups/mapr-public/com/mapr/db/ycsb-driver/}
 */
public abstract class SSHTask<T> implements Callable<T> {
    final protected DrillCluster cluster;
    private final String host;

    protected SSHTask(final DrillCluster cluster, final String host) {
        this.cluster = cluster;
        this.host = host;
    }

    @Override
    public T call() throws Exception {
        final SSHSession session = cluster.getSessionManager().getSession(getHost());
        Thread.currentThread().setName(session.getUserName() + "@" + session.getHost());
        return run(session);
    }

    protected void ack(OutputStream out) throws IOException {
        out.write(0); out.flush();
    }

    protected int checkAck(InputStream in) throws IOException {
        int b = in.read();
        switch (b) {
            case 1: // error
            case 2: // fatal error
                int c;
                StringBuilder sb = new StringBuilder();
                sb.append("Error: " + b + ". ");
                while ((c = in.read()) != '\n') {
                    sb.append((char) c);
                }
                throw new IOException(sb.toString());
            case 0: // success
            default:
                return b;
        }
    }
    protected abstract T run(SSHSession session) throws Exception;

    public String getHost() {
        return host;
    }
}
