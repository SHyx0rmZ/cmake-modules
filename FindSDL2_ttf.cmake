include(FindPackageHandleStandardArgs)

if (CMAKE_SIZEOF_VOID_P EQUAL 8)
    set(MORE_LIBRARY_PATH_SUFFIXES lib/x64)
else()
    set(MORE_LIBRARY_PATH_SUFFIXES lib/x86)
endif()

find_path(SDL2_ttf_INCLUDE_DIR
        NAMES SDL_ttf.h
        HINTS ENV SDL2TTFDIR
        PATH_SUFFIXES SDL SDL2 include include/SDL include/SDL2)

find_library(SDL2_ttf_LIBRARY
        NAMES SDL2_ttf
        HINTS ENV SDL2TTFDIR
        PATH_SUFFIXES lib ${MORE_LIBRARY_PATH_SUFFIXES})

find_library(SDL2_ttf_BINARY_freetype
        NAMES freetype freetype-6
        HINTS ENV SDL2TTFDIR
        PATH_SUFFIXES lib ${MORE_LIBRARY_PATH_SUFFIXES}
        NO_DEFAULT_PATH)

find_library(SDL2_ttf_BINARY_zlib
        NAMES zlib zlib1
        HINTS ENV SDL2TTFDIR
        PATH_SUFFIXES lib ${MORE_LIBRARY_PATH_SUFFIXES}
        NO_DEFAULT_PATH)

if(SDL2_ttf_LIBRARY MATCHES \\.dll$)
    set(SDL2_ttf_BINARIES ${SDL2_ttf_LIBRARY})
else()
    set(SDL2_ttf_BINARIES "")
endif()

if(SDL2_ttf_BINARY_freetype MATCHES \\.dll$)
    set(SDL2_ttf_BINARIES ${SDL2_ttf_BINARIES} ${SDL2_ttf_BINARY_freetype})
endif()

if(SDL2_ttf_BINARY_zlib MATCHES \\.dll$)
    set(SDL2_ttf_BINARIES ${SDL2_ttf_BINARIES} ${SDL2_ttf_BINARY_zlib})
endif()

set(SDL2_ttf_BINARIES ${SDL2_ttf_BINARIES} CACHE STRING "")
set(SDL2_ttf_LIBRARIES ${SDL2_ttf_LIBRARY} CACHE STRING "")

unset(MORE_LIBRARY_PATH_SUFFIXES)
unset(SDL2_ttf_BINARY_freetype)

find_package_handle_standard_args(SDL2_ttf
        REQUIRED_VARS SDL2_ttf_LIBRARIES SDL2_ttf_INCLUDE_DIR)
