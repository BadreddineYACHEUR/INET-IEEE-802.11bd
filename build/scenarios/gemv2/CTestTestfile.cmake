# CMake generated Testfile for 
# Source directory: /home/yacheur/apps/artery/scenarios/gemv2
# Build directory: /home/yacheur/apps/artery/build/scenarios/gemv2
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(gemv2-LOS "/home/yacheur/apps/omnetpp-5.6/bin/opp_run_release" "-n" "/home/yacheur/apps/artery/src/artery:/home/yacheur/apps/artery/src/traci:/home/yacheur/apps/artery/extern/veins/examples/veins:/home/yacheur/apps/artery/extern/veins/src/veins:/home/yacheur/apps/artery/extern/inet/examples:/home/yacheur/apps/artery/extern/inet/showcases:/home/yacheur/apps/artery/extern/inet/src:/home/yacheur/apps/artery/extern/inet/tutorials" "-l" "/home/yacheur/apps/artery/build/src/artery/envmod/libartery_envmod.so" "-l" "/home/yacheur/apps/artery/build/src/artery/storyboard/libartery_storyboard.so" "-l" "/home/yacheur/apps/artery/extern/inet/out/clang-release/src/libINET.so" "-l" "/home/yacheur/apps/artery/extern/veins/out/clang-release/src/libveins.so" "-l" "/home/yacheur/apps/artery/build/src/artery/libartery_core.so" "omnetpp.ini" "-uCmdenv" "-cLOS_mediumAntennas" "--sim-time-limit=10s")
set_tests_properties(gemv2-LOS PROPERTIES  WORKING_DIRECTORY "/home/yacheur/apps/artery/scenarios/gemv2")
add_test(gemv2-NLOSv "/home/yacheur/apps/omnetpp-5.6/bin/opp_run_release" "-n" "/home/yacheur/apps/artery/src/artery:/home/yacheur/apps/artery/src/traci:/home/yacheur/apps/artery/extern/veins/examples/veins:/home/yacheur/apps/artery/extern/veins/src/veins:/home/yacheur/apps/artery/extern/inet/examples:/home/yacheur/apps/artery/extern/inet/showcases:/home/yacheur/apps/artery/extern/inet/src:/home/yacheur/apps/artery/extern/inet/tutorials" "-l" "/home/yacheur/apps/artery/build/src/artery/envmod/libartery_envmod.so" "-l" "/home/yacheur/apps/artery/build/src/artery/storyboard/libartery_storyboard.so" "-l" "/home/yacheur/apps/artery/extern/inet/out/clang-release/src/libINET.so" "-l" "/home/yacheur/apps/artery/extern/veins/out/clang-release/src/libveins.so" "-l" "/home/yacheur/apps/artery/build/src/artery/libartery_core.so" "omnetpp.ini" "-uCmdenv" "-cNLOSv" "--sim-time-limit=10s")
set_tests_properties(gemv2-NLOSv PROPERTIES  WORKING_DIRECTORY "/home/yacheur/apps/artery/scenarios/gemv2")
add_test(gemv2-NLOSbLogDist "/home/yacheur/apps/omnetpp-5.6/bin/opp_run_release" "-n" "/home/yacheur/apps/artery/src/artery:/home/yacheur/apps/artery/src/traci:/home/yacheur/apps/artery/extern/veins/examples/veins:/home/yacheur/apps/artery/extern/veins/src/veins:/home/yacheur/apps/artery/extern/inet/examples:/home/yacheur/apps/artery/extern/inet/showcases:/home/yacheur/apps/artery/extern/inet/src:/home/yacheur/apps/artery/extern/inet/tutorials" "-l" "/home/yacheur/apps/artery/build/src/artery/envmod/libartery_envmod.so" "-l" "/home/yacheur/apps/artery/build/src/artery/storyboard/libartery_storyboard.so" "-l" "/home/yacheur/apps/artery/extern/inet/out/clang-release/src/libINET.so" "-l" "/home/yacheur/apps/artery/extern/veins/out/clang-release/src/libveins.so" "-l" "/home/yacheur/apps/artery/build/src/artery/libartery_core.so" "omnetpp.ini" "-uCmdenv" "-cNLOSb1" "--sim-time-limit=10s")
set_tests_properties(gemv2-NLOSbLogDist PROPERTIES  WORKING_DIRECTORY "/home/yacheur/apps/artery/scenarios/gemv2")
add_test(gemv2-NLOSbDifRefl "/home/yacheur/apps/omnetpp-5.6/bin/opp_run_release" "-n" "/home/yacheur/apps/artery/src/artery:/home/yacheur/apps/artery/src/traci:/home/yacheur/apps/artery/extern/veins/examples/veins:/home/yacheur/apps/artery/extern/veins/src/veins:/home/yacheur/apps/artery/extern/inet/examples:/home/yacheur/apps/artery/extern/inet/showcases:/home/yacheur/apps/artery/extern/inet/src:/home/yacheur/apps/artery/extern/inet/tutorials" "-l" "/home/yacheur/apps/artery/build/src/artery/envmod/libartery_envmod.so" "-l" "/home/yacheur/apps/artery/build/src/artery/storyboard/libartery_storyboard.so" "-l" "/home/yacheur/apps/artery/extern/inet/out/clang-release/src/libINET.so" "-l" "/home/yacheur/apps/artery/extern/veins/out/clang-release/src/libveins.so" "-l" "/home/yacheur/apps/artery/build/src/artery/libartery_core.so" "omnetpp.ini" "-uCmdenv" "-cNLOSb1_diffractionReflection" "--sim-time-limit=10s")
set_tests_properties(gemv2-NLOSbDifRefl PROPERTIES  WORKING_DIRECTORY "/home/yacheur/apps/artery/scenarios/gemv2")
add_test(gemv2-NLOSbSmallScale "/home/yacheur/apps/omnetpp-5.6/bin/opp_run_release" "-n" "/home/yacheur/apps/artery/src/artery:/home/yacheur/apps/artery/src/traci:/home/yacheur/apps/artery/extern/veins/examples/veins:/home/yacheur/apps/artery/extern/veins/src/veins:/home/yacheur/apps/artery/extern/inet/examples:/home/yacheur/apps/artery/extern/inet/showcases:/home/yacheur/apps/artery/extern/inet/src:/home/yacheur/apps/artery/extern/inet/tutorials" "-l" "/home/yacheur/apps/artery/build/src/artery/envmod/libartery_envmod.so" "-l" "/home/yacheur/apps/artery/build/src/artery/storyboard/libartery_storyboard.so" "-l" "/home/yacheur/apps/artery/extern/inet/out/clang-release/src/libINET.so" "-l" "/home/yacheur/apps/artery/extern/veins/out/clang-release/src/libveins.so" "-l" "/home/yacheur/apps/artery/build/src/artery/libartery_core.so" "omnetpp.ini" "-uCmdenv" "-cNLOSb1_smallScaleVariations" "--sim-time-limit=10s")
set_tests_properties(gemv2-NLOSbSmallScale PROPERTIES  WORKING_DIRECTORY "/home/yacheur/apps/artery/scenarios/gemv2")