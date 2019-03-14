package org.apache.drill.test.framework;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonTypeName;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.typesafe.config.ConfigFactory;
import com.typesafe.config.ConfigRenderOptions;

import java.io.IOException;
import java.util.List;

import static org.apache.drill.test.framework.DrillTestDefaults.DRILL_EXEC_RM_CONFIG_KEY;

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonTypeName(DRILL_EXEC_RM_CONFIG_KEY)
@JsonInclude(Include.NON_DEFAULT)
/**
 * Represents a Drill RM Resource Pool configuration.
 */
public class DrillRMConfig implements DrillConfigRenderer {
    //Resource Pool Configurations
    public static final String RESOURCE_POOL_NAME_KEY = "pool_name";
    public static final String MEMORY_KEY = "memory";
    public static final String QUEUE_SELECTION_POLICY_KEY = "queue_selection_policy";
    public static final String SELECTOR_KEY = "selector";
    public static final String QUEUE_KEY = "queue";
    public static final String CHILD_POOLS_KEY = "child_pools";

    //Selector Configurations
    public static final String SELECTOR_TAG_KEY = "tag";
    public static final String SELECTOR_ACL_KEY = "acl";

    //ACL Configurations
    public static final String ACL_USERS_KEY = "users";
    public static final String ACL_GROUPS_KEY = "groups";

    //Queue Configurations
    public static final String QUEUE_MAX_QUERY_MEMORY_PER_NODE_KEY = "max_query_memory_per_node";
    public static final String QUEUE_MAX_WAITING_KEY = "max_waiting";
    public static final String QUEUE_MAX_ADMISSIBLE_KEY = "max_admissible";
    public static final String QUEUE_WAIT_FOR_PREFERRED_NODES_KEY = "wait_for_preferred_nodes";

    @JsonProperty(RESOURCE_POOL_NAME_KEY)
    public String poolName;

    @JsonProperty(MEMORY_KEY)
    public double memory;

    @JsonProperty(QUEUE_SELECTION_POLICY_KEY)
    public String queueSelectionPolicy;

    @JsonProperty(SELECTOR_KEY)
    public SelectorConfig selector;

    @JsonProperty(QUEUE_KEY)
    public QueueConfig queue;

    @JsonProperty(CHILD_POOLS_KEY)
    public List<DrillRMConfig> childPools;

    @JsonIgnoreProperties(ignoreUnknown = true)
    @JsonTypeName(SELECTOR_KEY)
    @JsonInclude(Include.NON_DEFAULT)
    /**
     * Represents a Drill RM Selector configuration.
     */
    public static class SelectorConfig implements DrillConfigRenderer {

        public String tag;

        public AclConfig acl;

        @Override
        public String render() {
            return render(0);
        }

        @Override
        public String render(final int acc) {
            boolean ensureAtleastOneField = false;
            String prefixString = indent(acc);

            StringBuilder sb = new StringBuilder("{\n");
            final int nextAcc = acc+2;
            if (tag != null) {
                ensureAtleastOneField = true;
                sb.append(formatConfig(nextAcc, SELECTOR_TAG_KEY, tag));
            }

            if (acl != null) {
                ensureAtleastOneField = true;
                sb.append(formatConfig(nextAcc, SELECTOR_ACL_KEY, acl));
            }

            if(ensureAtleastOneField) {
                sb.deleteCharAt(sb.length() - 1)
                        .deleteCharAt(sb.length() - 1)
                        .append("\n")
                        .append(indent(acc)); //Close according to previous level
            }
            sb.append("}");

            return sb.toString();
        }
    }

    @JsonIgnoreProperties(ignoreUnknown = true)
    @JsonTypeName(SELECTOR_ACL_KEY)
    @JsonInclude(Include.NON_DEFAULT)
    /**
     * Represents a Drill RM ACL configuration.
     */
    public static class AclConfig implements DrillConfigRenderer {

        public List<String> users;

        public List<String> groups;

        @Override
        public String render() {
            return render(0);
        }

        @Override
        public String render(final int acc) {
            boolean ensureAtleastOneField = false;
            String prefixString = indent(acc);

            StringBuilder sb = new StringBuilder("{\n");
            final int nextAcc = acc+2;
            if (users != null) {
                ensureAtleastOneField = true;
                sb.append(formatConfig(nextAcc, ACL_USERS_KEY, users));
            }

            if (groups != null) {
                ensureAtleastOneField = true;
                sb.append(formatConfig(nextAcc, ACL_GROUPS_KEY, groups));
            }

            if(ensureAtleastOneField) {
                sb.deleteCharAt(sb.length() - 1)
                        .deleteCharAt(sb.length() - 1)
                        .append("\n")
                        .append(indent(acc)); //Close according to previous level
            }
            sb.append("}");

            return sb.toString();
        }
    }

