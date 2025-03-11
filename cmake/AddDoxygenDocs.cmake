function(AddDoxygenDocs INPUT_DIR OUTPUT_DIR)
    find_package(Doxygen)

    if(NOT DOXYGEN_FOUND)
        add_custom_target(doxygen COMMAND false COMMENT "Doxygen not found")
        return()
    endif()

    set(DOXYGEN_GENERATE_HTML YES)
    set(DOXYGEN_HTML_OUTPUT "${PROJECT_BINARY_DIR}/${OUTPUT_DIR}")

    UseDoxygenAwesomeCss()
    UseDoxygenAwesomeExtensions()

    doxygen_add_docs(doxygen
            "${PROJECT_SOURCE_DIR}/${INPUT_DIR}"
            COMMENT "Generate HTML documentation")
endfunction()

macro(UseDoxygenAwesomeCss)
    include(FetchContent)

    FetchContent_Declare(
            doxygen-awesome-css
            GIT_REPOSITORY https://github.com/jothepro/doxygen-awesome-css.git
            GIT_TAG v2.3.4
            GIT_SHALLOW ON
    )

    FetchContent_MakeAvailable(doxygen-awesome-css)

    set(DOXYGEN_GENERATE_TREEVIEW YES)
    set(DOXYGEN_HAVE_DOT YES)
    set(DOXYGEN_DOT_IMAGE_FORMAT svg)
    set(DOXYGEN_DOT_TRANSPARENT YES)
    set(DOXYGEN_HTML_EXTRA_STYLESHEET "${doxygen-awesome-css_SOURCE_DIR}/doxygen-awesome.css")
endmacro()

macro(UseDoxygenAwesomeExtensions)
    set(DOXYGEN_HTML_EXTRA_FILES
            "${doxygen-awesome-css_SOURCE_DIR}/doxygen-awesome-darkmode-toggle.js"
            "${doxygen-awesome-css_SOURCE_DIR}/doxygen-awesome-fragment-copy-button.js"
            "${doxygen-awesome-css_SOURCE_DIR}/doxygen-awesome-paragraph-link.js"
            "${doxygen-awesome-css_SOURCE_DIR}/doxygen-awesome-interactive-toc.js")

    set(DOXYGEN_EXTENSIONS_TEMP_DIR "${PROJECT_BINARY_DIR}/DoxygenExtensionsTemp")
    file(MAKE_DIRECTORY "${DOXYGEN_EXTENSIONS_TEMP_DIR}")

    execute_process(
            COMMAND doxygen -w html
                    "${DOXYGEN_EXTENSIONS_TEMP_DIR}/header.html"
                    "${DOXYGEN_EXTENSIONS_TEMP_DIR}/footer.html"
                    "${DOXYGEN_EXTENSIONS_TEMP_DIR}/style.css"
            WORKING_DIRECTORY "${PROJECT_BINARY_DIR}")

    # Include contents of the DoxygenExtraHeader.html before the closing </head> tag in the header.html template
    file(READ "${DOXYGEN_EXTENSIONS_TEMP_DIR}/header.html" HEADER_CONTENT)
    file(READ "${PROJECT_SOURCE_DIR}/docs/DoxygenExtraHeader.html" HEADER_EXTRA_CONTENT)
    string(REPLACE "</head>" "${HEADER_EXTRA_CONTENT}</head>" HEADER_CONTENT_MODIFIED "${HEADER_CONTENT}")
    file(WRITE "${DOXYGEN_EXTENSIONS_TEMP_DIR}/header.html" "${HEADER_CONTENT_MODIFIED}")

    set(DOXYGEN_HTML_HEADER "${DOXYGEN_EXTENSIONS_TEMP_DIR}/header.html")
endmacro()