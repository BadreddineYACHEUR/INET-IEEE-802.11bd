add_artery_feature(ieee_grid_streaming StreamingService.cc)
generate_opp_message(Streaming.msg TARGET ieee_grid_streaming DIRECTORY ieee_streaming_msgs)
add_opp_run(ieee_grid_streaming NED_FOLDERS ${CMAKE_CURRENT_SOURCE_DIR})

