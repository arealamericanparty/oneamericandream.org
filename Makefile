MAKEFILE := $(lastword $(MAKEFILE_LIST))
include Makefile.properties
export $(shell sed 's/=.*//' Makefile.properties)
.IGNORE:
.PHONY: help

##
##   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
##   |A|R|e|a|l|A|m|e|r|i|c|a|n|.|O|r|g|
##   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
##

deploy:			## deploys site
	@aws s3 sync . s3://arealamericanparty.org --include "*.html, *.PNG" --exclude "*"

help:## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'


##
.DEFAULT_GOAL := help
