# Generated by opp_cmake
add_library(veins SHARED IMPORTED GLOBAL)
set_target_properties(veins PROPERTIES
  IMPORTED_LOCATION_RELEASE "/home/yacheur/apps/artery/extern/veins/out/clang-release/src/${CMAKE_SHARED_LIBRARY_PREFIX}veins${CMAKE_SHARED_LIBRARY_SUFFIX}"
  IMPORTED_NO_SONAME TRUE
  IMPORTED_LOCATION_DEBUG "/home/yacheur/apps/artery/extern/veins/out/clang-debug/src/${CMAKE_SHARED_LIBRARY_PREFIX}veins_dbg${CMAKE_SHARED_LIBRARY_SUFFIX}"
  IMPORTED_NO_SONAME TRUE
  INTERFACE_INCLUDE_DIRECTORIES "/home/yacheur/apps/artery/extern/veins/src;/home/yacheur/apps/artery/extern/veins/src"
  NED_FOLDERS "/home/yacheur/apps/artery/extern/veins/examples/veins;/home/yacheur/apps/artery/extern/veins/src/veins"
  OMNETPP_LIBRARY TRUE
)
set_property(TARGET veins PROPERTY IMPORTED_CONFIGURATIONS RELEASE DEBUG)
