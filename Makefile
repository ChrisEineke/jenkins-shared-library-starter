SHELL:=/usr/bin/env bash
DEFAULT_GOAL:=build
GRADLE:=build/gradle-3.0/bin/gradle

.PHONY: deps build test clean

deps:
	@if [[ -z "$(command -v gradle)" && ! -x ${GRADLE} ]]; then \
		mkdir -p build; \
		pushd build; \
		wget https://services.gradle.org/distributions/gradle-3.0-bin.zip; \
		unzip gradle-3.0-bin.zip; \
		popd; \
	fi

build:
	@${GRADLE} build

test:
	@${GRADLE} test

clean:
	@${GRADLE} clean

