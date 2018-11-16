FleX Bindings for Python
===================
Currently, the bindings here are just used to run the FleX demo. I have only uploaded the boilerplate code that lets you initialize the simulator with a single wrapper, update the frame, and send and receive variables in python. For example, there is a function that grabs particle positions. The python binding `bindings.grab_x_pos_particle(i)` allows you to grab the x position of any particle in the scene. An example for sending variables to C++ is that you can add variables to the `void initialize()` function in `bindings/main_python.cpp` and pass directly from python.

The bulk of my work on these bindings was to link the libraries from FleX and CUDA to pybind11 in CMake files and integrate a setup.py file that lets you easily install the bindings with pip. It took me a while; hopefully it will save you time for creating more bindings as you need. I may or may not create a more general purpose set of bindings. See the README.md in the subfolder 'bindings' for more details.


NVIDIA Flex - 1.2.0
===================

Flex is a particle-based simulation library designed for real-time applications.
Please see the programmer's manual included in this release package for more information on
the solver API and usage.

Supported Platforms
-------------------

* Windows 32/64 bit (CUDA, DX11, DX12)
* Linux 64 bit (CUDA, tested with Ubuntu 16.04 LTS and Mint 17.2 Rafaela)

Requirements
------------

A D3D11 capable graphics card with the following driver versions:

* NVIDIA GeForce Game Ready Driver 396.45 or above
* AMD Radeon Software Version 16.9.1 or above
* Intel® Graphics Version 15.33.43.4425 or above

To build the demo at least one of the following is required:

* Microsoft Visual Studio 2013
* Microsoft Visual Studio 2015
* g++ 4.6.3 or higher

And either: 

* CUDA 9.2.148 toolkit
* DirectX 11/12 SDK

Demo 
====

Use the `run_cuda.bat` or `run_d3d.bat` files to launch the demo.

Notes 
-----

* Some scenes also have fluid emitters that can be started using 'space'
* For running the Linux binaries you will need to export the path to where the CUDA run time libraries are
  For example, you may add to your .bashrc file the following:
       
      export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64


Command Line Options
--------------------

The following commands may be passed to the demo application to modify behavior:

    -fullscreen=wxh  Start fullscreen e.g.: -fullscreen=1280x720
    -msaa=0          Disable multisampling (default is on)
    -device=n        Choose GPU to run on
    -d3d12           Enable D3D12 compute
    -benchmark       Enable bencmark mode, will write a benchmark.txt to the root folder
    -vsync=0         Disable vsync

Controls
--------

    w,s,a,d - Fly Camera
    right mouse - Mouse look
    shift + left mouse - Particle select and drag

    p - Pause/Unpause
    o - Step
    h - Hide/Show onscreen help
    
    left/right arrow keys - Move to prev/next scene
    up/down arrow keys - Select next scene
    enter - Launch selected scene
    r - Reset current scene
    
    e - Draw fluid surface
    v - Draw points
    f - Draw springs
    i - Draw diffuse
    m - Draw meshes
    
    space - Toggle fluid emitter
    y - Toggle wave pool
    c - Toggle video capture
    u - Toggle fullscreen
    j - Wind gust
    - - Remove a plane
    esc - Quit

Known Issues
============

* Crash with inflatable scenes on Intel HD Graphics 530
* MSAA is broken on D3D12 and currently disabled

Acknowledgements
================

* SDL is licensed under the zlib license
* GLEW is licensed under the Modified BSD license
* Regal is licensed under the BSD license
* stb_truetype by Sean Barrett is public domain
* imgui by Mikko Mononen is licensed under the ZLib license

