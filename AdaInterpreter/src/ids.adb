with tokens; use tokens;

package body ids is

   function make (s: in string) return id is
      i: id;
      lex: lexeme;
   begin
      lex:= make(s);
      i.l := lex;
      return i;
   end make;

   function get_lexeme (this: in id) return lexeme is
   begin
      return this.l;
   end get_lexeme;


end ids;
