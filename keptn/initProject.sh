#!/usr/bin/env bash

PROJECT="pod-tato-head"
IMAGE="khalil4/employee-app-back"
VERSION="$2"

case "$1" in
  "create-project")
    echo "Creating keptn project $PROJECT"
    echo keptn create project "${PROJECT}" --shipyard=./shipyard.yaml   
    keptn create project "${PROJECT}" --shipyard=./shipyard.yaml
    ;;
  "onboard-service")
    echo "Onboarding keptn service backendservice in project ${PROJECT}"
    keptn onboard service backendservice --project="${PROJECT}" --chart=helm-charts/backendservice
    ;;
  "first-deploy-service")
    echo "Deploying keptn service backendservice in project ${PROJECT}"
    keptn trigger delivery --project="${PROJECT}" --service=backendservice --image="${IMAGE}" --tag=latest
    ;;
  "deploy-service")
    echo "Deploying keptn service backendservice in project ${PROJECT}"
    echo keptn trigger delivery --project="${PROJECT}" --service=backendservice --image="${IMAGE}" --tag=v"${VERSION}"
    keptn trigger delivery --project="${PROJECT}" --service=backendservice --image="${IMAGE}" --tag=v"${VERSION}"
    ;;    
  "upgrade-service")
    echo "Upgrading keptn service backendservice in project ${PROJECT}"
    keptn trigger delivery --project="${PROJECT}" --service=backendservice --image="${IMAGE}" --tag=v0.1.0
    ;;
  "slow-build")
    echo "Deploying slow build version of backendservice in project ${PROJECT}"
    keptn trigger delivery --project="${PROJECT}" --service=backendservice --image="${IMAGE}" --tag=v0.1.2
    ;;
  "add-quality-gates")
    echo "Adding keptn quality-gates to project ${PROJECT}"
    keptn add-resource --project=pod-tato-head --stage=hardening --service=backendservice --resource=prometheus/sli.yaml --resourceUri=prometheus/sli.yaml
    keptn add-resource --project=pod-tato-head --stage=hardening --service=backendservice --resource=slo.yaml --resourceUri=slo.yaml
    ;;
  "add-jmeter-tests")
    echo "Adding jmeter load tests to project ${PROJECT}"
    keptn add-resource --project=pod-tato-head --stage=hardening --service=backendservice --resource=jmeter/load.jmx --resourceUri=jmeter/load.jmx
    keptn add-resource --project=pod-tato-head --stage=hardening --service=backendservice --resource=jmeter/jmeter.conf.yaml --resourceUri=jmeter/jmeter.conf.yaml
    ;;
esac
