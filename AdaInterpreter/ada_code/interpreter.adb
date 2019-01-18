with parsers; use parsers;
with programs; use programs;
with ada.exceptions; use ada.exceptions;
with Ada.Text_IO; use Ada.Text_IO;
with lexical_analyzers; use lexical_analyzers;
with tokens; use tokens;

procedure Interpreter is

   p: parser := make ("test4.jl");
   prog: program;
begin
   parse (p, prog);
   execute (prog);
exception
   when e: parse_exception =>
      put_line (exception_message (e));
   when e: lexical_exception =>
      put_line (exception_message(e));
   when e: invalid_identifier =>
      put_line (exception_message (e));
   when others =>
      put_line ("unknown error occurred: terminating");
end Interpreter;
