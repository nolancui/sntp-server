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
CMAKE_COMMAND = "/Users/nlsteers/Library/Application Support/JetBrains/Toolbox/apps/CLion/ch-0/163.7743.47/CLion.app/Contents/bin/cmake/bin/cmake"

# The command to remove a file.
RM = "/Users/nlsteers/Library/Application Support/JetBrains/Toolbox/apps/CLion/ch-0/163.7743.47/CLion.app/Contents/bin/cmake/bin/cmake" -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/Users/nlsteers/Dropbox/Documents/University/Y4/Computer Networks and Operating Systems/sntp-coursework"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/Users/nlsteers/Dropbox/Documents/University/Y4/Computer Networks and Operating Systems/sntp-coursework/cmake-build-debug"

# Include any dependencies generated for this target.
include CMakeFiles/sntp-client.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/sntp-client.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/sntp-client.dir/flags.make

CMakeFiles/sntp-client.dir/src/client/sntp-multicast-client.c.o: CMakeFiles/sntp-client.dir/flags.make
CMakeFiles/sntp-client.dir/src/client/sntp-multicast-client.c.o: ../src/client/sntp-multicast-client.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/nlsteers/Dropbox/Documents/University/Y4/Computer Networks and Operating Systems/sntp-coursework/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/sntp-client.dir/src/client/sntp-multicast-client.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/sntp-client.dir/src/client/sntp-multicast-client.c.o   -c "/Users/nlsteers/Dropbox/Documents/University/Y4/Computer Networks and Operating Systems/sntp-coursework/src/client/sntp-multicast-client.c"

CMakeFiles/sntp-client.dir/src/client/sntp-multicast-client.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sntp-client.dir/src/client/sntp-multicast-client.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/Users/nlsteers/Dropbox/Documents/University/Y4/Computer Networks and Operating Systems/sntp-coursework/src/client/sntp-multicast-client.c" > CMakeFiles/sntp-client.dir/src/client/sntp-multicast-client.c.i

CMakeFiles/sntp-client.dir/src/client/sntp-multicast-client.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sntp-client.dir/src/client/sntp-multicast-client.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/Users/nlsteers/Dropbox/Documents/University/Y4/Computer Networks and Operating Systems/sntp-coursework/src/client/sntp-multicast-client.c" -o CMakeFiles/sntp-client.dir/src/client/sntp-multicast-client.c.s

CMakeFiles/sntp-client.dir/src/client/sntp-multicast-client.c.o.requires:

.PHONY : CMakeFiles/sntp-client.dir/src/client/sntp-multicast-client.c.o.requires

CMakeFiles/sntp-client.dir/src/client/sntp-multicast-client.c.o.provides: CMakeFiles/sntp-client.dir/src/client/sntp-multicast-client.c.o.requires
	$(MAKE) -f CMakeFiles/sntp-client.dir/build.make CMakeFiles/sntp-client.dir/src/client/sntp-multicast-client.c.o.provides.build
.PHONY : CMakeFiles/sntp-client.dir/src/client/sntp-multicast-client.c.o.provides

CMakeFiles/sntp-client.dir/src/client/sntp-multicast-client.c.o.provides.build: CMakeFiles/sntp-client.dir/src/client/sntp-multicast-client.c.o


# Object files for target sntp-client
sntp__client_OBJECTS = \
"CMakeFiles/sntp-client.dir/src/client/sntp-multicast-client.c.o"

# External object files for target sntp-client
sntp__client_EXTERNAL_OBJECTS =

sntp-client: CMakeFiles/sntp-client.dir/src/client/sntp-multicast-client.c.o
sntp-client: CMakeFiles/sntp-client.dir/build.make
sntp-client: CMakeFiles/sntp-client.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/Users/nlsteers/Dropbox/Documents/University/Y4/Computer Networks and Operating Systems/sntp-coursework/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable sntp-client"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sntp-client.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/sntp-client.dir/build: sntp-client

.PHONY : CMakeFiles/sntp-client.dir/build

CMakeFiles/sntp-client.dir/requires: CMakeFiles/sntp-client.dir/src/client/sntp-multicast-client.c.o.requires

.PHONY : CMakeFiles/sntp-client.dir/requires

CMakeFiles/sntp-client.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/sntp-client.dir/cmake_clean.cmake
.PHONY : CMakeFiles/sntp-client.dir/clean

CMakeFiles/sntp-client.dir/depend:
	cd "/Users/nlsteers/Dropbox/Documents/University/Y4/Computer Networks and Operating Systems/sntp-coursework/cmake-build-debug" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/Users/nlsteers/Dropbox/Documents/University/Y4/Computer Networks and Operating Systems/sntp-coursework" "/Users/nlsteers/Dropbox/Documents/University/Y4/Computer Networks and Operating Systems/sntp-coursework" "/Users/nlsteers/Dropbox/Documents/University/Y4/Computer Networks and Operating Systems/sntp-coursework/cmake-build-debug" "/Users/nlsteers/Dropbox/Documents/University/Y4/Computer Networks and Operating Systems/sntp-coursework/cmake-build-debug" "/Users/nlsteers/Dropbox/Documents/University/Y4/Computer Networks and Operating Systems/sntp-coursework/cmake-build-debug/CMakeFiles/sntp-client.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/sntp-client.dir/depend

