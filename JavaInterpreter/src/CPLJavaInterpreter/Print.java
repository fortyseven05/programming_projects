package CPLJavaInterpreter;


public class Print implements Statement
{
    private Expression exp;

    public Print (Expression exp)
    {
        if (exp == null)
            throw new IllegalArgumentException("Null expression argument");
        this.exp = exp;
    }

    public void evaluate()
    {
        System.out.println(exp.evaluate());
    }


}
