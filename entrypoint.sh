#!/bin/bash

cd  /site/

/usr/bin/java -jar target/dependency/webapp-runner.jar target/*.war
