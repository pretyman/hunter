# Copyright (c) 2019, Alexandre Pretyman
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    aws-checksums
    VERSION
    0.1.2
    URL
    https://github.com/awslabs/aws-checksums/archive/v0.1.2.tar.gz
    SHA1
    1eab33d68bd2b35c11428773c6b2997161d38653
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(aws-checksums)
hunter_download(PACKAGE_NAME aws-checksums)
