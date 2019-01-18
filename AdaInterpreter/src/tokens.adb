with ada.Text_IO; use ada.Text_IO;

package body tokens is


   function is_valid_id (l: in lexeme) return boolean is
      test: Character;
   begin
      test := Character'Value(l.str);
      return true;
   exception
      when others =>
         return false;
   end is_valid_id;

   function make (tt: in token_type; l: in lexeme; row_num, col_num: in positive)
                  return token is
      tok: token;
   begin
      tok.row_num := row_num;
      tok.col_num := col_num;
      tok.l := l;
      tok.tt := tt;
      return tok;
   end make;

   function get_token_type (tok: in token) return token_type is
   begin
      return tok.tt;
   end get_token_type;

   function get_lexeme (tok: in token) return lexeme is
   begin
      return tok.l;
   end get_lexeme;

   function get_row_num (tok: in token) return positive is
   begin
      return tok.row_num;
   end get_row_num;

   function get_col_num (tok: in token) return positive is
   begin
      return tok.col_num;
   end get_col_num;

   function lexeme_length (l: in lexeme) return positive is
   begin
      return l.str'Length;
   end lexeme_length;

   function to_string (l: in lexeme) return string is
      --str : string (1 .. l.size) := l.str;
   begin
      --str := l.str;
      return l.str;
   end to_string;

   function "=" (l: in lexeme; s: in string) return boolean is
   begin
      if s = l.str then
         return true;
      else
         return false;
      end if;

   end "=";

   function make (s: in string) return lexeme is
      lex: lexeme;
   begin
      lex.str (1 .. s'Length) := s;
      lex.size := s'Length;
      return lex;
   end make;



end tokens;
