cmake_minimum_required(VERSION 3.24)

project(cmake-dependency-provider)

find_package(lexy)
find_package(fmt)
find_package(date)

add_executable(cmake-dependency-provider)

target_sources(cmake-dependency-provider PRIVATE main.cpp)

target_link_libraries(cmake-dependency-provider 
    PRIVATE 
        foonathan::lexy
        fmt::fmt
        date::date)

