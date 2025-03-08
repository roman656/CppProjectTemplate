cmake_minimum_required(VERSION 3.15...3.31 FATAL_ERROR)

project(CppProjectTemplate
        VERSION 1.0.0
        DESCRIPTION "C++ project template"
        LANGUAGES CXX)

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")

include(NoInSourceBuilds)
include(ProjectSettings)

if("${CMAKE_PROJECT_NAME}" STREQUAL "${PROJECT_NAME}")
    include(CTest)
endif()

add_subdirectory(src)

if("${CMAKE_PROJECT_NAME}" STREQUAL "${PROJECT_NAME}" AND BUILD_TESTING)
    add_subdirectory(tests)
endif()
