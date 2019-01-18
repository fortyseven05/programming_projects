with statements; use statements;
with ids; use ids;

package body programs is

   function make (func_name: in id; bk: in block) return program is
      prog: program;

   begin

      prog.bk := bk;
      prog.func_name := func_name;

      return prog;
   end make;

   procedure execute (this: in program) is
   begin
      execute(this.bk);
   end execute;

end programs;
