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

# Include any dependencies generated for this target.
include ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/depend.make

# Include the progress variables for this target.
include ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/progress.make

# Include the compile flags for this target's objects.
include ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/flags.make

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/client.cpp.o: ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/flags.make
ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/client.cpp.o: /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/client.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/client.cpp.o"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ouster_client.dir/src/client.cpp.o -c /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/client.cpp

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/client.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ouster_client.dir/src/client.cpp.i"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/client.cpp > CMakeFiles/ouster_client.dir/src/client.cpp.i

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/client.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ouster_client.dir/src/client.cpp.s"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/client.cpp -o CMakeFiles/ouster_client.dir/src/client.cpp.s

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/types.cpp.o: ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/flags.make
ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/types.cpp.o: /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/types.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/types.cpp.o"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ouster_client.dir/src/types.cpp.o -c /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/types.cpp

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/types.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ouster_client.dir/src/types.cpp.i"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/types.cpp > CMakeFiles/ouster_client.dir/src/types.cpp.i

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/types.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ouster_client.dir/src/types.cpp.s"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/types.cpp -o CMakeFiles/ouster_client.dir/src/types.cpp.s

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/sensor_info.cpp.o: ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/flags.make
ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/sensor_info.cpp.o: /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/sensor_info.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/sensor_info.cpp.o"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ouster_client.dir/src/sensor_info.cpp.o -c /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/sensor_info.cpp

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/sensor_info.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ouster_client.dir/src/sensor_info.cpp.i"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/sensor_info.cpp > CMakeFiles/ouster_client.dir/src/sensor_info.cpp.i

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/sensor_info.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ouster_client.dir/src/sensor_info.cpp.s"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/sensor_info.cpp -o CMakeFiles/ouster_client.dir/src/sensor_info.cpp.s

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/netcompat.cpp.o: ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/flags.make
ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/netcompat.cpp.o: /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/netcompat.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/netcompat.cpp.o"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ouster_client.dir/src/netcompat.cpp.o -c /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/netcompat.cpp

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/netcompat.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ouster_client.dir/src/netcompat.cpp.i"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/netcompat.cpp > CMakeFiles/ouster_client.dir/src/netcompat.cpp.i

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/netcompat.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ouster_client.dir/src/netcompat.cpp.s"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/netcompat.cpp -o CMakeFiles/ouster_client.dir/src/netcompat.cpp.s

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/lidar_scan.cpp.o: ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/flags.make
ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/lidar_scan.cpp.o: /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/lidar_scan.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/lidar_scan.cpp.o"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ouster_client.dir/src/lidar_scan.cpp.o -c /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/lidar_scan.cpp

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/lidar_scan.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ouster_client.dir/src/lidar_scan.cpp.i"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/lidar_scan.cpp > CMakeFiles/ouster_client.dir/src/lidar_scan.cpp.i

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/lidar_scan.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ouster_client.dir/src/lidar_scan.cpp.s"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/lidar_scan.cpp -o CMakeFiles/ouster_client.dir/src/lidar_scan.cpp.s

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/image_processing.cpp.o: ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/flags.make
ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/image_processing.cpp.o: /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/image_processing.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/image_processing.cpp.o"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ouster_client.dir/src/image_processing.cpp.o -c /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/image_processing.cpp

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/image_processing.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ouster_client.dir/src/image_processing.cpp.i"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/image_processing.cpp > CMakeFiles/ouster_client.dir/src/image_processing.cpp.i

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/image_processing.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ouster_client.dir/src/image_processing.cpp.s"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/image_processing.cpp -o CMakeFiles/ouster_client.dir/src/image_processing.cpp.s

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/buffered_udp_source.cpp.o: ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/flags.make
ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/buffered_udp_source.cpp.o: /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/buffered_udp_source.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/buffered_udp_source.cpp.o"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ouster_client.dir/src/buffered_udp_source.cpp.o -c /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/buffered_udp_source.cpp

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/buffered_udp_source.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ouster_client.dir/src/buffered_udp_source.cpp.i"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/buffered_udp_source.cpp > CMakeFiles/ouster_client.dir/src/buffered_udp_source.cpp.i

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/buffered_udp_source.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ouster_client.dir/src/buffered_udp_source.cpp.s"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/buffered_udp_source.cpp -o CMakeFiles/ouster_client.dir/src/buffered_udp_source.cpp.s

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/parsing.cpp.o: ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/flags.make
ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/parsing.cpp.o: /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/parsing.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/parsing.cpp.o"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ouster_client.dir/src/parsing.cpp.o -c /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/parsing.cpp

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/parsing.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ouster_client.dir/src/parsing.cpp.i"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/parsing.cpp > CMakeFiles/ouster_client.dir/src/parsing.cpp.i

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/parsing.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ouster_client.dir/src/parsing.cpp.s"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/parsing.cpp -o CMakeFiles/ouster_client.dir/src/parsing.cpp.s

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/sensor_http.cpp.o: ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/flags.make
ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/sensor_http.cpp.o: /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/sensor_http.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/sensor_http.cpp.o"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ouster_client.dir/src/sensor_http.cpp.o -c /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/sensor_http.cpp

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/sensor_http.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ouster_client.dir/src/sensor_http.cpp.i"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/sensor_http.cpp > CMakeFiles/ouster_client.dir/src/sensor_http.cpp.i

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/sensor_http.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ouster_client.dir/src/sensor_http.cpp.s"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/sensor_http.cpp -o CMakeFiles/ouster_client.dir/src/sensor_http.cpp.s

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/sensor_http_imp.cpp.o: ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/flags.make
ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/sensor_http_imp.cpp.o: /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/sensor_http_imp.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/sensor_http_imp.cpp.o"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ouster_client.dir/src/sensor_http_imp.cpp.o -c /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/sensor_http_imp.cpp

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/sensor_http_imp.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ouster_client.dir/src/sensor_http_imp.cpp.i"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/sensor_http_imp.cpp > CMakeFiles/ouster_client.dir/src/sensor_http_imp.cpp.i

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/sensor_http_imp.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ouster_client.dir/src/sensor_http_imp.cpp.s"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/sensor_http_imp.cpp -o CMakeFiles/ouster_client.dir/src/sensor_http_imp.cpp.s

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/sensor_tcp_imp.cpp.o: ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/flags.make
ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/sensor_tcp_imp.cpp.o: /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/sensor_tcp_imp.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/sensor_tcp_imp.cpp.o"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ouster_client.dir/src/sensor_tcp_imp.cpp.o -c /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/sensor_tcp_imp.cpp

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/sensor_tcp_imp.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ouster_client.dir/src/sensor_tcp_imp.cpp.i"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/sensor_tcp_imp.cpp > CMakeFiles/ouster_client.dir/src/sensor_tcp_imp.cpp.i

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/sensor_tcp_imp.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ouster_client.dir/src/sensor_tcp_imp.cpp.s"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/sensor_tcp_imp.cpp -o CMakeFiles/ouster_client.dir/src/sensor_tcp_imp.cpp.s

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/logging.cpp.o: ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/flags.make
ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/logging.cpp.o: /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/logging.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/logging.cpp.o"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ouster_client.dir/src/logging.cpp.o -c /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/logging.cpp

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/logging.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ouster_client.dir/src/logging.cpp.i"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/logging.cpp > CMakeFiles/ouster_client.dir/src/logging.cpp.i

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/logging.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ouster_client.dir/src/logging.cpp.s"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/logging.cpp -o CMakeFiles/ouster_client.dir/src/logging.cpp.s

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/profile_extension.cpp.o: ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/flags.make
ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/profile_extension.cpp.o: /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/profile_extension.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building CXX object ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/profile_extension.cpp.o"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ouster_client.dir/src/profile_extension.cpp.o -c /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/profile_extension.cpp

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/profile_extension.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ouster_client.dir/src/profile_extension.cpp.i"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/profile_extension.cpp > CMakeFiles/ouster_client.dir/src/profile_extension.cpp.i

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/profile_extension.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ouster_client.dir/src/profile_extension.cpp.s"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/profile_extension.cpp -o CMakeFiles/ouster_client.dir/src/profile_extension.cpp.s

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/util.cpp.o: ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/flags.make
ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/util.cpp.o: /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/util.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building CXX object ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/util.cpp.o"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ouster_client.dir/src/util.cpp.o -c /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/util.cpp

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/util.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ouster_client.dir/src/util.cpp.i"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/util.cpp > CMakeFiles/ouster_client.dir/src/util.cpp.i

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/util.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ouster_client.dir/src/util.cpp.s"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client/src/util.cpp -o CMakeFiles/ouster_client.dir/src/util.cpp.s

