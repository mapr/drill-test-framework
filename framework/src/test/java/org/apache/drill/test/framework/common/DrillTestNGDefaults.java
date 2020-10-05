package org.apache.drill.test.framework.common;

import org.apache.drill.test.framework.DrillTestDefaults;

public final class DrillTestNGDefaults {
    public static final String FUNCTIONAL_GROUP = "functional";
    public static final String UNIT_GROUP = "unit";
    public static final String PROD_RM_CONFIG_FILEPATH =
            DrillTestDefaults.CWD + "/src/test/resources/prod-rm.conf";
    public static final String BASIC_RM_CONFIG_FILEPATH =
            DrillTestDefaults.CWD + "/src/test/resources/basic-rm.conf";
    public static final String DEFAULT_RM_CONFIG_FILEPATH =
            DrillTestDefaults.CWD + "/src/test/resources/default-rm.conf";

    public static String CONNECTION_URL_FOR_DRILLBIT(final String hostnameOrIp) {
        return String.format("jdbc:drill:drillbit=%s", hostnameOrIp);
    }
    public static final String NO_RESOURCE_POOL_ERROR = "No resource pools to choose from for the query";
    public static final String TPCH_01_PARQUET_SCHEMA = "dfs.drilltestdirtpch01parquet";
}
