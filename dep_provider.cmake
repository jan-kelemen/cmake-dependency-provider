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

FetchContent_Declare(
    date
    GIT_REPOSITORY https://github.com/HowardHinnant/date.git
    GIT_TAG 6e921e1b1d21e84a5c82416ba7ecd98e33a436d0 # Release 3.0.1
)

FetchContent_Declare(
    Catch2
    GIT_REPOSITORY https://github.com/catchorg/Catch2.git
    GIT_TAG 6e79e682b726f524310d55dec8ddac4e9c52fb5f # Release 3.4.0
)

macro(jk_provide_dependecy method dep_name)
    if("${dep_name}" MATCHES "^(lexy|fmt|date|Catch2)$")
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

