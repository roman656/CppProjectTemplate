set(ORIGINAL_BUILD_TESTING ${BUILD_TESTING})
set(BUILD_TESTING OFF CACHE BOOL "Disable tests for external dependencies" FORCE)

include(FetchContent)
FetchContent_Declare(
        googletest
        GIT_REPOSITORY https://github.com/google/googletest.git
        GIT_TAG        v1.16.0
        GIT_SHALLOW ON
)

# For Windows: Prevent overriding the parent project's compiler/linker settings
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)

FetchContent_MakeAvailable(googletest)

set(BUILD_TESTING ${ORIGINAL_BUILD_TESTING} CACHE BOOL "Restore BUILD_TESTING value" FORCE)
