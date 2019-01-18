package CPLJavaInterpreter;

public class Program
{
    private Block b;

    public Program(Block b)
    {
        if (b == null)
        {
            throw new IllegalArgumentException("Block is null");
        }
        else
            this.b = b;
    }

    public void evaluate()
    {
        b.evaluate();
    }



}
