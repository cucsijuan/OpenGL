workspace "OpenGL"
	architecture "x86"
	startproject "OpenGL"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	} 
	
	outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "dependencies/GLEW/include"
IncludeDir["GLFW"] = "dependencies/GLFW/include"

project "OpenGL"
	location "OpenGL"
	kind "Consoleapp"
	language "C++"
	staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.GLEW}"
	}
	
	configuration "windows"
		libdirs { "../dependencies/GLFW/lib-vc2019", "../dependencies/GLEW/lib/Release/Win32"}
		links { "user32", "gdi32", "opengl32", "glew32s.lib", "glfw3" }
		defines { "GLEW_STATIC"	}
	
	configuration {}
	
	filter "system:windows"
		cppdialect "C++17"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		runtime "Release"
		optimize "On"

	filter "configurations:Dist"
		runtime "Release"
		optimize "On"
		
	filter {}