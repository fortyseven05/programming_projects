private with Ada.Containers.Doubly_Linked_Lists;
with Ada.Text_IO, Ada.Characters.Handling, Ada.Assertions; use Ada.Text_IO, Ada.Characters.Handling, Ada.Assertions;
with tokens; use tokens;



package body lexical_analyzers is

   function make (file_name: in string) return lexical_analyzer is
      lex_an: lexical_analyzer;
      leme: lexeme;
      tt : token_type;
      input : File_Type;
      line_num: Positive := 1;


      function is_numeric (str: in string) return Boolean is
         result : Boolean := true;
      begin
         declare
            int : Integer;
         begin
            int := Integer'Value(str);
         exception
            when others =>
               result := false;
         end;
         return result;
      end is_numeric;

      procedure skip_white_space (line: in string; col_num: in out Positive) is
      begin
         while col_num <= line'Length and then Is_Space(line(col_num)) loop
            col_num := col_num + 1;
         end loop;
      end skip_white_space;

      function get_lexeme (line: in string; col_num: in out Positive) return lexeme is
         start : Positive := col_num;
      begin
         while col_num < line'Length and then Is_Space(line(col_num)) loop
            col_num := col_num + 1;
         end loop;

         leme := make(line(start .. col_num));
         return leme;
      end get_lexeme;

      function get_token_type (leme: in lexeme; line_num, col_num: in Positive) return token_type is
         lex_str : string := to_string(leme);
      begin
         if Is_Basic(lex_str(1)) then
            if lex_str'Length = 1 then
               if is_valid_id(leme) then
                  tt := token_type'Value("ID_TOK");
               else
                  Put_Line ("Invalid ID: " & lex_str);
               end if;
            elsif lex_str'Length > 1 then
               if lex_str = "for" then
                  tt := token_type'Value("FOR_TOK");
               elsif lex_str = "function" then
                  tt := token_type'Value("FUNCTION_TOK");
               elsif lex_str = "print"then
                  tt := token_type'Value("PRINT_TOK");
               elsif lex_str = "end" then
                  tt := token_type'Value("END_TOK");
               elsif lex_str = "if" then
                  tt := token_type'Value("IF_TOK");
               elsif lex_str = "else" then
                  tt := token_type'Value("ELSE_TOK");
               elsif lex_str = "while"then
                  tt := token_type'Value("WHILE_TOK");
               else
                  Put_Line ("Invalid token at row " & line_num'Image & " and column " & col_num'Image);
               end if;
            else
               Put_Line ("Invalid token at row " & line_num'Image & " and column " & col_num'Image);
            end if;
         elsif Is_Digit(lex_str(1)) then
            if is_numeric(lex_str) then
               tt := token_type'Value("LITERAL_INTEGER_TOK");
            else
               Put_Line ("Invalid token at row " & line_num'Image & " and column " & col_num'Image);
            end if;
         elsif lex_str = "+" then
            tt := token_type'Value("ADD_TOK");
         elsif lex_str = "*" then
            tt := token_type'Value("MUL_TOK");
         elsif lex_str = "=" then
            tt := token_type'Value("ASSIGN_TOK");
         elsif lex_str = "-" then
            tt := token_type'Value("SUB_TOK");
         elsif lex_str = "^" then
            tt := token_type'Value("EXP_TOK");
         elsif lex_str = "/" then
            tt := token_type'Value("DIV_TOK");
         elsif lex_str = "\\" then
            tt := token_type'Value("REV_DIV_TOK");
         elsif lex_str = "%" then
            tt := token_type'Value("MOD_TOK");
         elsif lex_str = "(" then
            tt := token_type'Value("LEFT_PAREN_TOK");
         elsif lex_str = ")" then
            tt := token_type'Value("RIGHT_PAREN_TOK");
         elsif lex_str = ":" then
            tt := token_type'Value("ITER_TOK");
         elsif lex_str = "==" then
            tt := token_type'Value("EQ_TOK");
         elsif lex_str = "!=" then
            tt := token_type'Value("NE_TOK");
         elsif lex_str = "<" then
            tt := token_type'Value("LT_TOK");
         elsif lex_str = ">" then
            tt := token_type'Value("GT_TOK");
         elsif lex_str = ">=" then
            tt := token_type'Value("GE_TOK");
         elsif lex_str = "<=" then
            tt := token_type'Value("LE_TOK");
         else
            Put_Line ("Invalid token at row " & line_num'Image & " and column " & col_num'Image);
         end if;
         return tt;
      end get_token_type;



      procedure process_line (line: in string; line_num: in Integer) is
         col_num : Positive := 1;
      begin
         skip_white_space(line, col_num);
         while col_num <= line'Length loop
            leme := get_lexeme(line, col_num);
            tt := get_token_type(leme, line_num, col_num);
            lex_an.token_list.Append(make(tt, leme, line_num, col_num));
         end loop;
      end process_line;



   begin
      lex_an.current := token_lists.First(lex_an.token_list);
      begin
         Open (File => input,
               Mode => In_File,
               Name => "./test.txt"); --file_name);
      exception
         when others =>
            Put_Line("Input file not found: " & file_name);
      end;

      while not End_Of_File(input) loop
         declare
            line : string := Get_Line(input);
         begin
            process_line(line, line_num);
            line_num := line_num + 1;
         end;
         Close (input);
      end loop;

      lex_an.token_list.Append( make(token_type'Value("EOS_TOK"), make("EOS"), line_num, 1));
      return lex_an;
   end make;

   procedure get_next_token (this: in out lexical_analyzer; tok: out token) is
   begin
      Assert(true, "get_next_token");
      tok := token_lists.Element(this.current);
      token_lists.Next(this.current);
   end get_next_token;

   function get_lookahead_token (this: in lexical_analyzer) return token is
      tok : token;
   begin
      Assert(true, "get_lookahead_token");
      tok := token_lists.Element(this.current);
      return tok;
   end get_lookahead_token;

   function has_more_tokens (this: in lexical_analyzer) return boolean is
      bool: Boolean := true;
   begin

      return bool;
   end has_more_tokens;

end lexical_analyzers;
