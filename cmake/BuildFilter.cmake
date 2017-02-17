# YARP
include(YCMEPHelper)

ycm_ep_helper(Filter TYPE GIT
                   COMPONENT realtime
                   STYLE GITHUB
                   REPOSITORY RealTimeBiomechanics/Filter.git
                   DEPENDS
                   CMAKE_CACHE_ARGS)
