set(EXECUTABLE_NAME "${PROJECT_NAME}")

add_subdirectory(SomeLibrary)

add_executable(${EXECUTABLE_NAME} main.cpp)

target_compile_features(${EXECUTABLE_NAME} PRIVATE cxx_std_17)
set_target_properties(${EXECUTABLE_NAME} PROPERTIES CXX_EXTENSIONS OFF)

target_link_libraries(${EXECUTABLE_NAME} PRIVATE
        ${PROJECT_NAME}::SomeLibraryLib
        ${PROJECT_NAME}::ProjectSettings)
