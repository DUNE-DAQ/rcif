/*
 * This file is 100% generated.  Any manual edits will likely be lost.
 *
 * This contains struct and other type definitions for shema in 
 * namespace dunedaq::rcif::cmd.
 */
#ifndef DUNEDAQ_RCIF_CMD_STRUCTS_HPP
#define DUNEDAQ_RCIF_CMD_STRUCTS_HPP

#include <cstdint>
#include "cmdlib/cmd/Structs.hpp"

#include <string>

namespace dunedaq::rcif::cmd {

    // @brief The name (unique ID) of an app
    using AppId = std::string;

    // @brief Trigger rate in Hz
    using TrgRate = double;


    // @brief 
    struct ChangeRateParams 
    {

        // @brief Trigger rate in Hz
        TrgRate trigger_rate = 1.0;
    };

    // @brief 
    struct DisableParams 
    {

        // @brief Which resource was deactivated
        AppId resource_name = "";
    };

    // @brief 
    struct EnableParams 
    {

        // @brief Which resource was reactivated
        AppId resource_name = "";
    };

    // @brief String for the state name
    using State = std::string;

    // @brief Top-level run control command object structure
    struct RCCommand 
    {

        // @brief Identify the type of command
        cmdlib::cmd::CmdId id = "";

        // @brief State at which the command is issued
        State entry_state = "ANY";

        // @brief State after the successful exectution of the command
        State exit_state = "ANY";

        // @brief Command data object with type-specific structure
        cmdlib::cmd::Data data = {};
    };

    // @brief Run Number
    using RunNumber = uint64_t; // NOLINT


    // @brief Boolean flag to disable storage
    using StorageDisabled = bool;

    // @brief 
    struct StartParams 
    {

        // @brief Run Number
        RunNumber run = 0;

        // @brief Bool to disable storage. True = storage disabled
        StorageDisabled disable_data_storage = false;

        // @brief Generated fake trigger rate Hz.
        TrgRate trigger_rate = 0.0;

        // @brief Indicator of Production vs. Test running.
        State production_vs_test = "TEST";
    };

} // namespace dunedaq::rcif::cmd

#endif // DUNEDAQ_RCIF_CMD_STRUCTS_HPP