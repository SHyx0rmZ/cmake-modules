include(FindPackageHandleStandardArgs)

if (CMAKE_SIZEOF_VOID_P EQUAL 8)
    set(MORE_LIBRARY_PATH_SUFFIXES Source/lib)
else()
    set(MORE_LIBRARY_PATH_SUFFIXES Source/lib32)
endif()

find_path(Vulkan_INCLUDE_DIR
        NAMES vulkan.h
        HINTS ENV VK_SDK_PATH
        PATH_SUFFIXES vulkan include/vulkan Include/vulkan)

find_library(Vulkan_LIBRARY
        NAMES vulkan vulkan-1
        HINTS ENV VK_SDK_PATH
        PATH_SUFFIXES ${MORE_LIBRARY_PATH_SUFFIXES})

set(Vulkan_LIBRARIES ${Vulkan_LIBRARY} CACHE STRING "")

unset(MORE_LIBRARY_PATH_SUFFIXES)

find_package_handle_standard_args(Vulkan
        REQUIRED_VARS Vulkan_LIBRARIES Vulkan_INCLUDE_DIR)
