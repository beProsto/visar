# minimum version of cmake this will work on
cmake_minimum_required(VERSION 3.0.0)

# project name Major.Minor.Patch
project(mylib VERSION 1.0.0)

# include_directories and link_libraries work on all targets defined BELOW them
# translates to -Iinclude
include_directories(include)

# recursively search the include and src directories
file(GLOB_RECURSE srcs
	"include/*.hpp"
	"include/*.h"
	"src/*.cpp"
	"src/*.c"
)

# depending on the library type, we set a correct macro
# create a library of of the sources
if(LIBTYPE STREQUAL "STATIC")
	add_library(mylib STATIC ${srcs})
	target_compile_definitions(mylib PRIVATE LIB_BUILD_STATIC)

else()
	add_library(mylib SHARED ${srcs})
	target_compile_definitions(mylib PRIVATE LIB_BUILD_SHARED)

endif()

# cmake's ez :D