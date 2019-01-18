with arithmetic_expressions; use arithmetic_expressions;
with Ada.Finalization; use Ada.Finalization;

package body iters is

   function make (expr1, expr2: in arithmetic_expression_access) return iter is
      i: iter;
   begin
      i.start_expr := expr1;
      i.end_expr := expr2;
      return i;
   end make;

   function get_start_expr (this: in iter) return arithmetic_expression_access is
   begin
      return this.start_expr;
   end get_start_expr;

   function get_end_expr (this: in iter) return arithmetic_expression_access is
   begin
      return this.end_expr;
   end get_end_expr;

end iters;
