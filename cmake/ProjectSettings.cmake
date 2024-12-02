set(SETTINGS_LIB_NAME "ProjectSettings")

add_library(${SETTINGS_LIB_NAME} INTERFACE)

target_compile_options(${SETTINGS_LIB_NAME} INTERFACE
        #-Werror

        -Wall
        -Wextra
        -Wpedantic

        -Wcast-align
        -Wcast-qual
        -Wconversion
        -Wctor-dtor-privacy
        -Wenum-compare
        -Wfloat-equal
        -Wnon-virtual-dtor
        -Wold-style-cast
        -Woverloaded-virtual
        -Wredundant-decls
        -Wsign-conversion
        -Wsign-promo)