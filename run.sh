#export MAVEN_OPTS=$MAVEN_OPTS" -agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5006"
mvn exec:java -Djava.security.auth.login.config=/opt/mapr/conf/mapr.login.conf -Dzookeeper.sasl.client=false -Dexec.mainClass="org.apache.drill.test.framework.TestDriver" -Dexec.args="$*" -Dexec.classpathScope=compile
