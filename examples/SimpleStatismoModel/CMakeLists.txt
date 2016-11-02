project(simpleStatismoModel)

add_executable(simpleStatismoModel "SimpleStatismoModel.cpp")
include_directories("../../include")
target_link_libraries(simpleStatismoModel ssimrenderer)