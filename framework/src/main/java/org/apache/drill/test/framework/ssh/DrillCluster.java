package org.apache.drill.test.framework.ssh;

import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import com.google.common.base.Preconditions;
import com.google.common.collect.Sets;
import org.apache.drill.test.framework.DrillTestDefaults;
import org.apache.drill.test.framework.ThrowingConsumer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.common.collect.Lists;

/**
 * Represents a DrillCluster.
 * Should be used whenever the test framework should talk to a drill cluster.
 *
 * Instantiated with hostnames of nodes running drillbits and an admin user.
 * If admin user is not provided, "root" is considered as the admin user.
 */
public class DrillCluster {
    final private static Logger LOG = LoggerFactory.getLogger(DrillCluster.class);
    final private SessionManager manager;
    final private ExecutorService executor = Executors.newCachedThreadPool();
    final private Set<String> clusterNodes = Sets.newLinkedHashSet();

    public DrillCluster(List<String> hosts) {
        this(DrillTestDefaults.USERNAME, hosts);
    }

    public DrillCluster(String adminUser, List<String> hosts) {
        Preconditions.checkNotNull(hosts, "\"hosts\" cannot be null");
        if(adminUser == null) {
            adminUser = DrillTestDefaults.USERNAME;
        }

        manager = new SessionManager(adminUser);
        clusterNodes.addAll(hosts);
        LOG.info("DrillCluster initialized with {} nodes", clusterNodes);
    }

    public SessionManager getSessionManager() {
        return manager;
    }

    public void copyToRemote(final String localFile, final String remoteFile) {
        List<Future<CopyToRemote>> futures = Lists.newArrayList();

        clusterNodes.forEach(ThrowingConsumer.throwingConsumerWrapper(n -> {
            CopyToRemote cmd = new CopyToRemote(this, n, localFile, remoteFile);
            futures.add(executor.submit(cmd));
        }));

        futures.forEach(ThrowingConsumer.throwingConsumerWrapper(Future::get));
    }

    public void runCommand(final String command) {
        List<Future<RunCommand>> futures = Lists.newArrayList();

        clusterNodes.forEach(ThrowingConsumer.throwingConsumerWrapper(n -> {
            RunCommand cmd = new RunCommand(this, n, command);
            futures.add(executor.submit(cmd));
        }));
        futures.forEach(ThrowingConsumer.throwingConsumerWrapper(Future::get));
    }

    public void shutdown() {
        manager.shutdown();
        executor.shutdown();
    }

    public void addHost(String host) {
        clusterNodes.add(host);
    }

    public void addHosts(List<String> hosts) {
        clusterNodes.addAll(hosts);
    }

    public List<String> getHosts() {
        return new LinkedList<>(clusterNodes);
    }
}
