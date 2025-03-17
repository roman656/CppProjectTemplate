cmake_minimum_required(VERSION 3.24 FATAL_ERROR)

project(CppProjectTemplate
        VERSION 1.0.0
        DESCRIPTION "C++ project template"
        LANGUAGES CXX)

option(CPT_BUILD_TESTS "Build tests. This requires GoogleTest to be available" OFF)
option(CPT_BUILD_DOCS "Build documentation. This requires Doxygen to be available" OFF)

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")

include(NoInSourceBuilds)
include(ProjectSettings)

add_subdirectory(src)

if(PROJECT_IS_TOP_LEVEL)
    if(CPT_BUILD_TESTS)
        include(CTest)
        add_subdirectory(tests)
    endif()

    if(CPT_BUILD_DOCS)
        include(AddDoxygenDocs)
        AddDoxygenDocs(src Documentation)
    endif()
endif()
