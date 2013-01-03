#!/bin/bash

JOB_JAR=openregistry-springbatch-poc.jar
JOB_CONTEXT_FILE=jobs/xml-reader-job.xml
JOB_ID=peoplesoftInboundPersonJob
DEBUG_OPTS=" -agentlib:jdwp=transport=dt_socket,server=y,address=5000"
CMD="java -jar -Dlog4j.configuration=log4j.properties"


OUTPUT_LOG_FILE="job-output-`date +%m-%d-%y__%H_%M_%S`.log"

$CMD $JOB_JAR $JOB_CONTEXT_FILE $JOB_ID -next > $OUTPUT_LOG_FILE
