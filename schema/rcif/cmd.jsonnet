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

   rccommand: s.record("RCCommand", [
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
    trg_interval: s.number("TrgInterval", dtype="i8",
                       doc="Time ticks interval between fake triggers"),


    start_params: s.record("StartParams", [
        s.field("run", self.run_number, doc="Run Number"),
        s.field("disable_data_storage", self.disable_storage, 0, doc="Bool to disable storage. True = storage disabled"),
        s.field("trigger_interval_ticks", self.trg_interval, 64000000, doc="Generated fake trigger rate in clock ticks.")
    ]),

    resume_params: s.record("ResumeParams", [
        s.field("trigger_interval_ticks", self.trg_interval, 64000000,
                doc="Interval between triggers in 16 ns time ticks (default 1.024 s)"),
    ]),

    # empty_params: s.record("EmptyParams", [
    # ])


};

// Output a topologically sorted array.
s_cmd + moo.oschema.sort_select(cs)
