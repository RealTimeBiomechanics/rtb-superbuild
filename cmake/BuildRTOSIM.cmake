# RTOSIM
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(Concurrency QUIET)
find_or_build_package(Filter QUIET)
find_package(OpenSim REQUIRED) # TODO can we build&patch Simbody and OpenSim, if they are not available?

ycm_ep_helper(RTOSIM TYPE GIT
                   COMPONENT realtime
                   STYLE GITHUB
                   REPOSITORY RealTimeBiomechanics/rtosim.git
                   DEPENDS Concurrency Filter
                   CMAKE_CACHE_ARGS)
