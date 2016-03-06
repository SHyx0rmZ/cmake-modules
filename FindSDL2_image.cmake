include(FindPackageHandleStandardArgs)

if (CMAKE_SIZEOF_VOID_P EQUAL 8)
    set(MORE_LIBRARY_PATH_SUFFIXES lib/x64)
else()
    set(MORE_LIBRARY_PATH_SUFFIXES lib/x86)
endif()

find_path(SDL2_image_INCLUDE_DIR
        NAMES SDL_image.h
        HINTS ENV SDL2IMAGEDIR
        PATH_SUFFIXES SDL SDL2 include include/SDL include/SDL2)

find_library(SDL2_image_LIBRARY
        NAMES SDL2_image
        HINTS ENV SDL2IMAGEDIR
        PATH_SUFFIXES lib ${MORE_LIBRARY_PATH_SUFFIXES})

find_library(SDL2_image_BINARY_jpeg
        NAMES jpeg jpeg-9
        HINTS ENV SDL2IMAGEDIR
        PATH_SUFFIXES lib ${MORE_LIBRARY_PATH_SUFFIXES}
        NO_DEFAULT_PATH)

find_library(SDL2_image_BINARY_png
        NAMES png png16-16
        HINTS ENV SDL2IMAGEDIR
        PATH_SUFFIXES lib ${MORE_LIBRARY_PATH_SUFFIXES}
        NO_DEFAULT_PATH)

find_library(SDL2_image_BINARY_tiff
        NAMES tiff tiff-5
        HINTS ENV SDL2IMAGEDIR
        PATH_SUFFIXES lib ${MORE_LIBRARY_PATH_SUFFIXES}
        NO_DEFAULT_PATH)

find_library(SDL2_image_BINARY_webp
        NAMES webp webp-4
        HINTS ENV SDL2IMAGEDIR
        PATH_SUFFIXES lib ${MORE_LIBRARY_PATH_SUFFIXES}
        NO_DEFAULT_PATH)

find_library(SDL2_image_BINARY_zlib
        NAMES zlib zlib1
        HINTS ENV SDL2IMAGEDIR
        PATH_SUFFIXES lib ${MORE_LIBRARY_PATH_SUFFIXES}
        NO_DEFAULT_PATH)

if(SDL2_image_LIBRARY MATCHES \\.dll$)
    set(SDL2_image_BINARIES ${SDL2_image_LIBRARY})
else()
    set(SDL2_image_BINARIES "")
endif()

if(SDL2_image_BINARY_jpeg MATCHES \\.dll$)
    set(SDL2_image_BINARIES ${SDL2_image_BINARIES} ${SDL2_image_BINARY_jpeg})
endif()

if(SDL2_image_BINARY_png MATCHES \\.dll$)
    set(SDL2_image_BINARIES ${SDL2_image_BINARIES} ${SDL2_image_BINARY_png})
endif()

if(SDL2_image_BINARY_tiff MATCHES \\.dll$)
    set(SDL2_image_BINARIES ${SDL2_image_BINARIES} ${SDL2_image_BINARY_tiff})
endif()

if(SDL2_image_BINARY_webp MATCHES \\.dll$)
    set(SDL2_image_BINARIES ${SDL2_image_BINARIES} ${SDL2_image_BINARY_webp})
endif()

if(SDL2_image_BINARY_zlib MATCHES \\.dll$)
    set(SDL2_image_BINARIES ${SDL2_image_BINARIES} ${SDL2_image_BINARY_zlib})
endif()

set(SDL2_image_BINARIES ${SDL2_image_BINARIES} CACHE STRING "")
set(SDL2_image_LIBRARIES ${SDL2_image_LIBRARY} CACHE STRING "")

unset(MORE_LIBRARY_PATH_SUFFIXES)
unset(SDL2_image_BINARY_freetype)

find_package_handle_standard_args(SDL2_image
        REQUIRED_VARS SDL2_image_LIBRARIES SDL2_image_INCLUDE_DIR)
