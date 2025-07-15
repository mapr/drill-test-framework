/*
    Walks through interfaces that match '192.168.x.x' and finds a free one
    returns network ip prefix in the following format: '192.168.xx.'
    throws exception if no matching network found
*/
String getFreeNetworkIpPrefix() {
    foundIps = getExistingIps()
    for (int x = 34; x < 256; x++) {
        String candidate = """192.168.$x.1"""
        if (!foundIps.contains(candidate)) {
            return """192.168.$x."""
        }
    }
    throw new RuntimeException("Cannot find a free ip address")
}

List<String> getExistingIps() {
    List<String> result = new ArrayList<>()
    lines = sh returnStdout: true, script: 'ifconfig | grep 192.168.'

    for (String line in lines.split('\n')) {
        result.add(line.trim().split("\\s+")[1])
    }
    return result
}

String findInterfaceNameByIp(String ip) {
    String result = sh returnStdout: true, script: """ip route | grep $ip | cut -d' ' -f3"""
    return result == null ? "" : result.trim()
}

List<String> getVirtualNetworkNames() {
    List<String> result = new ArrayList<>()
    activeNetworks = sh returnStdout: true, script: 'virsh net-list | grep active'

    for (String line in activeNetworks.split('\n')) {
        String name = line.trim().split("\\s+")[0]
        result.add(name)
    }
    return result
}

String findVirtualNetworkName(String bridgeName) {
    for(String netName in getVirtualNetworkNames()) {
        String netBridgeNameLine = sh returnStdout: true, script: """virsh net-info $netName | grep Bridge"""
        if (netBridgeNameLine.split(":").length > 0 && bridgeName == netBridgeNameLine.split(":")[1].trim()) {
            return netName
        }
    }
    return ""
}

/*
    Destroys network by its ip address in format 192.168.33.1
 */
def destroyVirtualNetworkByIp(String ip) {
    String bridgeName = findInterfaceNameByIp(ip)

    if (bridgeName.length() == 0) {
        echo """No interface for $ip found"""
        return
    }

    String networkName = findVirtualNetworkName(bridgeName)
    if (networkName.length() == 0) {
        echo """No virtual network for bridge $bridgeName found"""
        return
    }

    sh """virsh net-destroy $networkName"""
}

def removeHostFromKnownHosts(String hostName) {
    sh """ssh-keygen -R $hostName"""
}

def slack_send(status, info) {
    def color = ''

    if (status == null) {
        status = 'SUCCESS'
        color = 'good'
    }

    if (status == 'UNSTABLE') {
        color = 'warning'
    }

    if (status == 'FAILURE') {
        color = 'danger'
    }

    if (status == 'STARTED') {
        color = 'good'
    }

    slackSend(
            channel: 'hive_ats_jenkins_reports',
            teamDomain: 'cybervisiontech',
            tokenCredentialId: 'hive_ats_jenkins',
            color: "${color}",
            message: "Job finished ${env.JOB_NAME} [<${env.BUILD_URL}|${env.BUILD_NUMBER}>] ${status}\n" +
                    "${info}")
}

def cloneDrillTests(branch) {
    String repoName = "drill-test-framework"
    String repoUrl = "git@github.com:mapr/${repoName}.git"
    String targetDir = "${repoName}"
    String testBranch = "${branch}"

    steps.echo "DEBUG: Cloning repository: ${repoName}"
    steps.echo "DEBUG: Repository URL: ${repoUrl}"
    steps.echo "DEBUG: Target directory: ${targetDir}"
    steps.echo "DEBUG: Branch: ${testBranch}"

    steps.sh "mkdir -p ${targetDir}"

    steps.dir(targetDir) {
        steps.git branch: testBranch,
                credentialsId: 'wildass-ssh',
                changelog: false,
                poll: false,
                url: repoUrl
    }

    steps.sh "ls -la ${targetDir}"
    steps.echo "DEBUG: Repository cloned successfully to ${targetDir}"
}

return this