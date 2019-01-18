package CPLJavaInterpreter;


public class BinaryExpression implements Expression {

    private Expression expr1, expr2;

    private ArithmeticOperator op;

    public BinaryExpression(ArithmeticOperator op, Expression expr1, Expression expr2){
        if (expr1 == null || expr2 == null)
            throw new IllegalArgumentException("Null expression argument");
        this.expr1 = expr1;
        this.expr2 = expr2;
        this.op = op;
    }

    @Override
    public int evaluate(){
        int value;
        if (op == ArithmeticOperator.ADD_OP)
            value = expr1.evaluate() + expr2.evaluate();
        else if (op == ArithmeticOperator.SUB_OP)
            value = expr1.evaluate() - expr2.evaluate();
        else if (op == ArithmeticOperator.MUL_OP)
            value = expr1.evaluate() * expr2.evaluate();
        else if (op == ArithmeticOperator.DIV_OP)
            value = expr1.evaluate() / expr2.evaluate();
        else if (op == ArithmeticOperator.EXP_OP)
            value = (int)Math.pow(expr1.evaluate(), expr2.evaluate());
        else if (op == ArithmeticOperator.MOD_OP)
            value = expr1.evaluate() % expr2.evaluate();
        else value = expr2.evaluate() / expr1.evaluate();
        return value;

    }
}
