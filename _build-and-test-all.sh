#! /bin/bash

set -e


. ./set-env-${DATABASE?}.sh

./gradlew testClasses

dockercdc="./gradlew ${DATABASE?}cdcCompose"
dockerall="./gradlew ${DATABASE?}Compose"

${dockerall}Down
${dockercdc}Build
${dockercdc}Up

sleep 20

./gradlew -x :end-to-end-tests:test build

${dockerall}Build
${dockerall}Up

sleep 20

./gradlew :end-to-end-tests:cleanTest :end-to-end-tests:test

${dockerall}Down