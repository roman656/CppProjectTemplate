cmake_minimum_required(VERSION 3.24 FATAL_ERROR)

project(CppProjectTemplate
        VERSION 1.0.0
        DESCRIPTION "C++ project template"
        LANGUAGES CXX)

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")

include(NoInSourceBuilds)
include(Options)
include(ProjectSettings)

add_subdirectory(src)

if(PROJECT_IS_TOP_LEVEL)
    if(BUILD_TESTS)
        include(CTest)
        add_subdirectory(tests)
    endif()

    if(BUILD_DOCS)
        include(AddDoxygenDocs)
        AddDoxygenDocs(src Documentation)
    endif()
endif()
