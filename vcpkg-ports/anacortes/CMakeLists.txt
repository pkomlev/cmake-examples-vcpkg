cmake_minimum_required(VERSION 3.27)

project(anacortes VERSION 1.0)

include(GNUInstallDirs)

find_package(fmt CONFIG REQUIRED)

set(CXX_STANDARD_REQUIRED C++23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

file(GLOB ANACORTES_SOURCES "src/*.cpp")

include_directories(include)
install(DIRECTORY include/anacortes DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

add_library(anacortes STATIC ${ANACORTES_SOURCES})

install(TARGETS anacortes
        EXPORT anacortes_targets
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})

#
# Packaging.
#
include(CMakePackageConfigHelpers)

write_basic_package_version_file(
  "${CMAKE_CURRENT_BINARY_DIR}/anacortes/AnacortesConfigVersion.cmake"
  VERSION ${anacortes_VERSION}
  COMPATIBILITY AnyNewerVersion
)

export(EXPORT anacortes_targets
  FILE "${CMAKE_CURRENT_BINARY_DIR}/anacortes/AnacortesTargets.cmake"
  NAMESPACE Anacortes::
)

configure_file(cmake/AnacortesConfig.cmake
  "${CMAKE_CURRENT_BINARY_DIR}/anacortes/AnacortesTargets.cmake"
  COPYONLY
)

set(ConfigPackageLocation lib/cmake/anacortes)

install(EXPORT anacortes_targets
        FILE AnacortesTargets.cmake
        NAMESPACE Anacortes::
        DESTINATION ${ConfigPackageLocation}
)

install(FILES
        cmake/AnacortesConfig.cmake
        "${CMAKE_CURRENT_BINARY_DIR}/anacortes/AnacortesConfigVersion.cmake"
        DESTINATION ${ConfigPackageLocation}
)
