NAME := jenkins-resources
CHART_DIR := charts/${NAME}

CHART_REPO := gs://jenkinsxio/charts

all: build

build: clean
	rm -rf Chart.lock
	#helm dependency build
	helm lint ${CHART_DIR}

install: clean build
	helm install . --name ${NAME}

upgrade: clean build
	helm upgrade ${NAME} .

delete:
	helm delete --purge ${NAME}

clean:
	rm -rf ${NAME}*.tgz

release: clean
	helm repo add jx3 $(CHART_REPO)
	cd ${CHART_DIR} && helm dependency build && helm lint && helm package . && helm gcs push ${NAME}*.tgz jx3 --public && rm -rf ${NAME}*.tgz%

test:
	cd tests && go test -v

test-regen:
	cd tests && export HELM_UNIT_REGENERATE_EXPECTED=true && go test -v

