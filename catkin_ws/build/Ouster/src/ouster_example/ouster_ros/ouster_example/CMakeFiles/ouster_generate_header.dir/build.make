# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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
CMAKE_SOURCE_DIR = /workspace/catkin_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /workspace/catkin_ws/build

# Utility rule file for ouster_generate_header.

# Include the progress variables for this target.
include Ouster/src/ouster_example/ouster_ros/ouster_example/CMakeFiles/ouster_generate_header.dir/progress.make

ouster_generate_header: Ouster/src/ouster_example/ouster_ros/ouster_example/CMakeFiles/ouster_generate_header.dir/build.make
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating build info header"
	/usr/bin/cmake -DVERSION_GEN_OUT_DIR="/workspace/catkin_ws/build/Ouster/src/ouster_example/ouster_ros/ouster_example/generated/ouster/impl" -DVERSION_GEN_SOURCE_DIR="/workspace/catkin_ws/src/Ouster/src/ouster_example/cmake" -DBUILD_TYPE="Release" -DBUILD_SYSTEM="Linux" -DOusterSDK_VERSION="0.5.1" -DOusterSDK_VERSION_SUFFIX="" -P /workspace/catkin_ws/src/Ouster/src/ouster_example/cmake/VersionGen.cmake
.PHONY : ouster_generate_header

# Rule to build all files generated by this target.
Ouster/src/ouster_example/ouster_ros/ouster_example/CMakeFiles/ouster_generate_header.dir/build: ouster_generate_header

.PHONY : Ouster/src/ouster_example/ouster_ros/ouster_example/CMakeFiles/ouster_generate_header.dir/build

Ouster/src/ouster_example/ouster_ros/ouster_example/CMakeFiles/ouster_generate_header.dir/clean:
	cd /workspace/catkin_ws/build/Ouster/src/ouster_example/ouster_ros/ouster_example && $(CMAKE_COMMAND) -P CMakeFiles/ouster_generate_header.dir/cmake_clean.cmake
.PHONY : Ouster/src/ouster_example/ouster_ros/ouster_example/CMakeFiles/ouster_generate_header.dir/clean

Ouster/src/ouster_example/ouster_ros/ouster_example/CMakeFiles/ouster_generate_header.dir/depend:
	cd /workspace/catkin_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /workspace/catkin_ws/src /workspace/catkin_ws/src/Ouster/src/ouster_example /workspace/catkin_ws/build /workspace/catkin_ws/build/Ouster/src/ouster_example/ouster_ros/ouster_example /workspace/catkin_ws/build/Ouster/src/ouster_example/ouster_ros/ouster_example/CMakeFiles/ouster_generate_header.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : Ouster/src/ouster_example/ouster_ros/ouster_example/CMakeFiles/ouster_generate_header.dir/depend

