include(FindPackageHandleStandardArgs)

find_path(Lua_INCLUDE_DIR
        NAMES lua.h
        HINTS ENV LUADIR
        PATH_SUFFIXES include)

find_library(Lua_LIBRARY
        NAMES lua lua53
        HINTS ENV LUADIR
        PATH_SUFFIXES lib)

if(Lua_LIBRARY MATCHES \\.dll$)
    set(Lua_BINARIES ${Lua_LIBRARY} CACHE STRING "")
else()
    set(Lua_BINARIES "" CACHE STRING "")
endif()

set(Lua_LIBRARIES ${Lua_LIBRARY} CACHE STRING "")

find_package_handle_standard_args(Lua
        REQUIRED_VARS Lua_LIBRARIES Lua_INCLUDE_DIR)
