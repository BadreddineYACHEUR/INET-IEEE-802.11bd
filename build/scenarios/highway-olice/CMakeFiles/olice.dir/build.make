# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/yacheur/apps/artery

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/yacheur/apps/artery/build

# Include any dependencies generated for this target.
include scenarios/highway-olice/CMakeFiles/olice.dir/depend.make

# Include the progress variables for this target.
include scenarios/highway-olice/CMakeFiles/olice.dir/progress.make

# Include the compile flags for this target's objects.
include scenarios/highway-olice/CMakeFiles/olice.dir/flags.make

opp_messages/police_msgs/PoliceClearLane_m.cc: ../scenarios/highway-olice/PoliceClearLane.msg
opp_messages/police_msgs/PoliceClearLane_m.cc: /home/yacheur/apps/omnetpp-5.6/bin/opp_msgc
opp_messages/police_msgs/PoliceClearLane_m.cc: opp_messages/police_msgs
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/yacheur/apps/artery/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating police_msgs/PoliceClearLane"
	cd /home/yacheur/apps/artery/build/opp_messages/police_msgs && /home/yacheur/apps/omnetpp-5.6/bin/opp_msgc -s _m.cc -h /home/yacheur/apps/artery/scenarios/highway-olice/PoliceClearLane.msg

opp_messages/police_msgs/PoliceClearLane_m.h: opp_messages/police_msgs/PoliceClearLane_m.cc
	@$(CMAKE_COMMAND) -E touch_nocreate opp_messages/police_msgs/PoliceClearLane_m.h

opp_messages/police_msgs:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/yacheur/apps/artery/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating ../../opp_messages/police_msgs"
	/usr/bin/cmake -E make_directory /home/yacheur/apps/artery/build/opp_messages/police_msgs

scenarios/highway-olice/CMakeFiles/olice.dir/ClearLaneService.cc.o: scenarios/highway-olice/CMakeFiles/olice.dir/flags.make
scenarios/highway-olice/CMakeFiles/olice.dir/ClearLaneService.cc.o: ../scenarios/highway-olice/ClearLaneService.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yacheur/apps/artery/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object scenarios/highway-olice/CMakeFiles/olice.dir/ClearLaneService.cc.o"
	cd /home/yacheur/apps/artery/build/scenarios/highway-olice && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/olice.dir/ClearLaneService.cc.o -c /home/yacheur/apps/artery/scenarios/highway-olice/ClearLaneService.cc

scenarios/highway-olice/CMakeFiles/olice.dir/ClearLaneService.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/olice.dir/ClearLaneService.cc.i"
	cd /home/yacheur/apps/artery/build/scenarios/highway-olice && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yacheur/apps/artery/scenarios/highway-olice/ClearLaneService.cc > CMakeFiles/olice.dir/ClearLaneService.cc.i

scenarios/highway-olice/CMakeFiles/olice.dir/ClearLaneService.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/olice.dir/ClearLaneService.cc.s"
	cd /home/yacheur/apps/artery/build/scenarios/highway-olice && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yacheur/apps/artery/scenarios/highway-olice/ClearLaneService.cc -o CMakeFiles/olice.dir/ClearLaneService.cc.s

scenarios/highway-olice/CMakeFiles/olice.dir/ClearLaneService.cc.o.requires:

.PHONY : scenarios/highway-olice/CMakeFiles/olice.dir/ClearLaneService.cc.o.requires

scenarios/highway-olice/CMakeFiles/olice.dir/ClearLaneService.cc.o.provides: scenarios/highway-olice/CMakeFiles/olice.dir/ClearLaneService.cc.o.requires
	$(MAKE) -f scenarios/highway-olice/CMakeFiles/olice.dir/build.make scenarios/highway-olice/CMakeFiles/olice.dir/ClearLaneService.cc.o.provides.build
.PHONY : scenarios/highway-olice/CMakeFiles/olice.dir/ClearLaneService.cc.o.provides

scenarios/highway-olice/CMakeFiles/olice.dir/ClearLaneService.cc.o.provides.build: scenarios/highway-olice/CMakeFiles/olice.dir/ClearLaneService.cc.o


scenarios/highway-olice/CMakeFiles/olice.dir/PoliceService.cc.o: scenarios/highway-olice/CMakeFiles/olice.dir/flags.make
scenarios/highway-olice/CMakeFiles/olice.dir/PoliceService.cc.o: ../scenarios/highway-olice/PoliceService.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yacheur/apps/artery/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object scenarios/highway-olice/CMakeFiles/olice.dir/PoliceService.cc.o"
	cd /home/yacheur/apps/artery/build/scenarios/highway-olice && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/olice.dir/PoliceService.cc.o -c /home/yacheur/apps/artery/scenarios/highway-olice/PoliceService.cc

