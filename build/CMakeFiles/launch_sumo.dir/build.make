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

# Utility rule file for launch_sumo.

# Include the progress variables for this target.
include CMakeFiles/launch_sumo.dir/progress.make

CMakeFiles/launch_sumo:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/yacheur/apps/artery/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Launching SUMO"
	cd /home/yacheur/apps/artery && /home/yacheur/apps/artery/extern/veins/sumo-launchd.py --daemon --kill

launch_sumo: CMakeFiles/launch_sumo
launch_sumo: CMakeFiles/launch_sumo.dir/build.make

.PHONY : launch_sumo

# Rule to build all files generated by this target.
CMakeFiles/launch_sumo.dir/build: launch_sumo

.PHONY : CMakeFiles/launch_sumo.dir/build

CMakeFiles/launch_sumo.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/launch_sumo.dir/cmake_clean.cmake
.PHONY : CMakeFiles/launch_sumo.dir/clean

CMakeFiles/launch_sumo.dir/depend:
	cd /home/yacheur/apps/artery/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yacheur/apps/artery /home/yacheur/apps/artery /home/yacheur/apps/artery/build /home/yacheur/apps/artery/build /home/yacheur/apps/artery/build/CMakeFiles/launch_sumo.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/launch_sumo.dir/depend

