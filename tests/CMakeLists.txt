set(TESTS_EXECUTABLE_NAME "${PROJECT_NAME}Tests")

add_executable(${TESTS_EXECUTABLE_NAME} main.test.cpp)

set_target_properties(${TESTS_EXECUTABLE_NAME} PROPERTIES
        CXX_STANDARD 17
        CXX_STANDARD_REQUIRED YES
        CXX_EXTENSIONS NO)

target_link_libraries(${TESTS_EXECUTABLE_NAME} PRIVATE
        SomeLibraryLib
        ProjectSettings)