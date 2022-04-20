## create prject


keptn create project employee-manager --shipyard=./shipyard.yaml

## create service 
cd helm-charts
tar cfvz empapp-front-service.tgz ./empapp-front-service

keptn create service empapp-front-service --project="employee-manager"
keptn add-resource --project="employee-manager" --service=empapp-front-service --all-stages --resource=./helm-charts/empapp-front-service.tgz --resourceUri=helm/empapp-front-service.tgz

## deploy the mysql helm chart in each namespaces (if you want to have an isolate database for each envirement)
helm install  mysql ./helm-charts/mysql -n employee-manager-development
helm install  mysql ./helm-charts/mysql -n employee-manager-production
## deploy the configs helm chart in each namespaces (if you want to share the default database to the to envirements)
helm install  mysql ./helm-charts/configs -n employee-manager-development
helm install  mysql ./helm-charts/configs -n employee-manager-production


## add tests
keptn add-resource --project=employee-manager --stage=development --service=empapp-front-service --resource=jmeter/load.jmx --resourceUri=jmeter/load.jmx

keptn add-resource --project=employee-manager --stage=development --service=empapp-front-service --resource=jmeter/jmeter.conf.yaml --resourceUri=jmeter/jmeter.conf.yaml
## delete service
keptn delete service empapp-front-service --project employee-manager
## trigger the service

keptn trigger delivery --project="employee-manager" --service=empapp-back-service --image="khalil4/employee-app-back" --tag=latest

## Setup Prometheus SLI provider
keptn add-resource --project=employee-manager --stage=development --service=empapp-front-service --resource=prometheus/sli.yaml --resourceUri=prometheus/sli.yaml

## Set up the quality gate 
keptn add-resource --project=employee-manager --stage=development --service=empapp-front-service --resource=slo.yaml --resourceUri=slo.yaml
