project(imageMetrics)

add_executable(imageMetrics "ImageMetrics.cpp")
include_directories("../../include")
target_link_libraries(imageMetrics ssimrenderer)