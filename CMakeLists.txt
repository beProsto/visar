# minimum version of cmake this will work on
cmake_minimum_required(VERSION 3.0.0)

# project's name and version
set(project_name visar)
project(${project_name} VERSION 1.0.0)

# add ./include/ as an include directory
include_directories(include)

# include additional cmake scripts
include("cmake_include/utils.cmake")

# recursively search the include and src directories
file(GLOB_RECURSE srcs
	"include/*.hpp"
	"src/*.hpp"
	"src/*.cpp"
)

# depending on the library type, we set a correct macro
# create a library out of the sources
if(VISAR_BUILD_STATIC)
	add_library(${project_name} STATIC ${srcs})
	target_compile_definitions(${project_name} PRIVATE VISAR_BUILD_STATIC)

else()
	add_library(${project_name} SHARED ${srcs})
	target_compile_definitions(${project_name} PRIVATE VISAR_BUILD_SHARED)

endif()

# build examples
link_libraries(${project_name})
visar_add_example("test")
visar_add_example("circle")