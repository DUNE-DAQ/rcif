// This is the "command" schema ("cmd") used by rc applications.
//
// It governs the expected top-level structure of command objects.
//
// Its objects hold substructure as an "any" type which is expected to
// be interpreted by the next lower layer such as described in the
// appfwk "application" schema ("app").

local moo = import "moo.jsonnet";
local s = moo.oschema.schema("dunedaq.rcif.cmd");
local s_cmd = import "cmdlib/cmd.jsonnet";
local cmd = moo.oschema.hier(s_cmd).dunedaq.cmdlib.cmd;

// A temporary schema construction context.
local cs = {

    // fixme: specify a pattern that itself matches any regex?
   state: s.string("State", doc="String for the state name"),

   rccmd: s.record("RCCommand", [
        s.field("id", cmd.CmdId,
                doc="Identify the type of command"),
        s.field("entry_state", self.state, "ANY",
                doc="State at which the command is issued"),
        s.field("exit_state", self.state, "ANY",
                doc="State after the successful exectution of the command"),
        s.field("data", cmd.Data, optional=true,
                doc="Command data object with type-specific structure"),
    ], doc="Top-level run control command object structure"),

    run_number: s.number("RunNumber", dtype="u8",
                       doc="Run Number"),
    disable_storage: s.boolean("StorageDisabled",
                       doc="Boolean flag to disable storage"),
    trg_rate: s.number("TrgRate", dtype="f8",
                       doc="Trigger rate in Hz"),
    app: s.string("AppId", doc="The name (unique ID) of an app"),

    start_params: s.record("StartParams", [
        s.field("run", self.run_number, doc="Run Number"),
        s.field("disable_data_storage", self.disable_storage, 0, doc="Bool to disable storage. True = storage disabled"),
        s.field("trigger_rate", self.trg_rate, doc="Generated fake trigger rate Hz.", optional=true),
        s.field("production_vs_test", self.state, "TEST", doc="Indicator of Production vs. Test running.")
    ]),

    change_rate_params: s.record("ChangeRateParams", [
        s.field("trigger_rate", self.trg_rate, 1, doc="Trigger rate in Hz"),
    ]),
  
    disable_params: s.record("DisableParams", [
      s.field("resource_name", self.app, doc="Which resource was deactivated"),
    ]),
  
    enable_params: s.record("EnableParams", [
      s.field("resource_name", self.app, doc="Which resource was reactivated"),
    ]),


};

// Output a topologically sorted array.
s_cmd + moo.oschema.sort_select(cs)
