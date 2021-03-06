include(FindPackageHandleStandardArgs)

find_path(Apache2_INCLUDE_DIR
        NAMES httpd.h
        HINTS ENV APACHE2DIR
        PATHS /usr/local/apache2
        PATH_SUFFIXES include include/apache24 include/apache22)

find_package_handle_standard_args(Apache2
        REQUIRED_VARS Apache2_INCLUDE_DIR)
