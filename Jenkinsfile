#!groovy
import groovy.json.JsonSlurperClassic
node {

    def BUILD_NUMBER=env.BUILD_NUMBER
    def RUN_ARTIFACT_DIR="tests/${BUILD_NUMBER}"
    def SFDC_USERNAME=""

    def HUB_ORG=env.HUB_ORG_DH
    def SFDC_HOST = env.SFDC_HOST_DH
    def JWT_KEY_CRED_ID = env.JWT_CRED_ID_DH
    def CONNECTED_APP_CONSUMER_KEY=env.CONNECTED_APP_CONSUMER_KEY_DH

    def toolbelt = tool 'toolbelt'

    stage('checkout source') {
        // when running in multi-branch job, one must issue this command
        checkout scm
    }
    
    withCredentials([file(credentialsId: JWT_KEY_CRED_ID, variable: 'jwt_key_file')]) {
        stage('Connect to DevHub') {

            rc = sh returnStatus: true, script: "${toolbelt}/sfdx force:auth:jwt:grant --clientid ${CONNECTED_APP_CONSUMER_KEY} --username ${HUB_ORG} --jwtkeyfile ${jwt_key_file} --setdefaultdevhubusername --instanceurl ${SFDC_HOST}"
            if (rc != 0) { error 'hub org authorization failed' }

            /*
            // need to pull out assigned username
            rmsg = sh returnStdout: true, script: "${toolbelt}/sfdx force:org:create --definitionfile config/project-scratch-def.json --json --setdefaultusername"
            printf rmsg
            def jsonSlurper = new JsonSlurperClassic()
            def robj = jsonSlurper.parseText(rmsg)
            if (robj.status != 0) { error 'org creation failed: ' + robj.message }
            SFDC_USERNAME=robj.result.username
            robj = null
            */
        }
        
        stage('Push To CI Scratch Org') {
            rc = sh returnStatus: true, script: "${toolbelt}/sfdx force:source:push -f -u ciscratch"
            if (rc != 0) {
                error 'push failed'
            }
            /*
            // assign permset
            rc = sh returnStatus: true, script: "${toolbelt}/sfdx force:user:permset:assign --targetusername ${SFDC_USERNAME} --permsetname DreamHouse"
            if (rc != 0) {
                error 'permset:assign failed'
            }
            */
        }

        stage('Run Apex Test') {
            sh "mkdir -p ${RUN_ARTIFACT_DIR}"
            timeout(time: 120, unit: 'SECONDS') {
                rc = sh returnStatus: true, script: "${toolbelt}/sfdx force:apex:test:run --testlevel RunLocalTests --outputdir tests/xxx --resultformat tap -u ciscratch"
                junit keepLongStdio: true, testResults: 'tests/**/*-junit.xml'
                if (rc != 0) {
                    error 'apex test run failed'
                }
            }
        }
        
        stage('Deploy to Integration Org') {
            sh "rm -Rf metadata"
            rc = sh returnStatus: true, script: "${toolbelt}/sfdx force:source:convert -d metadata"
            if (rc != 0) {
                error 'metadata conversion failed'
            }
            rc = sh returnStatus: true, script: "${toolbelt}/sfdx force:mdapi:deploy -d metadata/ -u joi+swtt19_ci1@salesforce.com -w 100"
            if (rc != 0) {
                error 'deploy integration org failed'
            }
        }

    }
}