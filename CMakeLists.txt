cmake_minimum_required(VERSION 2.8.11)
project(rtb-superbuild NONE)

## we have to enable C because it is currently used
## by CMake to describe packages (in Config*.cmake files)
enable_language(C)

set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

set(RTB-SUPERBUILD_MAJOR_VERSION 0)
set(RTB-SUPERBUILD_MINOR_VERSION 1)
set(RTB-SUPERBUILD_PATCH_VERSION 0)
set(RTB-SUPERBUILD_VERSION ${RTB-SUPERBUILD_MAJOR_VERSION}.${RTB-SUPERBUILD_MINOR_VERSION}.${RTB-SUPERBUILD_PATCH_VERSION})

include(CTest)
include(FeatureSummary)

set(YCM_USE_CMAKE_PROPOSED TRUE CACHE BOOL "Use files including unmerged cmake patches")

#Add options
option(RTB-SUPERBUILD_RTOSIM "Build RTOSIM and its dependencies" TRUE)
option(RTB-SUPERBUILD_CEINMS "Build CEINMS and its dependencies" TRUE)
option(RTB-SUPERBUILD_CEINMS_RT_DEPS "Build all dependencies required for realtime CEINMS packages such as ceinms_ros catkin package" FALSE)

# Bootstrap YCM
include(YCMBootstrap)

include(FindOrBuildPackage)
include(YCMEPHelper)

if(RTB-SUPERBUILD_CEINMS OR RTB-SUPERBUILD_CEINMS_RT_DEPS)
   find_or_build_package(CEINMS)
endif()

if(RTB-SUPERBUILD_CEINMS_RT_DEPS)
    find_or_build_package(mcbs)
    find_or_build_package(Filter)
endif()

if(RTB-SUPERBUILD_RTOSIM)
    find_or_build_package(RTOSIM)
endif()

set_package_properties(Git PROPERTIES TYPE RUNTIME)
#set_package_properties(Subversion PROPERTIES TYPE RUNTIME)
#set_package_properties(PkgConfig PROPERTIES TYPE RUNTIME)
#set_package_properties(Doxygen PROPERTIES TYPE RUNTIME)

feature_summary(WHAT ALL INCLUDE_QUIET_PACKAGES FATAL_ON_MISSING_REQUIRED_PACKAGES)