scenarios/highway-olice/CMakeFiles/olice.dir/PoliceService.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/olice.dir/PoliceService.cc.i"
	cd /home/yacheur/apps/artery/build/scenarios/highway-olice && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yacheur/apps/artery/scenarios/highway-olice/PoliceService.cc > CMakeFiles/olice.dir/PoliceService.cc.i

scenarios/highway-olice/CMakeFiles/olice.dir/PoliceService.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/olice.dir/PoliceService.cc.s"
	cd /home/yacheur/apps/artery/build/scenarios/highway-olice && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yacheur/apps/artery/scenarios/highway-olice/PoliceService.cc -o CMakeFiles/olice.dir/PoliceService.cc.s

scenarios/highway-olice/CMakeFiles/olice.dir/PoliceService.cc.o.requires:

.PHONY : scenarios/highway-olice/CMakeFiles/olice.dir/PoliceService.cc.o.requires

scenarios/highway-olice/CMakeFiles/olice.dir/PoliceService.cc.o.provides: scenarios/highway-olice/CMakeFiles/olice.dir/PoliceService.cc.o.requires
	$(MAKE) -f scenarios/highway-olice/CMakeFiles/olice.dir/build.make scenarios/highway-olice/CMakeFiles/olice.dir/PoliceService.cc.o.provides.build
.PHONY : scenarios/highway-olice/CMakeFiles/olice.dir/PoliceService.cc.o.provides

scenarios/highway-olice/CMakeFiles/olice.dir/PoliceService.cc.o.provides.build: scenarios/highway-olice/CMakeFiles/olice.dir/PoliceService.cc.o


scenarios/highway-olice/CMakeFiles/olice.dir/__/__/opp_messages/police_msgs/PoliceClearLane_m.cc.o: scenarios/highway-olice/CMakeFiles/olice.dir/flags.make
scenarios/highway-olice/CMakeFiles/olice.dir/__/__/opp_messages/police_msgs/PoliceClearLane_m.cc.o: opp_messages/police_msgs/PoliceClearLane_m.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yacheur/apps/artery/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object scenarios/highway-olice/CMakeFiles/olice.dir/__/__/opp_messages/police_msgs/PoliceClearLane_m.cc.o"
	cd /home/yacheur/apps/artery/build/scenarios/highway-olice && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/olice.dir/__/__/opp_messages/police_msgs/PoliceClearLane_m.cc.o -c /home/yacheur/apps/artery/build/opp_messages/police_msgs/PoliceClearLane_m.cc

scenarios/highway-olice/CMakeFiles/olice.dir/__/__/opp_messages/police_msgs/PoliceClearLane_m.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/olice.dir/__/__/opp_messages/police_msgs/PoliceClearLane_m.cc.i"
	cd /home/yacheur/apps/artery/build/scenarios/highway-olice && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yacheur/apps/artery/build/opp_messages/police_msgs/PoliceClearLane_m.cc > CMakeFiles/olice.dir/__/__/opp_messages/police_msgs/PoliceClearLane_m.cc.i

scenarios/highway-olice/CMakeFiles/olice.dir/__/__/opp_messages/police_msgs/PoliceClearLane_m.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/olice.dir/__/__/opp_messages/police_msgs/PoliceClearLane_m.cc.s"
	cd /home/yacheur/apps/artery/build/scenarios/highway-olice && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yacheur/apps/artery/build/opp_messages/police_msgs/PoliceClearLane_m.cc -o CMakeFiles/olice.dir/__/__/opp_messages/police_msgs/PoliceClearLane_m.cc.s

scenarios/highway-olice/CMakeFiles/olice.dir/__/__/opp_messages/police_msgs/PoliceClearLane_m.cc.o.requires:

.PHONY : scenarios/highway-olice/CMakeFiles/olice.dir/__/__/opp_messages/police_msgs/PoliceClearLane_m.cc.o.requires

scenarios/highway-olice/CMakeFiles/olice.dir/__/__/opp_messages/police_msgs/PoliceClearLane_m.cc.o.provides: scenarios/highway-olice/CMakeFiles/olice.dir/__/__/opp_messages/police_msgs/PoliceClearLane_m.cc.o.requires
	$(MAKE) -f scenarios/highway-olice/CMakeFiles/olice.dir/build.make scenarios/highway-olice/CMakeFiles/olice.dir/__/__/opp_messages/police_msgs/PoliceClearLane_m.cc.o.provides.build
.PHONY : scenarios/highway-olice/CMakeFiles/olice.dir/__/__/opp_messages/police_msgs/PoliceClearLane_m.cc.o.provides

scenarios/highway-olice/CMakeFiles/olice.dir/__/__/opp_messages/police_msgs/PoliceClearLane_m.cc.o.provides.build: scenarios/highway-olice/CMakeFiles/olice.dir/__/__/opp_messages/police_msgs/PoliceClearLane_m.cc.o


# Object files for target olice
olice_OBJECTS = \
"CMakeFiles/olice.dir/ClearLaneService.cc.o" \
"CMakeFiles/olice.dir/PoliceService.cc.o" \
"CMakeFiles/olice.dir/__/__/opp_messages/police_msgs/PoliceClearLane_m.cc.o"

