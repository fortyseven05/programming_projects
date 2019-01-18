package CPLJavaInterpreter;

public class Iter
{
    private Expression expr1, expr2;
    private int [] array = {0,0};

    public Iter(Expression expr1, Expression expr2)
    {
        this.expr1 = expr1;
        this.expr2 = expr2;
    }

    public int[] evaluate()
    {
        array [0] = expr1.evaluate();
        array [1] = expr2.evaluate();
        return array;
    }






}
