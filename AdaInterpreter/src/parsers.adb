with lexical_analyzers; use lexical_analyzers;
with programs; use programs;
with tokens; use tokens;
with ids; use ids;
with iters; use iters;
with statements; use statements;
with arithmetic_expressions; use arithmetic_expressions;
with boolean_expressions; use boolean_expressions;
with Ada.Text_IO; use Ada.Text_IO;

package body parsers is

   ----------
   -- make --
   ----------

   function make_parser (file_name: in string) return parser is
      lex : lexical_analyzer;
      p : parser;
   begin
      p.lex := make (file_name);
      return p;

   end make_parser;

   -----------
   -- parse --
   -----------

   procedure parse (this: in out parser; prog: out program) is
      tok: token;
      id_var: id;
      bk : block;


      procedure match(tok: in token; tt: in token_type) is
      begin
         if get_token_type(tok)'Image = tt'Image then
            return;
         else
            raise parse_exception;
         end if;
      end match;


      function get_constant return arithmetic_expression_access is
         var: Integer;
      begin
         get_next_token(this.lex, tok);
         match(tok, token_type'Value("LITERAL_INTEGER_TOK"));
         var := Integer'Value(to_string(get_lexeme(tok)));
         return make(var);
      end get_constant;


      function get_id return id is
      begin
         get_next_token(this.lex, tok);
         match(tok, token_type'Value("ID_TOK"));
         return make(to_string(get_lexeme(tok)));
      end get_id;


      function get_arith_exp return arithmetic_expression_access is
         expr: arithmetic_expression_access;
         tt: token_type;
         expr1, expr2 : arithmetic_expression_access;


         function get_binary_exp return arithmetic_expression_access is
            oper : arithmetic_operator;
         begin
            get_next_token(this.lex, tok);
            tt := get_token_type(tok);
            if tt = token_type'Value("ADD_TOK") then
               match(tok, token_type'Value("ADD_TOK"));
               oper := arithmetic_operator'Value("ADD_OP");
            elsif tt = token_type'Value("MUL_TOK") then
               match(tok, token_type'Value("MUL_TOK"));
               oper := arithmetic_operator'Value("MUL_OP");
            elsif tt = token_type'Value("SUB_TOK") then
               match(tok, token_type'Value("SUB_TOK"));
               oper := arithmetic_operator'Value("SUB_OP");
            elsif tt = token_type'Value("DIV_TOK") then
               match(tok, token_type'Value("DIV_TOK"));
               oper := arithmetic_operator'Value("DIV_OP");
            elsif tt = token_type'Value("MOD_TOK") then
               match(tok, token_type'Value("MOD_TOK"));
               oper := arithmetic_operator'Value("MOD_OP");
            elsif tt = token_type'Value("REV_DIV_TOK") then
               match(tok, token_type'Value("REV_DIV_TOK"));
               oper := arithmetic_operator'Value("REV_DIV_OP");
            elsif tt = token_type'Value("EXP_TOK") then
               match(tok, token_type'Value("EXP_TOK"));
               oper := arithmetic_operator'Value("EXP_OP");
            else
               raise parse_exception;
            end if;
            expr1 := get_arith_exp;
            expr2 := get_arith_exp;
            return make(oper, expr1, expr2);
         end get_binary_exp;


      begin
         tok := get_lookahead_token(this.lex);
         tt := get_token_type(tok);
         if tt = token_type'Value("ADD_TOK") or tt = token_type'Value("MUL_TOK") or
           tt = token_type'Value("SUB_TOK") or tt = token_type'Value("DIV_TOK") or
           tt = token_type'Value("MOD_TOK") or tt = token_type'Value("EXP_TOK") or
           tt = token_type'Value("REV_DIV_TOK") then
            expr := get_binary_exp;
         elsif
           tt = token_type'Value("ID_TOK") then
            expr := make(get_id);
         else
            if tt = token_type'Value("LITERAL_INTEGER_TOK") then
               expr := get_constant;
            else
               raise parse_exception;
            end if;
         end if;
         return expr;
      end get_arith_exp;






      function get_boolean_exp return boolean_expression is
         expr1, expr2 : arithmetic_expression_access;
         tt: token_type;
         rel_op : relational_operator;
      begin
         get_next_token(this.lex, tok);
         tt := get_token_type(tok);
         if tt = token_type'Value("EQ_TOK") then
            match(tok, token_type'Value("EQ_TOK"));
            rel_op := relational_operator'Value("EQ_TOK");
         elsif
           tt = token_type'Value("NE_TOK") then
            match(tok, token_type'Value("NE_TOK"));
            rel_op := relational_operator'Value("NE_TOK");
         elsif
           tt = token_type'Value("LT_TOK") then
            match(tok, token_type'Value("LT_TOK"));
            rel_op := relational_operator'Value("LT_TOK");
         elsif
           tt = token_type'Value("GT_TOK") then
            match(tok, token_type'Value("GT_TOK"));
            rel_op := relational_operator'Value("GT_TOK");
         elsif
           tt = token_type'Value("LE_TOK") then
            match(tok, token_type'Value("LE_TOK"));
            rel_op := relational_operator'Value("LE_TOK");
         elsif
           tt = token_type'Value("GE_TOK") then
            match(tok, token_type'Value("GE_TOK"));
            rel_op := relational_operator'Value("GE_TOK");
         else
            raise parse_exception;
         end if;
         expr1 := get_arith_exp;
         expr2 := get_arith_exp;
         return make(rel_op, expr1, expr2);
      end get_boolean_exp;


      function get_block return block is
         bk: block;
         stmt: statement_access;

         function get_statement return statement_access is
            stmt: statement_access;
            tt: token_type;


            function get_print_stmt return statement_access is
               exp : arithmetic_expression_access;
            begin
               get_next_token(this.lex, tok);
               match(tok, token_type'Value("PRINT_TOK"));
               get_next_token(this.lex, tok);
               match(tok, token_type'Value("LEFT_PAREN_TOK"));
               exp := get_arith_exp;
               get_next_token(this.lex, tok);
               match(tok, token_type'Value("RIGHT_PAREN_TOK"));
               return make(exp);
            end get_print_stmt;

            function get_if_stmt return statement_access is
               bool : boolean_expression;
               bk1, bk2 : block;
            begin
               get_next_token(this.lex, tok);
               match(tok, token_type'Value("IF_TOK"));
               bool := get_boolean_exp;
               bk1 := get_block;
               get_next_token(this.lex, tok);
               match(tok, token_type'Value("ELSE_TOK"));
               bk2 := get_block;
               get_next_token(this.lex, tok);
               match(tok, token_type'Value("END_TOK"));
               return make(bool, bk1, bk2);
            end get_if_stmt;



            function get_while_stmt return statement_access is
               bool : boolean_expression;
               bk : block;
            begin
               get_next_token(this.lex, tok);
               match(tok, token_type'Value("WHILE_TOK"));
               bool := get_boolean_exp;
               bk := get_block;
               get_next_token(this.lex, tok);
               match(tok, token_type'Value("END_TOK"));
               return make(bool, bk);
            end get_while_stmt;


            function get_iter return iter is
               expr1, expr2 : arithmetic_expression_access;
            begin
               expr1 := get_arith_exp;
               get_next_token(this.lex, tok);
               match(tok, token_type'Value("ITER_TOK"));
               expr2 := get_arith_exp;
               return make(expr1, expr2);
            end get_iter;



            function get_for_stmt return statement_access is
               id_var : id;
               it : iter;
               bk : block;
            begin
               get_next_token(this.lex, tok);
               match(tok, token_type'Value("FOR_TOK"));
               id_var := get_id;
               get_next_token(this.lex, tok);
               match(tok, token_type'Value("ASSIGN_TOK"));
               it := get_iter;
               bk := get_block;
               get_next_token(this.lex, tok);
               match(tok, token_type'Value("END_TOK"));
               return make(id_var, it, bk);
            end get_for_stmt;


            function get_assnmnt_stmt return statement_access is
               id_var : id;
               expr : arithmetic_expression_access;
            begin
               id_var := get_id;
               get_next_token(this.lex, tok);
               match(tok, token_type'Value("ASSIGN_TOK"));
               expr := get_arith_exp;
               return make(id_var, expr);
            end get_assnmnt_stmt;




         begin
            tt := get_token_type(tok);
            if tt = token_type'Value("PRINT_TOK") then
               stmt := get_print_stmt;
            elsif tt = token_type'Value("IF_TOK") then
               stmt := get_if_stmt;
            elsif tt = token_type'Value("WHILE_TOK") then
               stmt := get_while_stmt;
            elsif tt = token_type'Value("FOR_TOK") then
               stmt := get_for_stmt;
            elsif tt = token_type'Value("ID_TOK") then
               stmt := get_assnmnt_stmt;
            else
               raise parse_exception;
            end if;
            return stmt;
         end get_statement;




      begin
         tok := get_lookahead_token(this.lex);
         while get_token_type(tok) = token_type'Value("FOR_TOK") or else get_token_type(tok) = token_type'Value("WHILE_TOK") or else
           get_token_type(tok) = token_type'Value("IF_TOK") or else get_token_type(tok) = token_type'Value("PRINT_TOK") or else
           get_token_type(tok) = token_type'Value("ID_TOK") loop
            stmt := get_statement;
            add_statement(bk, stmt);
            tok := get_lookahead_token(this.lex);
         end loop;
         return bk;
      end get_block;





   begin
      get_next_token(this.lex, tok);
      match(tok, token_type'Value("FUNCTION_TOK"));
      id_var := get_id;
      get_next_token(this.lex, tok);
      match(tok, token_type'Value("LEFT_PAREN_TOK"));
      get_next_token(this.lex, tok);
      match(tok, token_type'Value("RIGHT_PAREN_TOK"));
      bk := get_block;
      get_next_token(this.lex, tok);
      match(tok, token_type'Value("END_TOK"));
      get_next_token(this.lex, tok);
      match(tok, token_type'Value("EOS_TOK"));
      prog := make(id_var, bk);

   end parse;

end parsers;
