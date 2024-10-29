cmake_minimum_required(VERSION 3.12)
project(rcif VERSION 1.4.0)

find_package(daq-cmake REQUIRED)
find_package(cmdlib REQUIRED)
find_package(opmonlib REQUIRED)

daq_setup_environment()

daq_codegen( cmd.jsonnet DEP_PKGS cmdlib TEMPLATES Structs.hpp.j2 Nljs.hpp.j2 )
daq_protobuf_codegen( opmon/*.proto  )

daq_add_library( LINK_LIBRARIES opmonlib::opmonlib )

##############################################################################
##############################################################################

daq_install()
