set(TESTS_EXECUTABLE_NAME "${PROJECT_NAME}Tests")
set(TESTS_SOURCES "${TESTS_EXECUTABLE_NAME}_SOURCES")

file(GLOB_RECURSE TESTS_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/*.test.cpp")

add_executable(${TESTS_EXECUTABLE_NAME} ${TESTS_SOURCES})

target_compile_features(${TESTS_EXECUTABLE_NAME} PRIVATE cxx_std_17)
set_target_properties(${TESTS_EXECUTABLE_NAME} PROPERTIES CXX_EXTENSIONS OFF)

include(AddGoogleTest)
target_link_libraries(${TESTS_EXECUTABLE_NAME} PRIVATE
        ${PROJECT_NAME}::SomeLibraryLib
        ${PROJECT_NAME}::ProjectSettings
        GTest::gtest_main)

include(GoogleTest)
gtest_discover_tests(${TESTS_EXECUTABLE_NAME})
