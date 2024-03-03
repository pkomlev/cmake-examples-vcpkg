cmake_minimum_required(VERSION 3.27)

set(CMAKE_TOOLCHAIN_FILE "${CMAKE_CURRENT_SOURCE_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake")
set(VCPKG_OVERLAY_TRIPLETS "${CMAKE_CURRENT_SOURCE_DIR}/vcpkg-triplets")
set(VCPKG_OVERLAY_PORTS "${CMAKE_CURRENT_SOURCE_DIR}/vcpkg-ports")

set(VCPKG_TRACE_FIND_PACKAGE ON)

project(learn_cmake VERSION 12.3)

find_package(Anacortes CONFIG REQUIRED)

set(CXX_STANDARD_REQUIRED C++23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)


add_executable(hello_executable hello_executable.cpp)
target_link_libraries(hello_executable PRIVATE Anacortes::anacortes)
