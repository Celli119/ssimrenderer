project(IntensityShapeModel)

add_executable(intensityShapeModel "IntensityShapeModel.cpp")
include_directories("../../include")
target_link_libraries(intensityShapeModel ssimrenderer)