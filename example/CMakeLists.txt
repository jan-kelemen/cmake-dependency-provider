cmake_minimum_required(VERSION 3.24)

project(cmake-dependency-provider)

find_package(lexy)
find_package(fmt)
find_package(date)
find_package(Catch2)
find_package(cppzmq)

add_executable(cmake-dependency-provider)

target_sources(cmake-dependency-provider PRIVATE main.cpp)

target_link_libraries(cmake-dependency-provider 
    PRIVATE 
        foonathan::lexy
        fmt::fmt
        date::date
        cppzmq
)

add_executable(cmake-dependency-provider-tests)

target_sources(cmake-dependency-provider-tests PRIVATE test.cpp)

target_link_libraries(cmake-dependency-provider-tests
    PRIVATE
        Catch2::Catch2WithMain
)

include(CTest)
include(Catch)
catch_discover_tests(cmake-dependency-provider-tests)
