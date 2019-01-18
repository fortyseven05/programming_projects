package CPLJavaInterpreter;

public class ForStatement implements Statement {

    private Id id;
    private Iter iter;
    private Block block;
    private int[] array = {0,0};

    public ForStatement(Id id, Iter iter, Block block)
    {
        this.id = id;
        this.iter = iter;
        this.block = block;
        this.array = iter.evaluate();
    }

    public void evaluate()
    {
        for(int i = array[0]; i <= array[1] ; i++ )
        {
            Memory.store(id.getChar(), i);
            block.evaluate();
        }

    }
}
