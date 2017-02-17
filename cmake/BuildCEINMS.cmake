# CEINMS
include(YCMEPHelper)
include(FindOrBuildPackage)
find_or_build_package(Concurrency QUIET)
find_package(Boost REQUIRED COMPONENTS filesystem system)
find_package(XSD REQUIRED)
find_package(XERCES REQUIRED)
ycm_ep_helper(CEINMS TYPE GIT
                   COMPONENT ceinms
                   STYLE GITHUB
                   REPOSITORY CEINMS/CEINMS.git
                   TAG develop
                   DEPENDS Concurrency
                   CMAKE_CACHE_ARGS)
