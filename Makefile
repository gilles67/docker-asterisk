GITPACK_VERSION := $(shell git rev-list --full-history --all --abbrev-commit | head -1)
ASTERISK_VERSION = 20.5.0

all:
	docker build --build-arg ASTERISK_VERSION=$(ASTERISK_VERSION) -t gilles67/asterisk:latest -t gilles67/asterisk:$(ASTERISK_VERSION) -t gilles67/asterisk:$(ASTERISK_VERSION)-$(GITPACK_VERSION) ./asterisk
	docker push gilles67/asterisk:latest 
	docker push gilles67/asterisk:$(ASTERISK_VERSION)
	docker push gilles67/asterisk:$(ASTERISK_VERSION)-$(GITPACK_VERSION)
