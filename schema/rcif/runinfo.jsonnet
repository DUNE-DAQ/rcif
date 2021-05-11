// This is the run info schema used.
// It describes the run information object structure 
// for operational monitoring

local moo = import "moo.jsonnet";
local s = moo.oschema.schema("dunedaq.rcif.runinfo");

local info = {
   cl : s.string("class_s", moo.re.ident,
                  doc="A string field"), 
   running : s.boolean("running_v",
                  doc="running flag"), 
   runno : s.number("runno_v", dtype="u8",
                       doc="Run Number"),
   runtime: s.number("runtime_v", dtype="u4",
                       doc="Run time in seconds"),

   info: s.record("Info", [
       s.field("class_name", self.cl, "runinfo", doc="Run Info class name"),
       s.field("running", self.running, 0, doc="Running flag"), 
       s.field("runno", self.runno, 0,  doc="Run number"), 
       s.field("error", self.runtime, 0, doc="Run time in seconds")
   ], doc="Run information")
};

moo.oschema.sort_select(info) 
