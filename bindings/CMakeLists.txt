cmake_minimum_required(VERSION 2.8.12)
project(bindings)


if (NOT DEFINED FleX_ROOT)
    set(FleX_ROOT ~/git/FleX_PyBind11)
endif()
if (NOT DEFINED CUDA_ROOT)
    set(CUDA_ROOT /usr/local/cuda-9.2)
endif()


######################################### Find Dependencies ############################################
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
find_package(OpenGL REQUIRED)
find_package(Eigen REQUIRED)
find_package(FleX REQUIRED)
find_package(CUDA REQUIRED)

set(FleX_DEPENDENCIES
    ${FleX_LIBRARIES}
    ${CUDA_LIBRARIES}
    rt
    )

include_directories(${Eigen_INCLUDE_DIRS})
include_directories(${FleX_INCLUDE_DIR})

link_directories("${CMAKE_BINARY_DIR}/lib")
link_directories("${CMAKE_INSTALL_PREFIX}/lib")
link_directories(${FleX_LIB_DIR})


######################################### Link via Pybind ############################################
add_subdirectory(pybind11)
pybind11_add_module(bindings src/pythonBindings.cpp ${FleX_INCLUDE_SOURCE} ${FleX_INCLUDE_HEADER})
target_compile_options(bindings PRIVATE -I/usr/local/include/python2.7)
target_include_directories(bindings PRIVATE "${PYTHON_INCLUDE_DIRS}" -fPIC)
target_link_libraries(bindings PRIVATE ${FleX_DEPENDENCIES} -fPIC)

