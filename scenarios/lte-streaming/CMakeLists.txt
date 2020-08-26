add_artery_feature(streaming StreamingD2D.cc)
generate_opp_message(StreamingD2D.msg TARGET streaming DIRECTORY lte_msgs)
add_opp_run(lte_streaming DEPENDENCY artery-lte NED_FOLDERS ${CMAKE_CURRENT_SOURCE_DIR})

add_opp_test(lte_streaming SUFFIX peer CONFIG Streaming-fingerprint-peer)
