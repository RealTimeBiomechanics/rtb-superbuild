# mcbs
include(YCMEPHelper)

ycm_ep_helper(mcbs TYPE GIT
                   COMPONENT realtime
                   STYLE GITHUB
                   REPOSITORY RehabEngGroup/mcbs.git
                   TAG develop
                   CMAKE_CACHE_ARGS)
