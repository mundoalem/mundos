# ######################################################################################################################
# LICENSE
# ######################################################################################################################

#
# This file is part of mundOS.
#
# The mundOS is free software: you can redistribute it and/or modify it under the terms of the GNU Affero
# General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your
# option) any later version.
#
# The mundOS is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along with mundOS. If not, see
# <https://www.gnu.org/licenses/>.
#

# ######################################################################################################################
# VARIABLES
# ######################################################################################################################

#
# Make
#

SHELL := /bin/bash

#
# Directories
#

ROOT_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
SRC_DIR := $(abspath ${ROOT_DIR}/src)

#
# Project: General
#

PROJECT_BUILD_DATE ?= $(shell date --rfc-3339=seconds)
PROJECT_COMMIT ?= $(shell git rev-parse HEAD)
PROJECT_NAME ?= $(error PROJECT_NAME is not set)
PROJECT_VERSION ?= $(strip \
	$(if \
		$(shell git rev-list --tags --max-count=1), \
		$(shell git describe --tags `git rev-list --tags --max-count=1`), \
		$(shell git rev-parse --short HEAD) \
	) \
)

# ######################################################################################################################
# TARGETS
# ######################################################################################################################

.PHONY: all
all: lint scan build test

.PHONY: build
build:
	@echo "Not yet implemented."

.PHONY: clean
clean:
	@echo "Not yet implemented."

.PHONY: lint
lint:
	@echo "Not yet implemented."

.PHONY: lock
lock:
	@echo "Not yet implemented."

.PHONY: release
release:
	@echo "Not yet implemented."

.PHONY: scan
scan:
	@echo "Not yet implemented."

.PHONY: reset
reset: clean
	@echo "Not yet implemented."

.PHONY: test
test:
	@echo "Not yet implemented."
