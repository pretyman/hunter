# Copyright (c) 2019, Alexndre Pretyman
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-aws-checksums LANGUAGES C)

# DOCUMENTATION_START {
hunter_add_package(aws-checksums)

find_package(aws-checksums CONFIG REQUIRED)

add_executable(crc_test run_tests.c)
target_link_libraries(crc_test PUBLIC AWS::aws-checksums)
# DOCUMENTATION_END }
