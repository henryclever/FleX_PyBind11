# Find FleX
#
# FleX_INCLUDE_DIR
# FleX_LIB_DIRS
# FleX_LIBRARIES
# FleX_FOUND

if("${CMAKE_SIZEOF_VOID_P}" EQUAL "8")
     set(OSBIT 64)
else("${CMAKE_SIZEOF_VOID_P}" EQUAL "8")
     set(OSBIT 32)
endif("${CMAKE_SIZEOF_VOID_P}" EQUAL "8")

if(APPLE)
    set(OS osx${OSBIT})
else(APPLE)
    set(OS linux${OSBIT})
endif(APPLE)

find_path(FleX_PATH
    NAMES core/platform.cpp
    PATHS "${FleX_ROOT}"
    )

set(FleX_INCLUDE_DIR
    ${FleX_PATH}        #important for something to find a file in the FleX_pose_estimation directory
    ${FleX_ROOT}/core
    ${FleX_ROOT}/include
    ${FleX_ROOT}/extensions
    ${FleX_ROOT}/include
    ${FleX_ROOT}/demo
    )

set(FleX_LIB_DIR
    ${FleX_ROOT}/lib/${OS}
    ${FleX_ROOT}/bin/${OS}
    ${FleX_ROOT}/external/SDL2-2.0.4/lib/x64

    )


find_library(DEBUG_CUDA NAMES NvFlexDebugCUDA_x64.a
            PATHS ${FleX_LIB_DIR})
find_library(DEVICE_DEBUG NAMES NvFlexDeviceDebug_x64.a
            PATHS ${FleX_LIB_DIR})
find_library(DEVICE_RELEASE NAMES NvFlexDeviceRelease_x64.a
            PATHS ${FleX_LIB_DIR})
find_library(EXT_DEBUG_CUDA NAMES NvFlexExtDebugCUDA_x64.a
            PATHS ${FleX_LIB_DIR})
find_library(EXT_RELEASE_CUDA NAMES NvFlexExtReleaseCUDA_x64.a
            PATHS ${FleX_LIB_DIR})
find_library(RELEASE_CUDA NAMES NvFlexReleaseCUDA_x64.a
            PATHS ${FleX_LIB_DIR})
find_library(LIBSDL2MAIN_A NAMES libSDL2main.a
            PATHS ${FleX_LIB_DIR})
find_library(LIBSDL2_TEST_A NAMES libSDL2_test.a
            PATHS ${FleX_LIB_DIR})
find_library(LIBSDL2_A NAMES libSDL2.a #this was created with -fPIC flag added to line 151 in SDL2-2.0.4/CMakeLists.txt
            PATHS ${FleX_LIB_DIR})


set(FleX_LIBRARIES
    ${DEBUG_CUDA}
    ${DEVICE_DEBUG}
    ${DEVICE_RELEASE}
    ${EXT_DEBUG_CUDA}
    ${EXT_RELEASE_CUDA}
    ${RELEASE_CUDA}
    ${LIBSDL2MAIN_A}
    ${LIBSDL2_TEST_A}
    ${LIBSDL2_A}
    )

set(FleX_INCLUDE_SOURCE
    ${FleX_ROOT}/core/maths.cpp     #gets rid of _Z8RandInitv Undefined Symbol
    ${FleX_ROOT}/core/voxelize.cpp  #gets rid of _Z8VoxelizePK8XVector3IfEiPKiijjjPjS0_S0_ Undefined Symbol
    ${FleX_ROOT}/core/mesh.cpp      #gets rid of _ZNK4Mesh9GetBoundsER8XVector3IfES2_ Undefined Symbol
    ${FleX_ROOT}/core/platform.cpp  #gets rid of _Z12GetExtensionPKc Undefined Symbol
    ${FleX_ROOT}/core/core.cpp
    ${FleX_ROOT}/core/aabbtree.cpp
    ${FleX_ROOT}/core/extrude.cpp
    ${FleX_ROOT}/core/perlin.cpp
    ${FleX_ROOT}/core/pfm.cpp
    ${FleX_ROOT}/core/png.cpp
    ${FleX_ROOT}/core/sdf.cpp
    ${FleX_ROOT}/core/tga.cpp
    ${FleX_ROOT}/extensions/flexExtCloth.cpp
    ${FleX_ROOT}/extensions/flexExtContainer.cpp
    ${FleX_ROOT}/extensions/flexExtMovingFrame.cpp
    ${FleX_ROOT}/extensions/flexExtRigid.cpp
    ${FleX_ROOT}/extensions/flexExtSoft.cpp
    ${FleX_ROOT}/demo/shadersDemoContext.cpp        #gets rid of _Z13CreateGpuMeshPK4Mesh Undefined Symbol
    ${FleX_ROOT}/demo/opengl/shadersGL.cpp
    ${FleX_ROOT}/demo/opengl/imguiRenderGL.cpp
    ${FleX_ROOT}/demo/opengl/shader.cpp             #gets rid of _ZN12OGL_Renderer14CompileProgramEPKcS1_S1_ Undefined Symbol
    ${FleX_ROOT}/demo/imgui.cpp                     #gets rid of _Z11imguiSliderPKcPffffb Undefined Symbol
)


set(FleX_INCLUDE_HEADER
    ${FleX_ROOT}/include/NvFlex.h
    ${FleX_ROOT}/include/NvFlexExt.h
    ${FleX_ROOT}/include/NvFlexDevice.h
    ${FleX_ROOT}/external/SDL2-2.0.4/include/SDL_video.h
    ${FleX_ROOT}/external/SDL2-2.0.4/include/SDL_shape.h
)



mark_as_advanced(FleX_LIBRARIES)


if(FleX_PATH)
    set(FleX_FOUND TRUE)
endif()

if(NOT FleX_FOUND)
    message(FATAL_ERROR "Could not find Flex. Please set FleX_PATH appropriately and try again.")
endif()