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
include src/tests/test-code/CMakeFiles/runBasicTests.dir/depend.make

# Include the progress variables for this target.
include src/tests/test-code/CMakeFiles/runBasicTests.dir/progress.make

# Include the compile flags for this target's objects.
include src/tests/test-code/CMakeFiles/runBasicTests.dir/flags.make

src/tests/test-code/CMakeFiles/runBasicTests.dir/checks.cpp.o: src/tests/test-code/CMakeFiles/runBasicTests.dir/flags.make
src/tests/test-code/CMakeFiles/runBasicTests.dir/checks.cpp.o: ../src/tests/test-code/checks.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/nlsteers/Dropbox/Documents/University/Y4/Computer Networks and Operating Systems/sntp-coursework/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/tests/test-code/CMakeFiles/runBasicTests.dir/checks.cpp.o"
	cd "/Users/nlsteers/Dropbox/Documents/University/Y4/Computer Networks and Operating Systems/sntp-coursework/cmake-build-debug/src/tests/test-code" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/runBasicTests.dir/checks.cpp.o -c "/Users/nlsteers/Dropbox/Documents/University/Y4/Computer Networks and Operating Systems/sntp-coursework/src/tests/test-code/checks.cpp"

src/tests/test-code/CMakeFiles/runBasicTests.dir/checks.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/runBasicTests.dir/checks.cpp.i"
	cd "/Users/nlsteers/Dropbox/Documents/University/Y4/Computer Networks and Operating Systems/sntp-coursework/cmake-build-debug/src/tests/test-code" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/nlsteers/Dropbox/Documents/University/Y4/Computer Networks and Operating Systems/sntp-coursework/src/tests/test-code/checks.cpp" > CMakeFiles/runBasicTests.dir/checks.cpp.i

src/tests/test-code/CMakeFiles/runBasicTests.dir/checks.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/runBasicTests.dir/checks.cpp.s"
	cd "/Users/nlsteers/Dropbox/Documents/University/Y4/Computer Networks and Operating Systems/sntp-coursework/cmake-build-debug/src/tests/test-code" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/nlsteers/Dropbox/Documents/University/Y4/Computer Networks and Operating Systems/sntp-coursework/src/tests/test-code/checks.cpp" -o CMakeFiles/runBasicTests.dir/checks.cpp.s

src/tests/test-code/CMakeFiles/runBasicTests.dir/checks.cpp.o.requires:

.PHONY : src/tests/test-code/CMakeFiles/runBasicTests.dir/checks.cpp.o.requires

src/tests/test-code/CMakeFiles/runBasicTests.dir/checks.cpp.o.provides: src/tests/test-code/CMakeFiles/runBasicTests.dir/checks.cpp.o.requires
	$(MAKE) -f src/tests/test-code/CMakeFiles/runBasicTests.dir/build.make src/tests/test-code/CMakeFiles/runBasicTests.dir/checks.cpp.o.provides.build
.PHONY : src/tests/test-code/CMakeFiles/runBasicTests.dir/checks.cpp.o.provides

src/tests/test-code/CMakeFiles/runBasicTests.dir/checks.cpp.o.provides.build: src/tests/test-code/CMakeFiles/runBasicTests.dir/checks.cpp.o


# Object files for target runBasicTests
runBasicTests_OBJECTS = \
"CMakeFiles/runBasicTests.dir/checks.cpp.o"

# External object files for target runBasicTests
runBasicTests_EXTERNAL_OBJECTS =

src/tests/test-code/runBasicTests: src/tests/test-code/CMakeFiles/runBasicTests.dir/checks.cpp.o
src/tests/test-code/runBasicTests: src/tests/test-code/CMakeFiles/runBasicTests.dir/build.make
src/tests/test-code/runBasicTests: src/tests/lib/googletest/libgtest.a
src/tests/test-code/runBasicTests: src/tests/lib/googletest/libgtest_main.a
src/tests/test-code/runBasicTests: src/tests/lib/googletest/libgtest.a
src/tests/test-code/runBasicTests: src/tests/test-code/CMakeFiles/runBasicTests.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/Users/nlsteers/Dropbox/Documents/University/Y4/Computer Networks and Operating Systems/sntp-coursework/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable runBasicTests"
	cd "/Users/nlsteers/Dropbox/Documents/University/Y4/Computer Networks and Operating Systems/sntp-coursework/cmake-build-debug/src/tests/test-code" && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/runBasicTests.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/tests/test-code/CMakeFiles/runBasicTests.dir/build: src/tests/test-code/runBasicTests

.PHONY : src/tests/test-code/CMakeFiles/runBasicTests.dir/build

src/tests/test-code/CMakeFiles/runBasicTests.dir/requires: src/tests/test-code/CMakeFiles/runBasicTests.dir/checks.cpp.o.requires

.PHONY : src/tests/test-code/CMakeFiles/runBasicTests.dir/requires

src/tests/test-code/CMakeFiles/runBasicTests.dir/clean:
	cd "/Users/nlsteers/Dropbox/Documents/University/Y4/Computer Networks and Operating Systems/sntp-coursework/cmake-build-debug/src/tests/test-code" && $(CMAKE_COMMAND) -P CMakeFiles/runBasicTests.dir/cmake_clean.cmake
.PHONY : src/tests/test-code/CMakeFiles/runBasicTests.dir/clean

src/tests/test-code/CMakeFiles/runBasicTests.dir/depend:
	cd "/Users/nlsteers/Dropbox/Documents/University/Y4/Computer Networks and Operating Systems/sntp-coursework/cmake-build-debug" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/Users/nlsteers/Dropbox/Documents/University/Y4/Computer Networks and Operating Systems/sntp-coursework" "/Users/nlsteers/Dropbox/Documents/University/Y4/Computer Networks and Operating Systems/sntp-coursework/src/tests/test-code" "/Users/nlsteers/Dropbox/Documents/University/Y4/Computer Networks and Operating Systems/sntp-coursework/cmake-build-debug" "/Users/nlsteers/Dropbox/Documents/University/Y4/Computer Networks and Operating Systems/sntp-coursework/cmake-build-debug/src/tests/test-code" "/Users/nlsteers/Dropbox/Documents/University/Y4/Computer Networks and Operating Systems/sntp-coursework/cmake-build-debug/src/tests/test-code/CMakeFiles/runBasicTests.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : src/tests/test-code/CMakeFiles/runBasicTests.dir/depend

