/*
 * This file is 100% generated.  Any manual edits will likely be lost.
 *
 * This contains functions struct and other type definitions for shema in 
 * namespace dunedaq::rcif::cmd to be serialized via nlohmann::json.
 */
#ifndef DUNEDAQ_RCIF_CMD_NLJS_HPP
#define DUNEDAQ_RCIF_CMD_NLJS_HPP

// My structs
#include "rcif/cmd/Structs.hpp"

// Nljs for externally referenced schema
#include "cmdlib/cmd/Nljs.hpp"

#include <nlohmann/json.hpp>

namespace dunedaq::rcif::cmd {

    using data_t = nlohmann::json;
    
    inline void to_json(data_t& j, const ChangeRateParams& obj) {
        j["trigger_rate"] = obj.trigger_rate;
    }
    
    inline void from_json(const data_t& j, ChangeRateParams& obj) {
        if (j.contains("trigger_rate"))
            j.at("trigger_rate").get_to(obj.trigger_rate);    
    }
    
    inline void to_json(data_t& j, const DisableParams& obj) {
        j["resource_name"] = obj.resource_name;
    }
    
    inline void from_json(const data_t& j, DisableParams& obj) {
        if (j.contains("resource_name"))
            j.at("resource_name").get_to(obj.resource_name);    
    }
    
    inline void to_json(data_t& j, const EnableParams& obj) {
        j["resource_name"] = obj.resource_name;
    }
    
    inline void from_json(const data_t& j, EnableParams& obj) {
        if (j.contains("resource_name"))
            j.at("resource_name").get_to(obj.resource_name);    
    }
    
    inline void to_json(data_t& j, const RCCommand& obj) {
        j["id"] = obj.id;
        j["entry_state"] = obj.entry_state;
        j["exit_state"] = obj.exit_state;
        j["data"] = obj.data;
    }
    
    inline void from_json(const data_t& j, RCCommand& obj) {
        if (j.contains("id"))
            j.at("id").get_to(obj.id);    
        if (j.contains("entry_state"))
            j.at("entry_state").get_to(obj.entry_state);    
        if (j.contains("exit_state"))
            j.at("exit_state").get_to(obj.exit_state);    
        if (j.contains("data"))
            j.at("data").get_to(obj.data);    
    }
    
    inline void to_json(data_t& j, const StartParams& obj) {
        j["run"] = obj.run;
        j["disable_data_storage"] = obj.disable_data_storage;
        j["trigger_rate"] = obj.trigger_rate;
        j["production_vs_test"] = obj.production_vs_test;
    }
    
    inline void from_json(const data_t& j, StartParams& obj) {
        if (j.contains("run"))
            j.at("run").get_to(obj.run);    
        if (j.contains("disable_data_storage"))
            j.at("disable_data_storage").get_to(obj.disable_data_storage);    
        if (j.contains("trigger_rate"))
            j.at("trigger_rate").get_to(obj.trigger_rate);    
        if (j.contains("production_vs_test"))
            j.at("production_vs_test").get_to(obj.production_vs_test);    
    }
    
} // namespace dunedaq::rcif::cmd

#endif // DUNEDAQ_RCIF_CMD_NLJS_HPP