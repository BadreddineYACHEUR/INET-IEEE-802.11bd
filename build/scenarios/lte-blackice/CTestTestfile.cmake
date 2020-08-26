# CMake generated Testfile for 
# Source directory: /home/yacheur/apps/artery/scenarios/lte-blackice
# Build directory: /home/yacheur/apps/artery/build/scenarios/lte-blackice
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(lte_blackice-backend "/home/yacheur/apps/omnetpp-5.6/bin/opp_run_release" "-n" "/home/yacheur/apps/artery/src/artery:/home/yacheur/apps/artery/src/traci:/home/yacheur/apps/artery/extern/veins/examples/veins:/home/yacheur/apps/artery/extern/veins/src/veins:/home/yacheur/apps/artery/extern/inet/examples:/home/yacheur/apps/artery/extern/inet/showcases:/home/yacheur/apps/artery/extern/inet/src:/home/yacheur/apps/artery/extern/inet/tutorials:/home/yacheur/apps/artery/extern/simulte/simulations:/home/yacheur/apps/artery/extern/simulte/src:/home/yacheur/apps/artery/scenarios/lte-blackice" "-l" "/home/yacheur/apps/artery/extern/simulte/out/clang-release/src/liblte.so" "-l" "/home/yacheur/apps/artery/build/scenarios/lte-blackice/libartery_blackice.so" "-l" "/home/yacheur/apps/artery/build/scenarios/ieee-grid-streaming-p/libartery_ieee_grid_streaming_p.so" "-l" "/home/yacheur/apps/artery/build/scenarios/ieee-grid-streaming/libartery_ieee_grid_streaming.so" "-l" "/home/yacheur/apps/artery/build/scenarios/congestion/libartery_congestion.so" "-l" "/home/yacheur/apps/artery/build/scenarios/highway-olice/libartery_olice.so" "-l" "/home/yacheur/apps/artery/build/src/artery/envmod/libartery_envmod.so" "-l" "/home/yacheur/apps/artery/build/scenarios/highway-police/libartery_police.so" "-l" "/home/yacheur/apps/artery/build/src/artery/envmod/libartery_envmod.so" "-l" "/home/yacheur/apps/artery/build/src/artery/storyboard/libartery_storyboard.so" "-l" "/home/yacheur/apps/artery/extern/inet/out/clang-release/src/libINET.so" "-l" "/home/yacheur/apps/artery/extern/veins/out/clang-release/src/libveins.so" "-l" "/home/yacheur/apps/artery/build/src/artery/libartery_core.so" "omnetpp.ini" "-uCmdenv" "-cBlackIce-fingerprint-backend")
set_tests_properties(lte_blackice-backend PROPERTIES  WORKING_DIRECTORY "/home/yacheur/apps/artery/scenarios/lte-blackice")
add_test(lte_blackice-peer "/home/yacheur/apps/omnetpp-5.6/bin/opp_run_release" "-n" "/home/yacheur/apps/artery/src/artery:/home/yacheur/apps/artery/src/traci:/home/yacheur/apps/artery/extern/veins/examples/veins:/home/yacheur/apps/artery/extern/veins/src/veins:/home/yacheur/apps/artery/extern/inet/examples:/home/yacheur/apps/artery/extern/inet/showcases:/home/yacheur/apps/artery/extern/inet/src:/home/yacheur/apps/artery/extern/inet/tutorials:/home/yacheur/apps/artery/extern/simulte/simulations:/home/yacheur/apps/artery/extern/simulte/src:/home/yacheur/apps/artery/scenarios/lte-blackice" "-l" "/home/yacheur/apps/artery/extern/simulte/out/clang-release/src/liblte.so" "-l" "/home/yacheur/apps/artery/build/scenarios/lte-blackice/libartery_blackice.so" "-l" "/home/yacheur/apps/artery/build/scenarios/ieee-grid-streaming-p/libartery_ieee_grid_streaming_p.so" "-l" "/home/yacheur/apps/artery/build/scenarios/ieee-grid-streaming/libartery_ieee_grid_streaming.so" "-l" "/home/yacheur/apps/artery/build/scenarios/congestion/libartery_congestion.so" "-l" "/home/yacheur/apps/artery/build/scenarios/highway-olice/libartery_olice.so" "-l" "/home/yacheur/apps/artery/build/src/artery/envmod/libartery_envmod.so" "-l" "/home/yacheur/apps/artery/build/scenarios/highway-police/libartery_police.so" "-l" "/home/yacheur/apps/artery/build/src/artery/envmod/libartery_envmod.so" "-l" "/home/yacheur/apps/artery/build/src/artery/storyboard/libartery_storyboard.so" "-l" "/home/yacheur/apps/artery/extern/inet/out/clang-release/src/libINET.so" "-l" "/home/yacheur/apps/artery/extern/veins/out/clang-release/src/libveins.so" "-l" "/home/yacheur/apps/artery/build/src/artery/libartery_core.so" "omnetpp.ini" "-uCmdenv" "-cBlackIce-fingerprint-peer")
set_tests_properties(lte_blackice-peer PROPERTIES  WORKING_DIRECTORY "/home/yacheur/apps/artery/scenarios/lte-blackice")
