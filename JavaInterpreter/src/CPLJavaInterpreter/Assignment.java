package CPLJavaInterpreter;

public class Assignment implements Statement
{

    private Expression expr;

    private Id var;

    /**
     * @param var - cannot be null
     * @param expr - cannot be null
     * @throws IllegalArgumentException if either argument is null
     */
    public Assignment(Id var, Expression expr)
    {
        if (var == null)
            throw new IllegalArgumentException ("null Id argument");
        if (expr == null)
            throw new IllegalArgumentException ("null expression argument");
        this.expr = expr;
        this.var = var;
    }

    public void evaluate()
    {
        Memory.store(var.getChar(), expr.evaluate());
    }

}