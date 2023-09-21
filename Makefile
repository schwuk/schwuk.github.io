PODMAN = $(shell which podman)
PWD = $(shell pwd)
RUN = ${PODMAN} run --rm --volume="${PWD}:/src/site" --volume="${PWD}/vendor/bundle:/usr/local/bundle" -p 4000:4000 -it localhost/gh-pages-site:latest

#COLORS
GREEN  := $(shell tput -Txterm setaf 2)
WHITE  := $(shell tput -Txterm setaf 7)
YELLOW := $(shell tput -Txterm setaf 3)
RESET  := $(shell tput -Txterm sgr0)

# Add the following 'help' target to your Makefile
# And add help text after each target name starting with '\#\#'
# A category can be added with @category
HELP_FUN = \
    %help; \
    while(<>) { push @{$$help{$$2 // 'options'}}, [$$1, $$3] if /^([a-zA-Z\-]+)\s*:.*\#\#(?:@([a-zA-Z\-]+))?\s(.*)$$/ }; \
    print "usage: make [target]\n\n"; \
    for (sort keys %help) { \
    print "${WHITE}$$_:${RESET}\n"; \
    for (@{$$help{$$_}}) { \
    $$sep = " " x (32 - length $$_->[0]); \
    print "  ${YELLOW}$$_->[0]${RESET}$$sep${GREEN}$$_->[1]${RESET}\n"; \
    }; \
    print "\n"; }

.PHONY: help
help: ##@other Show this help.
	@perl -e '$(HELP_FUN)' $(MAKEFILE_LIST)

serve: ##@development Builds your site any time a source file changes and serves it locally
	@${RUN} jekyll serve -H 0.0.0.0 -P 4000

serve-with-drafts: ##@development Builds your site with drafts enabled any time a source file changes and serves it locally
	@${RUN} jekyll serve -H 0.0.0.0 -P 4000 --drafts

build: ##@development Performs a one off build your site to ./_site
	@${RUN} jekyll build

build-with-drafts: ##@development Performs a one off build your site with drafts enabled to ./_site
	@${RUN} jekyll build --drafts

clean:  ##@development Remove cached gems
	@rm -rf vendor/bundle

init: clean ##@development Setup the environment
	@rm -rf vendor/bundle
	@mkdir -p vendor/bundle
	@${RUN} gem update bundler
	@${RUN} bundle install

update: ##@development Update your gems to the latest available versions
	@${RUN} bundle update

versions: ##@development List dependency versions
	@${RUN} bundle exec github-pages versions

health-check: ##@development Perform health-check
	@${RUN} bundle exec github-pages health-check

shell: ##@development Interactive shell
	@${RUN} /bin/sh