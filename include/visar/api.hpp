#pragma once

// On windows we need spec declarations for shared libraries:
#ifdef _WIN32
	#ifdef VISAR_BUILD_SHARED
		// When building the DLL, we specify we want the classes and functions treated as export
		#define VISAR_API __declspec(dllexport)
	#elif VISAR_BUILD_STATIC
		// Compiling statically we don't want to specify anything as an import
		#define VISAR_API 
	#else
		// When building the executables, we specify we want everything treated as import
		#define VISAR_API __declspec(dllimport)
	#endif
#else
	// On other systems we can leave it empty
	#define VISAR_API 
#endif
