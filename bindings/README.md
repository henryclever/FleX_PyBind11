The python bindings included have been tested with the following machine:

* Nvidia GT-640 GPU
* Ubuntu 16.04, 64 bit
* Intel Core I7
* FleX 1.2.0
* CUDA 9.2.148 toolkit
* Nvidia driver version 396.54


To Use the Python Bindings
-----------------

1. First, build the demo and extensions to make sure it runs without the bindings.
    * cd ${DIR}/FleX_PyBind11/demo/compiler/makelinux64
    * mkdir build
    * make -j4
    * cd ${DIR}/FleX_PyBind11/extensions/compiler/makelinux64
    * mkdir build
    * make -j4

2. Build the bindings with pip.
    * cd ${DIR}/FleX_PyBind11
    * sudo pip install ./bindings

3. Run the example python script to start the simulation.
    * cd ${DIR}/FleX_PyBind11/bindings/py_files
    * python pyflex.py

4. Add more bindings in ${DIR}/FleX/bindings/src/pythonBindings.cpp to suit your needs!

Notes: 
------------------

Here is a list of the differences between this code repo and the FleX 1.2.0 package:
- The ${DIR}/FleX_PyBind11/bindings folder is new. It includes many links to FleX and CUDA libraries that pybind11 uses.
- ${DIR}/FleX_PyBind11/demo/main.cpp is not used with python. The edited version of main.cpp that python uses is main_python.cpp. The main loop to update the particles is now run in a python loop.
- The library file ${DIR}/FleX_PyBind11/external/SDL2-2.0.4/lib/x64/libSDL2.a has been replaced due to an issue in the following thread: https://github.com/NVIDIAGameWorks/FleX/issues/62

 
