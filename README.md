openregistry-springbatch-poc
=======================

This project is a proof of concept showing how to use Spring Batch to feed identity data into Jasig Open Registry.
A sample ERP XML data extract is read in via a Spring Batch job and is processed against OpenRegistry APIs ultimately
populating that OpenRegistry database schema.

Open Registry
https://wiki.jasig.org/display/OR/Home

Spring Batch
http://static.springsource.org/spring-batch/

## Install Oracle jdbc driver into a local maven repository

* Download the driver's jar

* `mvn install:install-file -Dfile=ojdbc6.jar -DgroupId=com.oracle -DartifactId=ojdbc6 -Dversion=11.2.0 -Dpackaging=jar`

## Build and install openregistry 0.9.2-SNAPSHOT jars into a local maven repository

* Check out from Open Registry JASIG SVN repository

* At the root of the project directory run: `mvn clean install`

## Prepare the Open Registry and Spring Batch database tables

* Create an Oracle schema to house Open Registry and Spring Batch tables

* Run DDL scripts to create Open Registry tables

* Run DDL script to create Spring Batch tables

* Run DML scripts to populate necessary Open Registry reference data tables
** See etc/dml/

## Download and configure batch project

* Either clone or download from Github the spring batch project into `/opt/source/openregistry-springbatch-poc`

* Create configuration directory `/etc/openregistry`

* Copy `/opt/source/openregistry-springbatch-poc/etc/*` to `/etc/openregistry`

* Configure datasource related properties in `/etc/openregistry/config/openregistry.properties`

* The example input file from ERP that the batch job is configured with is located here:
   `/etc/openregistry/input/openRegLoad.xml`

## Build and run the batch job

* Build the batch job executable jar from `/opt/source/openregistry-springbatch-poc` directory: `./build.sh`

* Go to `/opt/source/openregistry-springbatch-poc/dist`

* Run the batch job: `./run_ps_to_or_batch.sh`

After the batch job execution finishes, the log files for that run will be produced in that directory with the
timestamp of the job execution invocation. At this point, examine the log file for the job execution status, any
produced errors, etc. Also, on the successful execution, the data should be available in the Open Registry database
in both `system of record` form as well as `calculated` form (PRS_* and PRC_* tables respectively)

