outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "freetype"
    kind "StaticLib"
    language "C"
    staticruntime "On"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-temp/" .. outputdir .. "/%{prj.name}")

    files {
        "include/**.h",

        "src/base/ftsystem.c",
        "src/base/ftdebug.c",
        "src/base/ftinit.c",
        "src/base/ftbitmap.c",
        "src/base/ftbase.c",

        "src/sfnt/sfnt.c",
        "src/truetype/truetype.c",
        "src/cff/cff.c",
        "src/type1/type1.c",
        "src/type42/type42.c",
        "src/winfonts/winfnt.c",
        "src/pcf/pcf.c",
        "src/bdf/bdf.c",
        "src/pfr/pfr.c",
        "src/cid/type1cid.c",

        "src/autofit/autofit.c",
        "src/psaux/psaux.c",
        "src/psnames/psnames.c",
        "src/pshinter/pshinter.c",
        "src/raster/raster.c",
        "src/smooth/smooth.c",
        "src/sdf/sdf.c",
        "src/svg/svg.c",
        "src/gzip/ftgzip.c",
        "src/lzw/ftlzw.c",
        "src/gzip/ftgzip.c",

        "src/base/ftmm.c",
    }

    includedirs { 
        "include",
    }

    defines { "FT2_BUILD_LIBRARY", "_CRT_SECURE_NO_WARNINGS" }

    filter "system:windows"
        systemversion "latest"

    filter { "configurations:Debug" }
        runtime "Debug"
        symbols "On"

    filter { "configurations:Release" }
        runtime "Release"
        optimize "On"