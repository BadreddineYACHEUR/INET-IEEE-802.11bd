add_artery_feature(streamingbd StreamingService.cc)
generate_opp_message(StreamingMessage.msg TARGET streamingbd DIRECTORY streaming_msgs)
add_opp_run(highway_test NED_FOLDERS ${CMAKE_CURRENT_SOURCE_DIR})

