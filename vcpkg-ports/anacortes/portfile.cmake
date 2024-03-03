vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO fmtlib/fmt
    REF "10.2.1"
    SHA512 27df90c681ec37e55625062a79e3b83589b6d7e94eff37a3b412bb8c1473f757a8adb727603acc9185c3490628269216843b7d7bd5a3cb37f0029da5d1495ffa
    HEAD_REF master
)

file(REMOVE_RECURSE ${SOURCE_PATH}/)
file(COPY "${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt" DESTINATION ${SOURCE_PATH})

file(MAKE_DIRECTORY ${SOURCE_PATH}/include)
file(COPY "${CMAKE_CURRENT_LIST_DIR}/anacortes.h" DESTINATION ${SOURCE_PATH}/include/anacortes)

file(MAKE_DIRECTORY ${SOURCE_PATH}/src)
file(COPY "${CMAKE_CURRENT_LIST_DIR}/anacortes.cpp" DESTINATION ${SOURCE_PATH}/src)

file(MAKE_DIRECTORY ${SOURCE_PATH}/cmake)
file(COPY "${CMAKE_CURRENT_LIST_DIR}/AnacortesConfig.cmake" DESTINATION ${SOURCE_PATH}/cmake)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()
