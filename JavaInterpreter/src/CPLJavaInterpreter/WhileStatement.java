package CPLJavaInterpreter;

public class WhileStatement implements Statement {

    private BooleanExpression bool;
    private Block block;

    public WhileStatement(BooleanExpression bool, Block block)
    {
        this.bool = bool;
        this.block = block;
    }

    @Override
    public void evaluate()
    {

        while(bool.evaluate()){
            block.evaluate();
        }
    }
}
