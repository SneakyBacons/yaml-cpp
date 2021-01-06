project "yaml-cpp"
	kind "StaticLib"
	language "C++"

    targetdir("bin/%{prj.name}/" .. outputdir )
    objdir("bin-int/%{prj.name}/" .. outputdir )

	files
	{
		"src/**.h",
		"src/**.cpp",
		
		"include/**.h"
	}

	includedirs
	{
		"include"
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "On"

	filter "system:linux"
		pic "On"
		systemversion "latest"
        cppdialect "C++17"
        
    filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:MemoryProfile"
	  	runtime "Release"
	  	optimize "on"

	filter "configurations:Development"
		runtime "Release"
		optimize "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"