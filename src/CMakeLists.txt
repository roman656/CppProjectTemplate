set(EXECUTABLE_NAME "${PROJECT_NAME}")

add_subdirectory(SomeLibrary)

add_executable(${EXECUTABLE_NAME} main.cpp)

set_target_properties(${EXECUTABLE_NAME} PROPERTIES
        CXX_STANDARD 17
        CXX_STANDARD_REQUIRED YES
        CXX_EXTENSIONS NO)

target_link_libraries(${EXECUTABLE_NAME} PRIVATE
        ${PROJECT_NAME}::SomeLibraryLib
        ProjectSettings)
