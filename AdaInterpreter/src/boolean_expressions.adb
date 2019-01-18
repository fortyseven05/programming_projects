pragma Ada_2012;

with memory; use memory;


package body boolean_expressions is

      ----------
      -- make --
      ----------

      function make (op: in relational_operator; expr1, expr2: in arithmetic_expression_access)
                  return boolean_expression is
      expr: boolean_expression :=
        (op     => op,
         first  => expr1,
         second => expr2);
      begin
      return expr;
      end make;

      --------------
      -- evaluate --
      --------------

      function evaluate (this: in boolean_expression)
                         return boolean is
         result : boolean;
      begin
         case this.op is
            when EQ_OP =>
               result := evaluate (this.first.all) = evaluate (this.second.all);
            when NE_OP =>
               result := evaluate (this.first.all) /= evaluate (this.second.all);
            when LT_OP =>
               result := evaluate (this.first.all) < evaluate (this.second.all);
            when LE_OP =>
               result := evaluate (this.first.all) <= evaluate (this.second.all);
            when GT_OP =>
               result := evaluate (this.first.all) > evaluate (this.second.all);
         when GE_OP =>
            result := evaluate (this.first.all) >= evaluate (this.second.all);
      end case;
      return result;
   end evaluate;
end boolean_expressions;


