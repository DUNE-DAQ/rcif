cmake_minimum_required(VERSION 3.12)
project(rcif VERSION 1.1.1)

find_package(daq-cmake REQUIRED)
find_package(cmdlib REQUIRED)
find_package(opmonlib REQUIRED)

daq_setup_environment()

daq_codegen( cmd.jsonnet DEP_PKGS cmdlib TEMPLATES Structs.hpp.j2 Nljs.hpp.j2 )
daq_codegen( runinfo.jsonnet DEP_PKGS opmonlib TEMPLATES opmonlib/InfoStructs.hpp.j2 opmonlib/InfoNljs.hpp.j2)

daq_add_library()

##############################################################################
##############################################################################

daq_install()
