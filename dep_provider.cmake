cmake_minimum_required(VERSION 3.24)

include(FetchContent)

FetchContent_Declare(
    lexy
    GIT_REPOSITORY https://github.com/foonathan/lexy.git
    GIT_TAG 1b31b097fa4fcaf5465f038793fe88cdc2140b71
)

FetchContent_Declare(
    fmt
    GIT_REPOSITORY https://github.com/fmtlib/fmt.git
    GIT_TAG f5e54359df4c26b6230fc61d38aa294581393084 # Release 10.1.1
)

macro(jk_provide_dependecy method dep_name)
    if("${dep_name}" MATCHES "^(lexy|fmt)$")
        list(APPEND jk_provider_args ${method} ${dep_name})

        FetchContent_MakeAvailable(${dep_name})

        list(POP_BACK jk_provider_args dep_name method)

        if ("${method}" STREQUAL "FIND_PACKAGE")
            set(${dep_name}_FOUND TRUE)
        endif()
    endif()
endmacro()

cmake_language(
    SET_DEPENDENCY_PROVIDER jk_provide_dependecy
    SUPPORTED_METHODS
        FIND_PACKAGE
        FETCHCONTENT_MAKEAVAILABLE_SERIAL
)

