add_artery_feature(olice ClearLaneService.cc PoliceService.cc)
generate_opp_message(PoliceClearLane.msg TARGET olice DIRECTORY police_msgs)
add_opp_run(highway_olice NED_FOLDERS ${CMAKE_CURRENT_SOURCE_DIR})

