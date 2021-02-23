cmake_minimum_required(VERSION 3.12)
project(rcif VERSION 1.0.0)

find_package(daq-cmake REQUIRED)
find_package(cmdlib REQUIRED)

daq_setup_environment()

set(RCIF_DEPENDENCIES)

daq_codegen_schema(*.jsonnet MPATH_PKGS cmdlib TEMPL Structs.hpp Nljs.hpp )

##############################################################################
##############################################################################

daq_install()
