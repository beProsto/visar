if(WIN32)
	set(VISAR_SYSTEM_WINDOWS TRUE)

elseif(UNIX)
	set(VISAR_SYSTEM_LINUX TRUE)

endif()


if(LIBTYPE STREQUAL "STATIC")
	set(VISAR_BUILD_STATIC TRUE)

else()
	set(VISAR_BUILD_SHARED TRUE)

endif()


if(BUILD_EXAMPLES STREQUAL "NO")
	set(VISAR_EXAMPLES_OFF TRUE)

else()
	set(VISAR_EXAMPLES_ON TRUE)

endif()


if(VISAR_SYSTEM_WINDOWS)
	set(VISAR_EXE_TYPE WIN32)

else()
	set(VISAR_EXE_TYPE )

endif()


function(visar_add_example name)
	if(VISAR_EXAMPLES_ON)
		file(GLOB_RECURSE ${name}_srcs
			"examples/${name}/*.hpp"
			"examples/${name}/*.cpp"
		)

		add_executable(${name} ${VISAR_EXE_TYPE} ${${name}_srcs})

		if(VISAR_BUILD_STATIC)
			target_compile_definitions(${name} PRIVATE VISAR_BUILD_STATIC)
		endif()
	endif()
endfunction()