# Object files for target ouster_client
ouster_client_OBJECTS = \
"CMakeFiles/ouster_client.dir/src/client.cpp.o" \
"CMakeFiles/ouster_client.dir/src/types.cpp.o" \
"CMakeFiles/ouster_client.dir/src/sensor_info.cpp.o" \
"CMakeFiles/ouster_client.dir/src/netcompat.cpp.o" \
"CMakeFiles/ouster_client.dir/src/lidar_scan.cpp.o" \
"CMakeFiles/ouster_client.dir/src/image_processing.cpp.o" \
"CMakeFiles/ouster_client.dir/src/buffered_udp_source.cpp.o" \
"CMakeFiles/ouster_client.dir/src/parsing.cpp.o" \
"CMakeFiles/ouster_client.dir/src/sensor_http.cpp.o" \
"CMakeFiles/ouster_client.dir/src/sensor_http_imp.cpp.o" \
"CMakeFiles/ouster_client.dir/src/sensor_tcp_imp.cpp.o" \
"CMakeFiles/ouster_client.dir/src/logging.cpp.o" \
"CMakeFiles/ouster_client.dir/src/profile_extension.cpp.o" \
"CMakeFiles/ouster_client.dir/src/util.cpp.o"

# External object files for target ouster_client
ouster_client_EXTERNAL_OBJECTS =

