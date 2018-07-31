#!/bin/bash
#
# Copyright (c) 2018 ARM Limited
#
# SPDX-License-Identifier: Apache-2.0

set -e

filter_test_script="${cidir}/filter_test_aarch64.sh"

check_test_union()
{
	local test_union=$(bash -f ${filter_test_script})
	flag="$1"
	# regex match
	[[ ${test_union} =~ ${flag} ]] && echo "true"

	echo "false"
}

CRIO=$(check_test_union crio)
KUBERNETES=$(check_test_union kubernetes)
OPENSHIFT=$(check_test_union openshift)
