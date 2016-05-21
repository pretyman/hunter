# Copyright (c) 2015, Ruslan Baratov, Alexandre Pretyman
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_ODB-QT_HUNTER_CMAKE)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_ODB-QT_HUNTER_CMAKE 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_package(odb)
hunter_add_package(Qt)

hunter_add_version(
    PACKAGE_NAME
    odb-qt
    VERSION
    "2.4.0"
    URL
    "http://www.codesynthesis.com/download/odb/2.4/libodb-qt-2.4.0.tar.bz2"
    SHA1
    e68b6614cf4f471792979f7f97a8279fdba77527
)

hunter_pick_scheme(DEFAULT url_sha1_odb-qt_autotools)
hunter_download(
    PACKAGE_NAME odb-qt
    PACKAGE_DEPENDS_ON odb Qt
)
