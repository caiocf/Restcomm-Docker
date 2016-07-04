#!/bin/bash

function jsonval {
    temp=`cat /etc/container_environment.json | sed 's/\\\\\//\//g' | sed 's/[{}]//g' | awk -v k="text" '{n=split($0,a,","); for (i=1; i<=n; i++) print a[i]}' | sed 's/\"\:\"/\|/g' | sed 's/[\,]/ /g' | sed 's/\"//g' | grep -w $1`
    if [ $? -eq 0 ];then
    IFS=':' read ar1 ar2 <<<$temp
    echo "$ar2 > /etc/container_environment/$ar1"
    echo -e "$ar2" | xargs > /etc/container_environment/$ar1

    fi
}

## declare an array variable
vars="ENVCONFURL
REPOUSR
REPOPWRD
RESTCOMM_LOGS
MEDIASERVER_LOGS_LOCATION
STATIC_ADDRESS
USE_STANDARD_HTTP_PORTS
USE_STANDARD_SIP_PORTS
OUTBOUND_PROXY
OUTBOUND_PROXY_USERNAME
OUTBOUND_PROXY_PASSWORD
MEDIASERVER_LOWEST_PORT
MEDIASERVER_HIGHEST_PORT
LOCALMGCP
REMOTEMGCP
PROVISION_PROVIDER
DID_LOGIN
DID_PASSWORD
DID_ENDPOINT
DID_SITEID
DID_ACCOUNTID
INTERFAX_USER
INTERFAX_PASSWORD
ISPEECH_KEY
VOICERSS_KEY
ACAPELA_APPLICATION
ACAPELA_LOGIN
ACAPELA_PASSWORD
ACTIVATE_S3_BUCKET
S3_BUCKET_NAME
S3_ACCESS_KEY
S3_SECURITY_KEY
S3_BUCKET_REGION
HSQL_PERSIST
SMTP_USER
SMTP_PASSWORD
SMTP_HOST
ENABLE_MYSQL
MYSQL_USER
MYSQL_PASSWORD
MYSQL_HOST
MYSQL_SNDHOST
MYSQL_SCHEMA
RVD_LOCATION
RVD_PORT
LOG_LEVEL
AKKA_LOG_LEVEL
LOG_LEVEL_COMPONENT_GOVNIST
LOG_LEVEL_COMPONENT_SIPSERVLET
CORE_LOGS_LOCATION
MEDIASERVER_LOGS_LOCATION
RESTCOMM_TRACE_LOG
RESTCOMM_HOSTNAME
TRUSTSTORE_PASSWORD
TRUSTSTORE_ALIAS
SECURESSL
SSL_MODE
CERTCONFURL
CERTREPOUSR
CERTREPOPWRD
SMPP_ACTIVATE
SMPP_TYPE
SMPP_ID
SMPP_PASSWORD
SMPP_PEER_IP
SMPP_PEER_PORT
SMPP_SOURCE_MAP
SMPP_DEST_MAP
NET_INTERFACE
MS_COMPATIBILITY_MODE
MS_ADDRESS
MS_SUBNET_MASK
MS_NETWORK
RECORDINGS_PATH
MEDIASERVER_EXTERNAL_ADDRESS
PORT_OFFSET
PLAY_WAIT_MUSIC
USESBC
PROD_MODE
INIT_PASSWORD
ACTIVATE_LB
LB_PUBLIC_IP
LB_INTERNAL_IP
LB_SIP_PORT_UDP
LB_SIP_PORT_TCP
LB_SIP_PORT_TLS
LB_SIP_PORT_WS
LB_SIP_PORT_WSS
LB_RMI_PORT
DTMFDBI
RC_JAVA_OPTS
RMS_JAVA_OPTS
MGMT_PASS
MGMT_USER
GRAYLOG_SERVER
SERVERLABEL
HD_MONITOR
RCJVM_MONITOR
RMSJVM_MONITOR
RAM_MONITOR"

for variable in $vars  # Note: No quotes
do
  jsonval $variable
done

