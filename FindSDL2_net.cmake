include(FindPackageHandleStandardArgs)

if (CMAKE_SIZEOF_VOID_P EQUAL 8)
    set(MORE_LIBRARY_PATH_SUFFIXES lib/x64)
else()
    set(MORE_LIBRARY_PATH_SUFFIXES lib/x86)
endif()

find_path(SDL2_net_INCLUDE_DIR
        NAMES SDL_net.h
        HINTS ENV SDL2NETDIR
        PATH_SUFFIXES SDL SDL2 include include/SDL include/SDL2)

find_library(SDL2_net_LIBRARY
        NAMES SDL2_net
        HINTS ENV SDL2NETDIR
        PATH_SUFFIXES lib ${MORE_LIBRARY_PATH_SUFFIXES})

if(SDL2_net_LIBRARY MATCHES \\.dll$)
    set(SDL2_net_BINARIES ${SDL2_net_LIBRARY} CACHE STRING "")
else()
    set(SDL2_net_BINARIES "" CACHE STRING "")
endif()

set(SDL2_net_LIBRARIES ${SDL2_net_LIBRARY} CACHE STRING "")

unset(MORE_LIBRARY_PATH_SUFFIXES)

find_package_handle_standard_args(SDL2_net
        REQUIRED_VARS SDL2_net_LIBRARIES SDL2_net_INCLUDE_DIR)
