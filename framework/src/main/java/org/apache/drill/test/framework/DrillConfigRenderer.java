package org.apache.drill.test.framework;

import com.google.common.base.Preconditions;

import java.util.List;
import java.util.stream.IntStream;

/**
 * This interface should be used by any class that represents a Drill configuration.
 * The interface defines an implementation for serializing the configuration to HOCON.
 *
 * {@link com.typesafe.config.Config} does not have a way to serialize to HOCON format,
 * which is used by Drill. Hence, it is necessary for the config class to implement this.
 *
 * See http://github.com/lightbend/config/issues/453 for more information.
 *
 * @see DrillRMConfig
 * @see DrillRMConfig.SelectorConfig
 * @see DrillRMConfig.QueueConfig
 * @see DrillRMConfig.AclConfig
 *
 */
public interface DrillConfigRenderer {

    /**
     * Returns a representation of the instance in HOCON format.
     * This method should be used when indentation does not matter.
     *
     * @return serialized representation of the class in HOCON format.
     */
    String render();

    /**
     * Returns a representation of the instance in HOCON format.
     * This method should be used when an instance has to be serialized with indentation.
     * Mostly for better readability.
     * @param acc indentation in terms of number of spaces.
     *
     * @return serialized representation of the class in HOCON format.
     */
    String render(final int acc);

    /**
     * Defines the format to serialize a config key and value to HOCON format.
     * The method assumes that there are more configurations to follow.
     * Hence introduces a "comma (,)" at the very end. If it is the last field,
     * the caller has to ensure to remove it.
     *
     * @param acc indentation in terms of number of spaces.
     * @param configKey configuration key
     * @param configVal configuration value
     * @param <K> type of the key
     * @param <V> type of the value
     * @return formatted string for a config key-value pair, in HOCON format.
     */
    default <K, V> String formatConfig(final int acc,
                                final K configKey,
                                final V configVal) {
        Preconditions.checkNotNull(configKey, "config key cannot be null!");
        Preconditions.checkNotNull(configVal, "config value cannot be null!");

        String prefixIndent = indent(acc); //indentation prefix

        StringBuilder sb = new StringBuilder(prefixIndent)
                .append(configKey)
                .append(":");

        //String should be within "double quotes".
        if (configVal instanceof String) {
            sb.append("\"")
                    .append(configVal)
                    .append("\"");
        } else if (configVal instanceof DrillConfigRenderer) {
            //If DrillConfigRenderer type, call render.
            sb.append(((DrillConfigRenderer) configVal).render(acc));
        } else {
            sb.append(configVal);
        }

        sb.append(",");
        return sb.append("\n").toString();
    }

    /**
     * Defines the format to serialize a config key and value to HOCON format
     * where config value is of type {@link List} .
     * The method assumes that there are more configurations to follow.
     * Hence introduces a "comma (,)" at the very end. If it is the last field,
     * the caller has to ensure to remove it.
     * @param acc
     * @param configKey
     * @param configVal
     * @param <K>
     * @param <V>
     * @return formatted string for a config key-value pair, in HOCON format.
     */
    default <K, V> String formatConfig(final int acc,
                                    final K configKey,
                                    final List<V> configVal) {
        Preconditions.checkNotNull(configKey, "config key cannot be null!");
        Preconditions.checkNotNull(configVal, "config value cannot be null!");

        String prefixIndent = indent(acc); //indentation prefix

        StringBuilder sb = new StringBuilder(prefixIndent)
                .append(configKey)
                .append(":")
                .append("["); //begin square brackets for list

        if(configVal.isEmpty()) { //if empty, close and return
            return sb.append("]").append(",").append("\n").toString();
        }

        if (configVal.get(0) instanceof String) {
            configVal.forEach(val -> sb.append("\"")
                            .append(val)
                            .append("\"").append(","));
            sb.deleteCharAt(sb.length()-1).append("]").append(",");
        } else if (configVal.get(0) instanceof DrillConfigRenderer) {
            //Handle values of type DrillConfigRenderer separately
            //Unlike other types, each value will be rendered in a new line.
            IntStream
                    .range(0, configVal.size()-1)
                    .forEach(index ->
                            sb.append(((DrillConfigRenderer) configVal.get(index)).render(acc+2))
                                    .append(",")
                                    .append("\n")
                                    .append(indent(acc+2)));

            sb.append(((DrillConfigRenderer) configVal.get(configVal.size()-1)).render(acc+2))
                    .append("\n").append(prefixIndent).append("]").append(",");
        } else {
            configVal.forEach(val -> sb.append(val).append(","));
            sb.deleteCharAt(sb.length()-1).append("]").append(",");
        }
        return sb.append("\n").toString();
    }

    /**
     * Return a String with specified indentation. This can be used as a prefix.
     * @param acc indentation in terms of number of spaces or length of the String.
     * @return a String of specified length, containing spaces.
     */
    default String indent(final int acc) {
        Preconditions.checkArgument(acc >= 0,
                "Number of acc for indentation cannot be negative!");
        StringBuilder sb = new StringBuilder();
        IntStream.range(0, acc).forEach(i -> sb.append(" "));
        return sb.toString();
    }

}