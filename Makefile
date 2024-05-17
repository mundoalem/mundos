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

BUILD_DIR := build
CONFIG_DIR := config
DIST_DIR := dist
SRC_DIR := src

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

#
# Project: QEMU
#

PROJECT_CPU_KIND ?= "cortex-a57"

# ######################################################################################################################
# TARGETS
# ######################################################################################################################

.PHONY: all
all: lint scan build test

.PHONY: build
build:
	@aarch64-linux-gnu-as \
		$(SRC_DIR)/boot.s \
		-g \
		-o $(BUILD_DIR)/boot.o

	@aarch64-linux-gnu-gcc \
		-ffreestanding \
		-c $(SRC_DIR)/kernel.c \
		-o $(BUILD_DIR)/kernel.o

	@aarch64-linux-gnu-ld \
		-nostdlib \
		-T$(CONFIG_DIR)/linker.ld \
		$(BUILD_DIR)/*.o \
		-o $(DIST_DIR)/mundos.elf

.PHONY: clean
clean:
	@rm -rf $(BUILD_DIR)/*.o
	@rm -rf $(DIST_DIR)/*.elf

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

.PHONY: run
run:
	@qemu-system-aarch64 \
		-machine virt \
		-cpu $(PROJECT_CPU_KIND) \
		-kernel $(DIST_DIR)/mundos.elf \
		-nographic

.PHONY: test
test:
	@echo "Not yet implemented."
