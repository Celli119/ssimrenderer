cmake_minimum_required (VERSION 3.3)
project(ssimrenderer)

set(CMAKE_BUILD_TYPE Release CACHE STRING "Debug|Release|RelWithDebInfo|MinSizeRel")
add_compile_options(-std=c++11 -fmax-errors=50)



include(${CMAKE_CURRENT_SOURCE_DIR}/version.cmake)
set(requiredLibs)
set(resources)

file(GLOB_RECURSE SOURCES "src/*.cpp")
file(GLOB_RECURSE resources "resources/*.qrc")

include_directories("include")

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
find_package(Qt5Widgets)
# find_package(Qt5Declarative)
set (requiredLibs ${requiredLibs} Qt5::Core Qt5::Widgets)


# 3rd party libraries
include(ExternalProject)
# libmesh
ExternalProject_Add(project_libmesh
  DOWNLOAD_COMMAND ""
  # INSTALL_DIR ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/lm6
  SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/lm6
  PREFIX ${CMAKE_CURRENT_BINARY_DIR}/lm6
  INSTALL_COMMAND ""
  INSTALL_DIR ${CMAKE_CURRENT_BINARY_DIR}/lm6
)
ExternalProject_Get_Property(project_libmesh install_dir)
add_library(libmesh STATIC IMPORTED)
set_property(TARGET libmesh PROPERTY IMPORTED_LOCATION ${install_dir}/src/project_libmesh-build/liblibmesh.a)
add_dependencies(libmesh project_libmesh)
include_directories(3rdparty/lm6/include)

# matio
ExternalProject_Add(project_matio
  DOWNLOAD_COMMAND ""
  SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/matio
  CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/matio/configure --prefix=<INSTALL_DIR>
  PREFIX ${CMAKE_CURRENT_BINARY_DIR}/matio
  BUILD_COMMAND ${MAKE}
)
ExternalProject_Get_Property(project_matio install_dir)
add_library(matio STATIC IMPORTED)
set_property(TARGET matio PROPERTY IMPORTED_LOCATION ${install_dir}/lib/libmatio.a)
add_dependencies(matio project_matio)
include_directories(${install_dir}/include)

# rply
ExternalProject_Add(project_librply
  DOWNLOAD_COMMAND ""
  SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/librply
  PREFIX ${CMAKE_CURRENT_BINARY_DIR}/librply
  INSTALL_DIR ${CMAKE_CURRENT_BINARY_DIR}/librply
  INSTALL_COMMAND ""

)
ExternalProject_Get_Property(project_librply install_dir)
add_library(librply STATIC IMPORTED)
set_property(TARGET librply PROPERTY IMPORTED_LOCATION ${install_dir}/src/project_librply-build/librply.a)
add_dependencies(librply project_librply)
include_directories(${install_dir}/include)

# system libraries
# HDF5
find_package( HDF5  COMPONENTS C CXX)
include_directories( ${HDF5_INCLUDE_DIRS} )
set (requiredLibs ${requiredLibs} ${HDF5_LIBRARIES})
# openCL
find_package(OpenCL REQUIRED)
message(${OpenCL_INCLUDE_DIRS})
include_directories(${OpenCL_INCLUDE_DIRS})
set (requiredLibs ${requiredLibs} ${OpenCL_LIBRARY})

# zLib
find_package( ZLIB REQUIRED )
include_directories(${ZLIB_INCLUDE_DIRS})
set (requiredLibs ${requiredLibs} ${ZLIB_LIBRARIES})

QT5_WRAP_CPP(MY_MOCED_FILES "include/input/statisticaldata.h")

add_library(ssimrenderer STATIC ${SOURCES} ${MY_MOCED_FILES} ${resources} ${HEADERS})

target_link_libraries(ssimrenderer Qt5::Core Qt5::Widgets ${OpenCL_LIBRARY}  libmesh matio librply ${ZLIB_LIBRARIES} ${HDF5_LIBRARIES} )




# Tests ####################################################################
option(BUILD_EXAMPLE_SSIMRENDERER "Build ssimrenderer examples." on)
if (BUILD_EXAMPLE_SSIMRENDERER)
   	message(STATUS "Build tests.")
	add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/examples)
endif (BUILD_EXAMPLE_SSIMRENDERER)
