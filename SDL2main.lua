project "SDL2main"
	kind          "StaticLib"
	language      "C"

	systemversion "latest"

	flags {
		          "NoRuntimeChecks",      -- Only used on Visual Studio.
		          "NoBufferSecurityCheck"
	}

	vectorextensions "SSE"                -- Necessary to run x32.

	location          "%{wks.location}/bin/int/ProjectFiles/%{_ACTION}"

    	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    	objdir ("%{wks.location}/bin/int/" .. outputdir .. "/%{prj.name}")

	includedirs     {"include"}

	files           {"src/main/windows/*.c"}	

	systemversion    "latest"
	defines {
					 "_WINDOWS",
					 "WIN32"
	}

	filter "configurations:Debug"
		defines {
			         "_DEBUG"
		}
		runtime      "Debug"
		symbols      "On"

	filter "configurations:Release"
		defines {
			         "NDEBUG"
		}
		runtime      "Release"
		optimize     "Speed"
