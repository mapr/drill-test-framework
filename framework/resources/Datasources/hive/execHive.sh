#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo >&2 "${1:-Usage error}"
  cat <<EOF
$0 <script_name> [<hiveconfKey=value> ...]
EOF
  exit 1
}

# --- MAIN ---
[[ $# -ge 1 ]] || usage "No arguments given"

script="$1"
script_loc="$script"
echo "$script_loc"
echo "Executing the $script_loc script"
shift

# Build -hiveconf parameters from remaining args (safe for spaces)
parameters=""
for i in "$@"; do
  parameters+=" -hiveconf $i"
done

current_time="$(date "+%Y.%m.%d-%H.%M.%S")"
log_loc="${script}-${current_time}.log"

# Detect Java major version (e.g., 8 -> 1, 11 -> 11, 17 -> 17, 21 -> 21)
if command -v java >/dev/null 2>&1; then
  # Extract the number inside quotes and take the first component before the dot
  # Examples: "1.8.0_402" -> 1, "17.0.11" -> 17, "21.0.3" -> 21
  JAVA_MAJOR="$(java -version 2>&1 | awk -F\" '/version/ {print $2}' | awk -F. '{print $1}')"
else
  echo "ERROR: java not found in PATH" >&2
  exit 1
fi

# Common MR/Map memory options
COMMON_OPTS=(
  "-hiveconf" "mapred.map.memory.mb=8096"
  "-hiveconf" "mapred.map.child.java.opts=-Xmx8000m"
  "-hiveconf" "mapreduce.map.memory.mb=8096"
  "-hiveconf" "mapreduce.map.java.opts=-Xmx8000m"
  "-hiveconf" "hive.log.file=${log_loc}"
)

# Extra JVM flags for Java 17/21 (opens + modest driver/AM/task Xmx)
EXTRA_JAVA_FLAGS='-Xmx2560m -XX:+UseParallelGC --add-opens java.base/java.lang=ALL-UNNAMED --add-opens java.base/java.net=ALL-UNNAMED --add-opens java.base/java.nio=ALL-UNNAMED --add-opens java.base/java.util=ALL-UNNAMED --add-opens java.base/java.util.concurrent.atomic=ALL-UNNAMED --add-opens java.base/java.util.regex=ALL-UNNAMED --add-opens java.base/java.time=ALL-UNNAMED'

if [[ "${JAVA_MAJOR}" == "17" || "${JAVA_MAJOR}" == "21" ]]; then
  # Java 17/21 path: add driver + Tez/MR container JVM flags
  hive -f "$script_loc" \
    $parameters \
    "${COMMON_OPTS[@]}" \
    -hiveconf "hive.exec.driver.extraJavaOptions=${EXTRA_JAVA_FLAGS}" \
    -hiveconf "tez.am.launch.cmd-opts=${EXTRA_JAVA_FLAGS}" \
    -hiveconf "tez.task.launch.cmd-opts=${EXTRA_JAVA_FLAGS}" \
    -hiveconf "yarn.app.mapreduce.am.command-opts=${EXTRA_JAVA_FLAGS}" \
    -hiveconf "mapreduce.reduce.java.opts=-Xmx8000m ${EXTRA_JAVA_FLAGS}"
else
  # Legacy path: keep original behavior (no add-opens)
  hive -f "$script_loc" \
    $parameters \
    "${COMMON_OPTS[@]}"
fi

exit 0
