// Config
class Globals {
   static String GitRepo = 'D:/GIT_REPOS/PSYamahaMusicCast'
   static String ModuleName = 'PSYamahaMusicCast'
   static String GoogleChatRoomNotifyUrl = 'https://chat.googleapis.com/v1/spaces/AAAABeHM4ps/messages?key=AIzaSyDdI0hCZtE6vySjMm-WEfRq3CPzqKqqsHI&token=Z-ocTb9Zu-QCUM-rEPBVxTCBLqI9S34AVDPuAX5GtUo%3D'
}

// Workflow Steps
node('master') {
  try {
    notifyBuild('STARTED')

    stage('Stage 0: Clone') {
      git url: Globals.GitRepo
    }
    stage('Stage 1: InstallDependencies') {
      posh 'Invoke-Build InstallDependencies'
    }
    stage('Stage 2: Clean') {
      posh 'Invoke-Build Clean'
    }
    stage('Stage 3: Test') {
      posh 'Invoke-Build Test'
    }
    stage('Stage 3: Analyze') {
      posh 'Invoke-Build Analyze'
    }
    stage('Stage 4: Publish') {
      timeout(20) {
        posh 'Invoke-Build Publish'
      }
    }

  } catch (e) {
    currentBuild.result = "FAILED"
    throw e
  } finally {
    notifyBuild(currentBuild.result)
  }
}

// Helper function to run PowerShell Commands
def posh(cmd) {
    bat 'powershell.exe -NonInteractive -NoProfile -ExecutionPolicy Bypass -Command "& ' + cmd + '"'
}

// Helper function to Broadcast Build to Slack
def notifyBuild(String buildStatus = 'STARTED') {

    buildStatus = buildStatus ?: 'SUCCESSFUL'

    def colorCode = '#FF0000' // Failed : Red
    if (buildStatus == 'STARTED')
    { colorCode = '#FFFF00' 
    } // STARTED: Yellow
    else if (buildStatus == 'SUCCESSFUL')
    { colorCode = '#00FF00' 
    } // SUCCESSFUL: Green

    def subject = "${buildStatus}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'"
    def summary = "${subject} (${env.BUILD_URL})"
  
    googlechatnotification url: "${Globals.GoogleChatRoomNotifyUrl}" , 
    message: "Status of pipeline: ${currentBuild.fullDisplayName} has result ${currentBuild.result}.\n<${env.BUILD_URL}|Link to result>",
    notifyAborted: 'true', notifyFailure: 'true', notifyNotBuilt: 'true', 
    notifySuccess: 'true', notifyUnstable: 'true', notifyBackToNormal: 'true', 
    suppressInfoLoggers: 'true', sameThreadNotification: 'true'
  
    //slackSend (color: colorCode, channel: "${Globals.JenkinsChannel}", message: summary)
}
