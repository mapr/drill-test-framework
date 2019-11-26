package org.apache.drill.test.framework;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonTypeName;

import java.util.List;

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonTypeName("queryProfile")
public class DrillQueryProfile {
    public String user;

    @JsonProperty("start")
    public long queryStartTime;

    @JsonProperty("end")
    public long queryEndTime;

    @JsonProperty("foreman")
    public Endpoint foreman;

    @JsonProperty("state")
    public String rootState;
    public int totalFragments;
    public int finishedFragments;

    @JsonProperty("planEnd")
    public long planEndTime;

    @JsonProperty("queueWaitEnd")
    public long queueWaitEndTime;
    public long totalCost;
    public String queueName;
    public String queryId;

    @JsonProperty("fragmentProfile")
    public List<MajorFragmentProfile> fragmentProfiles;

    @Override
    public String toString() {
        String ret = "DrillQueryProfile(" +
                "user=\"" + user + "\", " +
                "queryStartTime=" + queryStartTime + ", " +
                "queryEndTime=" + queryEndTime + ", " +
                "foreman=" + foreman + ", " +
                "rootState=\"" + rootState + "\", " +
                "totalFragments=" + totalFragments + ", " +
                "finishedFragments=" + finishedFragments + ", " +
                "planEndTime=" + planEndTime + ", " +
                "queueWaitEndTime=" + queueWaitEndTime + ", " +
                "totalCost=" + totalCost + ", " +
                "queueName=\"" + queueName + "\", " +
                "queryId=\"" + queryId + "\", ";
        StringBuilder sb = new StringBuilder(ret);
        if (fragmentProfiles != null) {
            sb.append("fragmentProfile=[");
            fragmentProfiles.forEach(frag -> sb.append(frag).append(", "));
            if(fragmentProfiles.size() > 0) {
                sb.deleteCharAt(sb.length() - 1).deleteCharAt(sb.length() - 1);
            }
            sb.append("])");
        }
        return sb.toString();
    }

    @JsonIgnoreProperties(ignoreUnknown = true)
    @JsonTypeName("endpoint")
    public static class Endpoint {
        public String address;
        public String userPort;
        public String controlPort;
        public String dataPort;
        public String version;

        @JsonProperty("state")
        public String foremanState;

        @Override
        public String toString() {
            return "Endpoint(" +
                    "address=\"" + address + "\", " +
                    "userPort=\"" + userPort + "\", " +
                    "controlPort=\"" + controlPort + "\", " +
                    "dataPort=\"" + dataPort + "\", " +
                    "version=\"" + version + "\", " +
                    "foremanState=\"" + foremanState + "\") ";
        }

    }

    @JsonIgnoreProperties(ignoreUnknown = true)
    @JsonTypeName("fragmentProfile")
    public static class MajorFragmentProfile {
        public int majorFragmentId;

        @JsonProperty("minorFragmentProfile")
        public List<MinorFragmentProfile> minorFragmentProfiles;

        @Override
        public String toString() {
            StringBuilder sb = new StringBuilder("MajorFragmentProfile(");
            if(minorFragmentProfiles != null) {
                sb.append("minorFragmentProfile=[");
                minorFragmentProfiles.forEach(frag -> sb.append(frag).append(", "));
                if(minorFragmentProfiles.size() > 0) {
                    sb.deleteCharAt(sb.length() - 1).deleteCharAt(sb.length() - 1);
                }
                sb.append("], ");
            }
            sb.append("majorFragmentId=").append(majorFragmentId).append(")");
            return sb.toString();
        }
    }

    @JsonIgnoreProperties(ignoreUnknown = true)
    @JsonTypeName("minorFragmentProfile")
    public static class MinorFragmentProfile {

        @JsonProperty("operatorProfile")
        public List<OperatorProfile> operatorProfiles;
        public long startTime;
        public long endTime;
        public long memoryUsed;
        public long maxMemoryUsed;

        @JsonProperty("endpoint")
        public Endpoint endpoint;

        @Override
        public String toString() {
            StringBuilder sb = new StringBuilder("MinorFragmentProfile(");
            if(operatorProfiles != null) {
                sb.append("operatorProfile=[");
                operatorProfiles.forEach(op -> sb.append(op).append(", "));
                if(operatorProfiles.size() > 0) {
                    sb.deleteCharAt(sb.length() - 1).deleteCharAt(sb.length() - 1);
                }
                sb.append("], ");
            }
            sb.append("startTime=").append(startTime).append(", ")
                    .append("endTime=").append(endTime).append(", ")
                    .append("memoryUsed=").append(memoryUsed).append(", ")
                    .append("maxMemoryUsed=").append(maxMemoryUsed).append(", ")
                    .append("endpoint=").append(endpoint).append(")");
            return sb.toString();
        }
    }

    @JsonIgnoreProperties(ignoreUnknown = true)
    @JsonTypeName("operatorProfile")
    public static class OperatorProfile {

        @JsonProperty("inputProfile")
        public List<OperatorInputProfile> inputProfiles;
        public int operatorId;
        public int operatorType;
        public long setupNanos;
        public long processNanos;
        public long peakLocalMemoryAllocated;
        public long waitNanos;

        @Override
        public String toString() {
            StringBuilder sb = new StringBuilder("OperatorProfile(");
            if(inputProfiles != null) {
                sb.append("inputProfile=[");
                inputProfiles.forEach(input -> sb.append(input).append(", "));
                if(inputProfiles.size() > 0) {
                    sb.deleteCharAt(sb.length() - 1).deleteCharAt(sb.length() - 1);
                }
                sb.append("], ");
            }
            sb.append("operatorId=").append(operatorId).append(", ")
                    .append("operatorType=").append(operatorType).append(", ")
                    .append("setupNanos=").append(setupNanos).append(", ")
                    .append("processNanos=").append(processNanos).append(", ")
                    .append("peakLocalMemoryAllocated=").append(peakLocalMemoryAllocated).append(", ")
                    .append("waitNanos=").append(waitNanos).append(")");
            return sb.toString();
        }
    }

    @JsonIgnoreProperties(ignoreUnknown = true)
    @JsonTypeName("inputProfile")
    public static class OperatorInputProfile {
        public long records;
        public long batches;
        public int schemas;

        @Override
        public String toString() {
            return "OperatorInputProfile(" +
                    "records=" + records + ", " +
                    "batches=" + batches + ", " +
                    "schemas=" + schemas + ") ";

        }
    }
}


