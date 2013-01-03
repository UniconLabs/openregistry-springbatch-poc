#!/bin/bash

BATCH_JAR_NAME=openregistry-springbatch-poc.jar

rm target/$BATCH_JAR_NAME
mvn clean package
cp target/$BATCH_JAR_NAME dist