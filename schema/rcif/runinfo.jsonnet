// This is the run info schema used.
// It describes the run information object structure 
// for operational monitoring

local moo = import "moo.jsonnet";
local s = moo.oschema.schema("dunedaq.rcif.runinfo");

local info = {

   running : s.boolean("running_t",
                  doc="running flag"), 
   runno : s.number("runno_t", dtype="u8",
                       doc="Run Number"),
   runtime: s.number("runtime_t", dtype="u4",
                       doc="Run time in seconds"),

   info: s.record("Info", [
       s.field("running", self.running, 0, doc="Running flag"), 
       s.field("runno", self.runno, 0,  doc="Run number"), 
       s.field("runtime", self.runtime, 0, doc="Run time in seconds")
   ], doc="Run information")
};

moo.oschema.sort_select(info) 
