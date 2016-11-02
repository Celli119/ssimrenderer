cmake_minimum_required(VERSION 3.0.0)

project(libmesh VERSION 6.00 LANGUAGES C)
file(GLOB SOURCES "src/*.c")
file(GLOB HEADERS "include/*.h")

include_directories("./include")
add_library(libmesh ${SOURCES} ${HEADERS})
# target_include_directories(libmesh PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
install(TARGETS DESTINATION lib)
install(FILES ${HEADERS} DESTINATION include)