# External object files for target olice
olice_EXTERNAL_OBJECTS =

scenarios/highway-olice/libartery_olice.so: scenarios/highway-olice/CMakeFiles/olice.dir/ClearLaneService.cc.o
scenarios/highway-olice/libartery_olice.so: scenarios/highway-olice/CMakeFiles/olice.dir/PoliceService.cc.o
scenarios/highway-olice/libartery_olice.so: scenarios/highway-olice/CMakeFiles/olice.dir/__/__/opp_messages/police_msgs/PoliceClearLane_m.cc.o
scenarios/highway-olice/libartery_olice.so: scenarios/highway-olice/CMakeFiles/olice.dir/build.make
scenarios/highway-olice/libartery_olice.so: src/artery/libartery_core.so
scenarios/highway-olice/libartery_olice.so: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
scenarios/highway-olice/libartery_olice.so: /usr/lib/x86_64-linux-gnu/libboost_system.so
scenarios/highway-olice/libartery_olice.so: src/traci/libtraci.so
scenarios/highway-olice/libartery_olice.so: ../extern/vanetza/build/lib/libvanetza_btp.so
scenarios/highway-olice/libartery_olice.so: ../extern/vanetza/build/lib/libvanetza_facilities.so
scenarios/highway-olice/libartery_olice.so: ../extern/vanetza/build/lib/libvanetza_asn1.so
scenarios/highway-olice/libartery_olice.so: ../extern/vanetza/build/lib/libvanetza_geonet.so
scenarios/highway-olice/libartery_olice.so: ../extern/vanetza/build/lib/libvanetza_dcc.so
scenarios/highway-olice/libartery_olice.so: ../extern/vanetza/build/lib/libvanetza_access.so
scenarios/highway-olice/libartery_olice.so: ../extern/vanetza/build/lib/libvanetza_gnss.so
scenarios/highway-olice/libartery_olice.so: ../extern/vanetza/build/lib/libvanetza_security.so
scenarios/highway-olice/libartery_olice.so: ../extern/vanetza/build/lib/libvanetza_net.so
scenarios/highway-olice/libartery_olice.so: ../extern/vanetza/build/lib/libvanetza_common.so
scenarios/highway-olice/libartery_olice.so: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
scenarios/highway-olice/libartery_olice.so: /usr/lib/x86_64-linux-gnu/libcryptopp.so
scenarios/highway-olice/libartery_olice.so: ../extern/veins/out/clang-release/src/libveins.so
scenarios/highway-olice/libartery_olice.so: ../extern/inet/out/clang-release/src/libINET.so
scenarios/highway-olice/libartery_olice.so: scenarios/highway-olice/CMakeFiles/olice.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/yacheur/apps/artery/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking CXX shared library libartery_olice.so"
	cd /home/yacheur/apps/artery/build/scenarios/highway-olice && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/olice.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
scenarios/highway-olice/CMakeFiles/olice.dir/build: scenarios/highway-olice/libartery_olice.so

.PHONY : scenarios/highway-olice/CMakeFiles/olice.dir/build

scenarios/highway-olice/CMakeFiles/olice.dir/requires: scenarios/highway-olice/CMakeFiles/olice.dir/ClearLaneService.cc.o.requires
scenarios/highway-olice/CMakeFiles/olice.dir/requires: scenarios/highway-olice/CMakeFiles/olice.dir/PoliceService.cc.o.requires
scenarios/highway-olice/CMakeFiles/olice.dir/requires: scenarios/highway-olice/CMakeFiles/olice.dir/__/__/opp_messages/police_msgs/PoliceClearLane_m.cc.o.requires

.PHONY : scenarios/highway-olice/CMakeFiles/olice.dir/requires

scenarios/highway-olice/CMakeFiles/olice.dir/clean:
	cd /home/yacheur/apps/artery/build/scenarios/highway-olice && $(CMAKE_COMMAND) -P CMakeFiles/olice.dir/cmake_clean.cmake
.PHONY : scenarios/highway-olice/CMakeFiles/olice.dir/clean

scenarios/highway-olice/CMakeFiles/olice.dir/depend: opp_messages/police_msgs/PoliceClearLane_m.cc
scenarios/highway-olice/CMakeFiles/olice.dir/depend: opp_messages/police_msgs/PoliceClearLane_m.h
scenarios/highway-olice/CMakeFiles/olice.dir/depend: opp_messages/police_msgs
	cd /home/yacheur/apps/artery/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yacheur/apps/artery /home/yacheur/apps/artery/scenarios/highway-olice /home/yacheur/apps/artery/build /home/yacheur/apps/artery/build/scenarios/highway-olice /home/yacheur/apps/artery/build/scenarios/highway-olice/CMakeFiles/olice.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : scenarios/highway-olice/CMakeFiles/olice.dir/depend

