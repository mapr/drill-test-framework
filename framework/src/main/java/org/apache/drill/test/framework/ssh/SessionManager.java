package org.apache.drill.test.framework.ssh;

import java.util.Map;

import com.google.common.collect.Maps;
import com.jcraft.jsch.JSchException;

/**
 * Represents a SSH session manager.
 * Every user and host combination has an entry in the in-memory map.
 *
 * Code reused from implementation of SessionManager.java in
 * {@link - https://repository.mapr.com/nexus/content/groups/mapr-public/com/mapr/db/ycsb-driver/}
 */
public class SessionManager {
    final Map<String, SSHSession> sessionMap = Maps.newHashMap();

    final private String user;

    public SessionManager(String user) {
        this.user = user;
    }

    public synchronized SSHSession getSession(final String node)
            throws JSchException {
        String host = node;
        String hostString = user + "@" + host;
        if(host.contains("_")){
            host=host.substring(0,host.indexOf("_"));
        }
        SSHSession session = sessionMap.get(hostString);
        if (session == null || !session.isConnected()) {
            session = new SSHSession(user, host);
            sessionMap.put(hostString, session);
        }
        return session;
    }

    public void shutdown() {
        sessionMap.forEach((key, session) -> {
            if (session.isConnected()) {
                session.disconnect();
            }
        });
    }
}
