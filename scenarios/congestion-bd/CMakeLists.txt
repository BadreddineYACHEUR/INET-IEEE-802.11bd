add_artery_feature(congestion CongestionService.cc DetectionService.cc)
generate_opp_message(AvoidCongestionMessage.msg TARGET congestion DIRECTORY congestion_msgs)
add_opp_run(congestion NED_FOLDERS ${CMAKE_CURRENT_SOURCE_DIR})

