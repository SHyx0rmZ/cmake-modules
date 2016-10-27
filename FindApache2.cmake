include(FindPackageHandleStandardArgs)

find_path(Apache2_INCLUDE_DIR
        NAMES httpd.h
        HINTS ENV APACHE2DIR
        PATHS /usr/local/apache2
        PATH_SUFFIXES include)

find_library(Apache2_LIBRARY
        NAMES apr-2
        HINTS ENV APACHE2DIR
        PATHS /usr/local/apache2
        PATH_SUFFIXES lib)

set(Apache2_LIBRARIES ${Apache2_LIBRARY} CACHE STRING "")

find_package_handle_standard_args(Apache2
        REQUIRED_VARS Apache2_LIBRARIES Apache2_INCLUDE_DIR)
