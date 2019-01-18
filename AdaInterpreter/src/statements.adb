with ids; use ids;
with arithmetic_expressions; use arithmetic_expressions;
with boolean_expressions; use boolean_expressions;
with iters; use iters;
with memory; use memory;
with Ada.Text_IO; use Ada.Text_IO;

package body statements is

   procedure execute (this: in statement) is
   begin
      case this.s_type is
         when ASSN_STMT =>
            memory.store(get_lexeme(this.var), evaluate(this.r_value.all));
         when IF_STMT =>
            if evaluate(this.if_expr) then
               execute(this.if_block);
            else
               execute(this.else_block);
            end if;

         when FOR_STMT =>
            for I in evaluate(get_start_expr(this.loop_control).all) .. evaluate(get_end_expr(this.loop_control).all) loop
               memory.store(get_lexeme(this.var), I);
               execute(this.for_body);
            end loop;

         when WHILE_STMT =>
            while evaluate(this.while_expr) loop
               execute(this.while_body);
            end loop;

         when PRINT_STMT =>
            Put_Line(evaluate(this.print_expr.all)'Image);

         when others =>
            Put_Line("Tried to executre invalid statement");
      end case;
   end execute;

   procedure add_statement (this: in out block; stmt: in statement_access) is
   begin
      this.stmts.Append(stmt);
      end add_statement;

   procedure execute (this: in block) is
   begin
      for E of this.stmts loop
         execute(E.all);
         end loop;

   end execute;

   function make (expr: in arithmetic_expression_access)
                  return statement_access is
      stmt : statement_access;
   begin
      stmt := new statement (PRINT_STMT);
      stmt.print_expr := expr;
      return stmt;
   end make;

   function make (loop_var: in id; loop_control: in iter; bk: in block)
                  return statement_access is
      stmt : statement_access;
   begin
      stmt := new statement (FOR_STMT);
      stmt.loop_var := loop_var;
      stmt.loop_control := loop_control;
      stmt.for_body := bk;
      return stmt;
   end make;

   function make (expr: in boolean_expression; if_block, else_block: in block)
                  return statement_access is
      stmt : statement_access;
   begin
      stmt := new statement (IF_STMT);
      stmt.if_expr := expr;
      stmt.if_block := if_block;
      stmt.else_block := else_block;
      return stmt;
   end make;

   function make (expr: in boolean_expression; bk: in block)
                  return statement_access is
      stmt : statement_access;
   begin
      stmt := new statement (WHILE_STMT);
      stmt.while_expr := expr;
      stmt.while_body := bk;
      return stmt;
   end make;

   function make (lvalue: in id; expr: in arithmetic_expression_access)
                  return statement_access is
      stmt : statement_access;
   begin
      stmt := new statement (ASSN_STMT);
      stmt.var := lvalue;
      stmt.r_value := expr;
      return stmt;
   end make;

end statements;
