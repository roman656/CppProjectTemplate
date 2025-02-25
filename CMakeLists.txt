cmake_minimum_required(VERSION 3.15...3.31 FATAL_ERROR)

if("${CMAKE_SOURCE_DIR}" STREQUAL "${CMAKE_BINARY_DIR}")
    message(FATAL_ERROR
            " In-source builds are not allowed.\n"
            " Please create a separate build directory outside the source tree.\n"
            " To fix this, remove any temporary files and directories created by CMake in the source tree.\n"
            " Then create a clean build directory, e.g.:\n"
            "   cmake -S . -B build\n"
            "   cmake --build build")
endif()

project(CppProjectTemplate
        VERSION 1.0.0
        DESCRIPTION "C++ project template"
        LANGUAGES CXX)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
include(ProjectSettings)

add_subdirectory(third_party)
add_subdirectory(src)

enable_testing()
add_subdirectory(tests)