/workspace/catkin_ws/devel/lib/libouster_client.a: ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/client.cpp.o
/workspace/catkin_ws/devel/lib/libouster_client.a: ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/types.cpp.o
/workspace/catkin_ws/devel/lib/libouster_client.a: ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/sensor_info.cpp.o
/workspace/catkin_ws/devel/lib/libouster_client.a: ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/netcompat.cpp.o
/workspace/catkin_ws/devel/lib/libouster_client.a: ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/lidar_scan.cpp.o
/workspace/catkin_ws/devel/lib/libouster_client.a: ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/image_processing.cpp.o
/workspace/catkin_ws/devel/lib/libouster_client.a: ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/buffered_udp_source.cpp.o
/workspace/catkin_ws/devel/lib/libouster_client.a: ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/parsing.cpp.o
/workspace/catkin_ws/devel/lib/libouster_client.a: ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/sensor_http.cpp.o
/workspace/catkin_ws/devel/lib/libouster_client.a: ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/sensor_http_imp.cpp.o
/workspace/catkin_ws/devel/lib/libouster_client.a: ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/sensor_tcp_imp.cpp.o
/workspace/catkin_ws/devel/lib/libouster_client.a: ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/logging.cpp.o
/workspace/catkin_ws/devel/lib/libouster_client.a: ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/profile_extension.cpp.o
/workspace/catkin_ws/devel/lib/libouster_client.a: ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/src/util.cpp.o
/workspace/catkin_ws/devel/lib/libouster_client.a: ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/build.make
/workspace/catkin_ws/devel/lib/libouster_client.a: ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/workspace/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Linking CXX static library /workspace/catkin_ws/devel/lib/libouster_client.a"
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && $(CMAKE_COMMAND) -P CMakeFiles/ouster_client.dir/cmake_clean_target.cmake
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ouster_client.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/build: /workspace/catkin_ws/devel/lib/libouster_client.a

.PHONY : ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/build

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/clean:
	cd /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client && $(CMAKE_COMMAND) -P CMakeFiles/ouster_client.dir/cmake_clean.cmake
.PHONY : ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/clean

ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/depend:
	cd /workspace/catkin_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /workspace/catkin_ws/src /workspace/catkin_ws/src/ouster-ros/ouster-sdk/ouster_client /workspace/catkin_ws/build /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client /workspace/catkin_ws/build/ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : ouster-ros/ouster_example/ouster_client/CMakeFiles/ouster_client.dir/depend

