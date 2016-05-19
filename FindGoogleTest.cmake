include(FindPackageHandleStandardArgs)

find_path(GoogleMock_INCLUDE_DIR
        NAMES gmock/gmock.h
        HINTS ENV GOOGLETESTDIR
        PATH_SUFFIXES googlemock/include)

find_library(GoogleMock_LIBRARY
        NAMES gmock
        HINTS ENV GOOGLETESTDIR
        PATH_SUFFIXES build/googlemock)

find_path(GoogleTest_INCLUDE_DIR
        NAMES gtest/gtest.h
        HINTS ENV GOOGLETESTDIR
        PATH_SUFFIXES googletest/include)

find_library(GoogleTest_LIBRARY
        NAMES gtest
        HINTS ENV GOOGLETESTDIR
        PATH_SUFFIXES build/googlemock/gtest)

if (GoogleMock_LIBRARY)
    set(GoogleTest_LIBRARIES ${GoogleMock_LIBRARY} ${GoogleTest_LIBRARY} CACHE STRING "")
else()
    set(GoogleTest_LIBRARIES ${GoogleTest_LIBRARY} CACHE STRING "")
endif()

if (GoogleMock_INCLUDE_DIR)
    set(GoogleTest_INCLUDE_DIRS ${GoogleMock_INCLUDE_DIR} ${GoogleTest_INCLUDE_DIR} CACHE STRING "")
endif()

find_package_handle_standard_args(GoogleTest
        REQUIRED_VARS GoogleTest_LIBRARIES GoogleTest_INCLUDE_DIR)
