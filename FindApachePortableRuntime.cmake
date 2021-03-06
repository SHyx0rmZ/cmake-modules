include(FindPackageHandleStandardArgs)

find_path(ApachePortableRuntime_INCLUDE_DIR
        NAMES apr.h
        HINTS ENV APACHEPORTABLERUNTIMEDIR
        PATHS /usr/local/apache2
        PATH_SUFFIXES include include/apr-2 include/apr-2.0 include/apr-1 include/apr-1.0)

find_library(ApachePortableRuntime_LIBRARY
        NAMES apr-2 apr-1
        HINTS ENV APACHEPORTABLERUNTIMEDIR
        PATHS /usr/local/apache2 /usr/local
        PATH_SUFFIXES lib)

set(ApachePortableRuntime_LIBRARIES ${ApachePortableRuntime_LIBRARY} CACHE STRING "")

find_package_handle_standard_args(ApachePortableRuntime
        REQUIRED_VARS ApachePortableRuntime_LIBRARIES ApachePortableRuntime_INCLUDE_DIR)
