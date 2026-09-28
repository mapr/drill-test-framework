# drill-1.22-delta — Drill 1.21.2 → 1.22.0 functional delta (MD-6687)

Tests only what changed when the HPE Drill base moved from 1.21.2 (DEP-10.1.1) to Apache Drill 1.22.0
(DEP-10.2.0). New-feature tests fail on 1.21.2 and pass on 1.22.0. Keep the group as a regression
suite for every 1.22.x build. Known 1.22.0 defects live in the sibling group `drill-1.22-known-issues`,
so this group stays a clean pass/fail signal.

| Sub-suite | Ticket |
|---|---|
| functions/median | DRILL-8434 MEDIAN |
| functions/percent_change | DRILL-8433 percent_change |
| functions/regexp_extract (+negative) | DRILL-8402 native REGEXP_EXTRACT |
| functions/dns | DRILL-8413 DNS UDFs (loopback only, regex baseline) |
| json/empty_keys | DRILL-8506 (V2 reader; disabled by default in HPE distro, enabled per test) |
| json/udf_options | DRILL-8501 convert_fromJSON honours session JSON options |
| parquet/micros_bigint | DRILL-8492 TIME/TIMESTAMP_MICROS as BIGINT |
| joins/right_hash_join_empty_left | DRILL-8513 |
| xml/type_inference | DRILL-8450 (DRILL-8453 XSD is internal-only, not user-reachable) |
| hdf5/evf2 | DRILL-8188 |
| options/boot_prefix | DRILL-8502 |
| http/* | DRILL-8393 header params, DRILL-8437 HEADER_INDEX, DRILL-8524 OFFSET, DRILL-8457 csvOptions |
| sftp/basic | DRILL-8407 SFTP |

Prerequisites:
- `http/*` (category `http_mock`): gen script `Datasources/drill-1.22-delta/http_mock/setup_http.sh`
  starts a stdlib python3 mock on 127.0.0.1:18687 and registers plugin `md6687_http`.
- `sftp/*` (category `sftp`): run once as root: `bash framework/resources/Datasources/drill-1.22-delta/sftp/setup_sftp_user.sh`
  (local user `md6687sftp`, password auth over sshd). The gen script then registers `md6687_sftp`.
- After the group, run `bash framework/resources/Datasources/drill-1.22-delta/cleanup.sh` to drop the
  md6687_* plugins, so information_schema / show-schemas suites stay unaffected.

Rule: every `.e_tsv`/`.res` is derived independently (hand calculation, data file, or upstream unit-test
assertions). Each `.sql` says how, on its `-- expected:` line. Never regenerate a baseline from a
1.22 run.
