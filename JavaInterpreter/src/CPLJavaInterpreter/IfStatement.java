package CPLJavaInterpreter;


public class IfStatement implements Statement
{
    private BooleanExpression bool;
    private Block block1;
    private Block block2;

    public IfStatement(BooleanExpression bool, Block block1, Block block2)
    {
        this.bool = bool;
        this.block1 = block1;
        this.block2 = block2;

    }

    public void evaluate()
    {
        if(bool.evaluate())
            block1.evaluate();
        else
            block2.evaluate();

    }
}