    @JsonIgnoreProperties(ignoreUnknown = true)
    @JsonInclude(Include.NON_DEFAULT)
    /**
     * Represents a Drill RM Queue configuration.
     */
    public static class QueueConfig implements DrillConfigRenderer {

        @JsonProperty(QUEUE_MAX_QUERY_MEMORY_PER_NODE_KEY)
        public long maxQueryMemoryPerNodeInMB;

        @JsonProperty(QUEUE_MAX_WAITING_KEY)
        public int maxWaitingQueries;

        @JsonProperty(QUEUE_MAX_ADMISSIBLE_KEY)
        public int maxAdmissibleQueries;

        @JsonProperty(QUEUE_WAIT_FOR_PREFERRED_NODES_KEY)
        public boolean waitForPreferredNodes;

        @Override
        public String render() {
            return render(0);
        }

        @Override
        public String render(final int acc) {
            boolean ensureAtleastOneField = false;
            StringBuilder sb = new StringBuilder("{\n");
            final int nextAcc = acc+2;

            if (maxQueryMemoryPerNodeInMB >= 0) {
                ensureAtleastOneField = true;
                sb.append(formatConfig(nextAcc, QUEUE_MAX_QUERY_MEMORY_PER_NODE_KEY, maxQueryMemoryPerNodeInMB));
            }

            if (maxWaitingQueries >= 0) {
                ensureAtleastOneField = true;
                sb.append(formatConfig(nextAcc, QUEUE_MAX_WAITING_KEY, maxWaitingQueries));
            }

            if (maxAdmissibleQueries >= 0) {
                ensureAtleastOneField = true;
                sb.append(formatConfig(nextAcc, QUEUE_MAX_ADMISSIBLE_KEY, maxAdmissibleQueries));
            }

            if (waitForPreferredNodes) {
                ensureAtleastOneField = true;
                sb.append(formatConfig(nextAcc, QUEUE_WAIT_FOR_PREFERRED_NODES_KEY, true));
            }

            if(ensureAtleastOneField) {
                sb.deleteCharAt(sb.length() - 1)
                        .deleteCharAt(sb.length() - 1)
                        .append("\n")
                        .append(indent(acc)); //Close according to previous level
            }
            sb.append("}");

            return sb.toString();
        }
    }

    @Override
    public String render() {
        return render(0);
    }

    @Override
    public String render(final int acc) {
        boolean ensureAtleastOneField = false;
        StringBuilder sb = new StringBuilder("{\n");
        final int nextAcc = acc+2;
        if (poolName != null) {
            ensureAtleastOneField = true;
            sb.append(formatConfig(nextAcc, RESOURCE_POOL_NAME_KEY, poolName));
        }

        if (memory >= 0) {
            ensureAtleastOneField = true;
            sb.append(formatConfig(nextAcc, MEMORY_KEY, memory));
        }

        if (queueSelectionPolicy != null) {
            ensureAtleastOneField = true;
            sb.append(formatConfig(nextAcc, QUEUE_SELECTION_POLICY_KEY, queueSelectionPolicy));
        }

        if (selector != null) {
            ensureAtleastOneField = true;
            sb.append(formatConfig(nextAcc, SELECTOR_KEY, selector));
        }

        if (queue != null) {
            ensureAtleastOneField = true;
            sb.append(formatConfig(nextAcc, QUEUE_KEY, queue));
        }

        if (childPools != null) {
            ensureAtleastOneField = true;
            sb.append(formatConfig(nextAcc, CHILD_POOLS_KEY, childPools));
        }

        if(ensureAtleastOneField) {
            sb.deleteCharAt(sb.length() - 1)
                    .deleteCharAt(sb.length() - 1)
                    .append("\n")
                    .append(indent(acc)); //Close according to previous level
        }
        sb.append("}");

        return sb.toString();
    }

    public static DrillRMConfig load(final String path) throws IOException {
        final String rmConfigString = ConfigFactory
                .load(path)
                .getConfig(DRILL_EXEC_RM_CONFIG_KEY)
                .root()
                .render(ConfigRenderOptions.concise());

        return new ObjectMapper()
                .readerFor(DrillRMConfig.class)
                .readValue(rmConfigString);
    }
}
