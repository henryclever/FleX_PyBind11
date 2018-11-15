//Written by Henry M. Clever. November 15, 2018.


#include <pybind11/pybind11.h>
#include <pybind11/eigen.h>
#include <pybind11/functional.h>
#include <pybind11/numpy.h>
#include <pybind11/operators.h>
#include <pybind11/pytypes.h>
#include <pybind11/stl.h>

#include "demo/main_python.cpp" //we can do this because of the FleX_INCLUDE_DIR in FindFleX.cmake
#include <stdio.h>

int add(int i, int j) {
    return 100;//deadzones[1];
}



namespace py = pybind11;


py::array_t<double> make_array() {
    // No pointer is passed, so NumPy will allocate the buffer
    printf("a;lsfjl;\n");
    auto myarray = py::array_t<double>(10);

    return myarray;
}




PYBIND11_MODULE(bindings, m) {
    m.doc() = "pybind11 passing plugin";


    m.def("update_frame", &UpdateFrame, "void update frame");
    m.def("sdl_main", &SDLMain, py::return_value_policy::automatic);
    m.def("initialize", &initialize, "float init");
    m.def("destroy_scene", &destroy_scene, py::return_value_policy::automatic);



    m.def("RandInit", &RandInit, "RandInit");
    m.def("add", &add, "Add two numbers");
    m.def("grab_z_pos_particle", &grab_z_pos_particle,  py::return_value_policy::automatic);
    m.def("grab_y_pos_particle", &grab_y_pos_particle,  py::return_value_policy::automatic);
    m.def("grab_x_pos_particle", &grab_x_pos_particle,  py::return_value_policy::automatic);
    m.def("make_array", &make_array,  py::return_value_policy::move); // Return policy can be left default, i.e. return_value_policy::automatic


    m.def("subtract", [](int i, int j) { return i - j; }, "Subtract two numbers");

#ifdef VERSION_INFO
    m.attr("__version__") = VERSION_INFO;
#else
    m.attr("__version__") = "dev";
#endif
}


