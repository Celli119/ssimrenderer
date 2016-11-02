cmake_minimum_required(VERSION 3.0.0)

project(rply VERSION 6.00 LANGUAGES C)
file(GLOB SOURCES "src/*.c")
file(GLOB HEADERS "src/*.h")

include_directories(${HEADERS})
add_library(rply src/lib/rply.c ${SOURCES} ${HEADERS})
target_include_directories(rply PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})