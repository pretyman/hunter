cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")
project(odb-qt-sqlite-example)

hunter_add_package(odb-compiler)
hunter_add_package(odb-sqlite)
hunter_add_package(odb-qt)
find_package(odb COMPONENTS compiler sqlite)

find_package(Qt5Core)

set(${PROJECT_NAME}_SOURCES
    driver.cxx
)

set(${PROJECT_NAME}_ODB_HEADERS
    employee.hxx
)

add_executable(${PROJECT_NAME}
    ${${PROJECT_NAME}_SOURCES}
    ${${PROJECT_NAME}_ODB_HEADERS}
)
set(qt_lib_dir "${Qt5Core_DIR}/../..")
set(qt_core_libs
  "-framework CoreFoundation"
  "-framework Carbon"
  "-framework Cocoa"
  z
  "-L${qt_lib_dir}"
  qtpcre
  Qt5PlatformSupport
  "-L${qt_lib_dir}/../plugins/platforms"
  qcocoa
)

target_link_libraries(${PROJECT_NAME} odb::sqlite Qt5::Core ${qt_core_libs})
odb_compile(
    ${PROJECT_NAME}
    FILES
      ${${PROJECT_NAME}_ODB_HEADERS}
    DB
      sqlite
    GENERATE_QUERY
    GENERATE_SESSION
    GENERATE_SCHEMA
    PROFILE
      qt
)


target_include_directories(${PROJECT_NAME}
    PRIVATE
      ${CMAKE_CURRENT_SOURCE_DIR}
)

target_compile_definitions(${PROJECT_NAME}
    PRIVATE
      DATABASE_SQLITE
)
