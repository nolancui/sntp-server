# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.6

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
CMAKE_COMMAND = /home/netlab/nlsteers/Documents/clion-2016.3/bin/cmake/bin/cmake

# The command to remove a file.
RM = /home/netlab/nlsteers/Documents/clion-2016.3/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/netlab/nlsteers/Documents/CNOS-Labwork/sntp-coursework

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/netlab/nlsteers/Documents/CNOS-Labwork/sntp-coursework/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/multicast-server.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/multicast-server.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/multicast-server.dir/flags.make

CMakeFiles/multicast-server.dir/src/server/sntp-multicast-server.c.o: CMakeFiles/multicast-server.dir/flags.make
CMakeFiles/multicast-server.dir/src/server/sntp-multicast-server.c.o: ../src/server/sntp-multicast-server.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/netlab/nlsteers/Documents/CNOS-Labwork/sntp-coursework/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/multicast-server.dir/src/server/sntp-multicast-server.c.o"
	/usr/lib64/ccache/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/multicast-server.dir/src/server/sntp-multicast-server.c.o   -c /home/netlab/nlsteers/Documents/CNOS-Labwork/sntp-coursework/src/server/sntp-multicast-server.c

CMakeFiles/multicast-server.dir/src/server/sntp-multicast-server.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/multicast-server.dir/src/server/sntp-multicast-server.c.i"
	/usr/lib64/ccache/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/netlab/nlsteers/Documents/CNOS-Labwork/sntp-coursework/src/server/sntp-multicast-server.c > CMakeFiles/multicast-server.dir/src/server/sntp-multicast-server.c.i

CMakeFiles/multicast-server.dir/src/server/sntp-multicast-server.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/multicast-server.dir/src/server/sntp-multicast-server.c.s"
	/usr/lib64/ccache/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/netlab/nlsteers/Documents/CNOS-Labwork/sntp-coursework/src/server/sntp-multicast-server.c -o CMakeFiles/multicast-server.dir/src/server/sntp-multicast-server.c.s

CMakeFiles/multicast-server.dir/src/server/sntp-multicast-server.c.o.requires:

.PHONY : CMakeFiles/multicast-server.dir/src/server/sntp-multicast-server.c.o.requires

CMakeFiles/multicast-server.dir/src/server/sntp-multicast-server.c.o.provides: CMakeFiles/multicast-server.dir/src/server/sntp-multicast-server.c.o.requires
	$(MAKE) -f CMakeFiles/multicast-server.dir/build.make CMakeFiles/multicast-server.dir/src/server/sntp-multicast-server.c.o.provides.build
.PHONY : CMakeFiles/multicast-server.dir/src/server/sntp-multicast-server.c.o.provides

CMakeFiles/multicast-server.dir/src/server/sntp-multicast-server.c.o.provides.build: CMakeFiles/multicast-server.dir/src/server/sntp-multicast-server.c.o


# Object files for target multicast-server
multicast__server_OBJECTS = \
"CMakeFiles/multicast-server.dir/src/server/sntp-multicast-server.c.o"

# External object files for target multicast-server
multicast__server_EXTERNAL_OBJECTS =

multicast-server: CMakeFiles/multicast-server.dir/src/server/sntp-multicast-server.c.o
multicast-server: CMakeFiles/multicast-server.dir/build.make
multicast-server: CMakeFiles/multicast-server.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/netlab/nlsteers/Documents/CNOS-Labwork/sntp-coursework/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable multicast-server"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/multicast-server.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/multicast-server.dir/build: multicast-server

.PHONY : CMakeFiles/multicast-server.dir/build

CMakeFiles/multicast-server.dir/requires: CMakeFiles/multicast-server.dir/src/server/sntp-multicast-server.c.o.requires

.PHONY : CMakeFiles/multicast-server.dir/requires

CMakeFiles/multicast-server.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/multicast-server.dir/cmake_clean.cmake
.PHONY : CMakeFiles/multicast-server.dir/clean

CMakeFiles/multicast-server.dir/depend:
	cd /home/netlab/nlsteers/Documents/CNOS-Labwork/sntp-coursework/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/netlab/nlsteers/Documents/CNOS-Labwork/sntp-coursework /home/netlab/nlsteers/Documents/CNOS-Labwork/sntp-coursework /home/netlab/nlsteers/Documents/CNOS-Labwork/sntp-coursework/cmake-build-debug /home/netlab/nlsteers/Documents/CNOS-Labwork/sntp-coursework/cmake-build-debug /home/netlab/nlsteers/Documents/CNOS-Labwork/sntp-coursework/cmake-build-debug/CMakeFiles/multicast-server.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/multicast-server.dir/depend

