package CPLJavaInterpreter;


public class BooleanExpression {

    private Expression expr1, expr2;

    private RelativeOperator rOp;

    public BooleanExpression(RelativeOperator rOp, Expression expr1, Expression expr2){
        if (expr1 == null || expr2 == null)
            throw new IllegalArgumentException("Null expression argument");
        this.expr1 = expr1;
        this.expr2 = expr2;
        this.rOp = rOp;
    }

    public boolean evaluate(){

        boolean value = false;
        if (rOp == RelativeOperator.EQ_OP)
            value = expr1.evaluate() == expr2.evaluate();
        else if (rOp == RelativeOperator.LT_OP)
            value = expr1.evaluate() < expr2.evaluate();

        else if (rOp == RelativeOperator.GT_OP)
            value = expr1.evaluate() > expr2.evaluate();

        else if (rOp == RelativeOperator.LE_OP)
            value = expr1.evaluate() <= expr2.evaluate();

        else if (rOp == RelativeOperator.GE_OP)
            value = expr1.evaluate() >= expr2.evaluate();

        else if (rOp == RelativeOperator.NE_OP)
            value = expr1.evaluate() != expr2.evaluate();

        return value;

    }
}