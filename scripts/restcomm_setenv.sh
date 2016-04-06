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
SECURESSL
MEDIASERVER_LOGS_LOCATION
STATIC_ADDRESS
USE_STANDARD_HTTP_PORTS
USE_STANDARD_SIP_PORTS
OUTBOUND_PROXY
NEXMO_SMPP_TYPE
OUTBOUND_PROXY_USERNAME
OUTBOUND_PROXY_PASSWORD
MEDIASERVER_LOWEST_PORT
MEDIASERVER_HIGHEST_PORT
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
SMPP_TYPE
S3_BUCKET_NAME
S3_ACCESS_KEY
S3_SECURITY_KEY
HSQL_PERSIST
SMTP_USER
SMTP_PASSWORD
SMTP_HOST
MYSQL_USER
MYSQL_PASSWORD
MYSQL_HOST
MYSQL_SNDHOST
MYSQL_SCHEMA
SSL_MODE
RVD_LOCATION
LOG_LEVEL
CORE_LOGS_LOCATION
MEDIASERVER_LOGS_LOCATION
RESTCOMM_TRACE_LOG
RESTCOMMHOST
SECURE
TRUSTSTORE_PASSWORD
TRUSTSTORE_ALIAS
SECURE
CERTCONFURL
CERTREPOUSR
CERTREPOPWRD
DERCONFURL
DERREPOUSR
DERREPOPWRD
GENERIC_SMPP_TYPE
GENERIC_SMPP_ID
GENERIC_SMPP_PASSWORD
GENERIC_SMPP_PEER_IP
GENERIC_SMPP_PEER_PORT
GENERIC_SMPP_SOURCE_MAP
GENERIC_SMPP_DEST_MAP
LOAD_BALANCERS
NET_INTERFACE
MS_ADDRESS
MS_SUBNET_MASK
MS_NETWORK
MEDIASERVER_EXTERNAL_ADDRESS
PORT_OFFSET
USESBC
PROD_MODE
INIT_PASSWORD
DTMFDBI"


for variable in $vars  # Note: No quotes
do
  jsonval $variable
done





