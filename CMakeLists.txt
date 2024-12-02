cmake_minimum_required(VERSION 3.15...3.31 FATAL_ERROR)

project(CppProjectTemplate
        VERSION 1.0.0
        DESCRIPTION "C++ project template"
        LANGUAGES CXX)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
include(ProjectSettings)

add_subdirectory(third_party)
add_subdirectory(src)

enable_testing()

if(BUILD_TESTING)
    add_subdirectory(tests)
endif()
