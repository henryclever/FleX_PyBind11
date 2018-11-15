# Find CUDA
#
# CUDA_INCLUDE_DIR
# CUDA_LIB_DIRS
# CUDA_LIBRARIES
# CUDA_FOUND


find_path(CUDA_PATH
    NAMES include/cuda.h
    PATHS "${CUDA_ROOT}"
    )

set(CUDA_INCLUDE_DIR
    ${CUDA_PATH}
    )

set(CUDA_LIB_DIR
    ${CUDA_ROOT}/lib64
    ${CUDA_ROOT}/extras/CUPTI/lib64
    ${CUDA_ROOT}/bin
    ${CUDA_ROOT}/extras/demo_suite
    )



find_library(LIB_CUBLAS_148 NAMES libcublas.so.9.2.148
            PATHS ${CUDA_LIB_DIR})
find_library(LIB_CUBLAS_STATIC_A NAMES libcublas_static.a
            PATHS ${CUDA_LIB_DIR})
find_library(LIB_CUDART_STATIC_A NAMES libcudart_static.a
            PATHS ${CUDA_LIB_DIR})
find_library(LIB_CUFFT_148 NAMES libcufft.so.9.2.148
            PATHS ${CUDA_LIB_DIR})
find_library(LIB_CUFFT_STATIC_A NAMES libcufft_static.a
            PATHS ${CUDA_LIB_DIR})
find_library(LIB_CUFFT_STATIC_NOCALLBACK_A NAMES libcufft_static_nocallback.a
            PATHS ${CUDA_LIB_DIR})
find_library(LIB_CUFFTW_STATIC_A NAMES libcufftw_static.a
            PATHS ${CUDA_LIB_DIR})
find_library(LIB_CUSOLVER_148 NAMES libcusolver.so.9.2.148
            PATHS ${CUDA_LIB_DIR})
find_library(LIB_CUSOLVER_STATIC_A NAMES libcusolver_static.a
            PATHS ${CUDA_LIB_DIR})
find_library(LIB_CUSPARSE_148 NAMES libcusparse.so.9.2.148
            PATHS ${CUDA_LIB_DIR})
find_library(LIB_NPPC_148 NAMES libnppc.so.9.2.148
            PATHS ${CUDA_LIB_DIR})
find_library(LIB_NPPICOM_148 NAMES libnppicom.so.9.2.148
            PATHS ${CUDA_LIB_DIR})
find_library(LIB_NPPIDEI_148 NAMES libnppidei.so.9.2.148
            PATHS ${CUDA_LIB_DIR})
find_library(LIB_NPPIF_STATIC_A NAMES libnppif_static.a
            PATHS ${CUDA_LIB_DIR})
find_library(LIB_NPPIG_148 NAMES libnppig.so.9.2.148
            PATHS ${CUDA_LIB_DIR})
find_library(LIB_NPPIM_148 NAMES libnppim.so.9.2.148
            PATHS ${CUDA_LIB_DIR})
find_library(LIB_NPPITC_148 NAMES libnppitc.so.9.2.148
            PATHS ${CUDA_LIB_DIR})
find_library(LIB_NPPS_148 NAMES libnpps.so.9.2.148
            PATHS ${CUDA_LIB_DIR})
find_library(LIB_NVBLAS_148 NAMES libnvblas.so.9.2.148
            PATHS ${CUDA_LIB_DIR})
find_library(LIB_NVGRAPH_148 NAMES libnvgraph.so.9.2.148
            PATHS ${CUDA_LIB_DIR})

find_library(LIB_ACCINJ64_148 NAMES libaccinj64.so.9.2.148
            PATHS ${CUDA_LIB_DIR})
find_library(LIB_CUINJ64_148 NAMES libcuinj64.so.9.2.148
            PATHS ${CUDA_LIB_DIR})
find_library(LIB_NPPISU_148 NAMES libnppisu.so.9.2.148
            PATHS ${CUDA_LIB_DIR})
find_library(LIB_CURAND_148 NAMES libcurand.so.9.2.148
            PATHS ${CUDA_LIB_DIR})
find_library(LIB_NPPIST_148 NAMES libnppist.so.9.2.148
            PATHS ${CUDA_LIB_DIR})
find_library(LIB_CUFFTW_148 NAMES libcufftw.so.9.2.148
            PATHS ${CUDA_LIB_DIR})
find_library(LIB_NPPIAL_148 NAMES libnppial.so.9.2.148
            PATHS ${CUDA_LIB_DIR})
find_library(LIB_NPPICC_148 NAMES libnppicc.so.9.2.148
            PATHS ${CUDA_LIB_DIR})
find_library(LIB_CUDART_148 NAMES libcudart.so.9.2.148
            PATHS ${CUDA_LIB_DIR})

find_library(LIB_CUPTI_148 NAMES libcupti.so.9.2.148
            PATHS ${CUDA_LIB_DIR})

#find_library(NVPROF NAMES nvprof
#            PATHS ${CUDA_LIB_DIR})
#find_library(CUDA_MEMCHECK NAMES cuda-memcheck
#            PATHS ${CUDA_LIB_DIR})
#find_library(OCEANFFT NAMES oceanFFT
#            PATHS ${CUDA_LIB_DIR})




set(CUDA_LIBRARIES

    ${LIB_NPPC_148}
    ${LIB_CUSPARSE_148}
    ${LIB_CUBLAS_148}
    ${LIB_NPPITC_148}
    ${LIB_NVBLAS_148}
    ${LIB_CUFFTW_STATIC_A}
    ${LIB_CUSOLVER_STATIC_A}
    ${LIB_CUFFT_STATIC_A}
    ${LIB_NPPS_148}
    ${LIB_CUFFT_148}
    ${LIB_NPPICOM_148}
    ${LIB_CUSOLVER_148}
    ${LIB_CUFFT_STATIC_NOCALLBACK_A}
    ${LIB_NPPIDEI_148}
    ${LIB_NPPIM_148}
    ${LIB_NPPIG_148}
    ${LIB_NVGRAPH_148}
    ${LIB_NPPIF_STATIC_A}
    ${LIB_CUDART_STATIC_A} #gets rid of cudaMemcpyAsync Undefined Symbol
    ${LIB_CUBLAS_STATIC_A}

    ${LIB_ACCINJ64_148}
    ${LIB_CUINJ64_148}
    ${LIB_NPPISU_148}
    ${LIB_CURAND_148}
    ${LIB_NPPIST_148}
    ${LIB_CUFFTW_148}
    ${LIB_NPPIAL_148}
    ${LIB_NPPICC_148}
    ${LIB_CUDART_148}

    ${LIB_CUPTI_148}
    #${NVPROF}
    #${CUDA_MEMCHECK}
    #${OCEANFFT}
    )


#set(CUDA_INCLUDE_SOURCE
#    #stuff here
#)


#set(CUDA_INCLUDE_HEADER
#    #stuff here
#)



mark_as_advanced(CUDA_LIBRARIES)


if(CUDA_PATH)
    set(CUDA_FOUND TRUE)
endif()

if(NOT CUDA_FOUND)
    message(FATAL_ERROR "Could not find CUDA. Please set CUDA_PATH appropriately and try again.")
endif()