cmake_minimum_required(VERSION 3.24...3.31 FATAL_ERROR)

project(CppProjectTemplate
        VERSION 1.0.0
        DESCRIPTION "C++ project template"
        LANGUAGES CXX)

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")

include(NoInSourceBuilds)
include(ProjectSettings)

option(BUILD_DOCS "Build the documentation. This requires doxygen to be available" OFF)

if("${CMAKE_PROJECT_NAME}" STREQUAL "${PROJECT_NAME}")
    include(CTest)
endif()

add_subdirectory(src)

if("${CMAKE_PROJECT_NAME}" STREQUAL "${PROJECT_NAME}" AND BUILD_DOCS)
    include(AddDoxygenDocs)
    AddDoxygenDocs(src Documentation)
endif()

if("${CMAKE_PROJECT_NAME}" STREQUAL "${PROJECT_NAME}" AND BUILD_TESTING)
    add_subdirectory(tests)
endif()
