#!/bin/bash

# Shell script for running the Calico unit test suite.
#
# Invoke as './run-unit-test.sh'. Arguments to this script are passed directly
# to tox: e.g., to force a rebuild of tox's virtual environments, invoke this
# script as './run-unit-test.sh -r'.
set -e

coverage erase
tox "$@"

# Make sure we run the following coverage html command with the recent
# coverage.
source .tox/py27/bin/activate
coverage html
deactivate
