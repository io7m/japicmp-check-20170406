#!/bin/sh -ex

CURRENT_DIR=`pwd`

cd "${CURRENT_DIR}"
cd old
mvn clean package

cd "${CURRENT_DIR}"
cd new
mvn clean package

cd "${CURRENT_DIR}"
java \
  -jar $HOME/.m2/repository/com/github/siom79/japicmp/japicmp/0.10.1-SNAPSHOT/japicmp-0.10.1-SNAPSHOT-jar-with-dependencies.jar \
  --old old/target/japicmp-check-20170406-1.0.1.jar \
  --new new/target/japicmp-check-20170406-1.0.1.jar \
  --html-file report.html

