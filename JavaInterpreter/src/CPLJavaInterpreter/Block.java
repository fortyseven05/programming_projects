package CPLJavaInterpreter;

import java.util.ArrayList;
import java.util.List;

public class Block
{
    private List<Statement> statementList;

    public Block ()
    {
        statementList = new ArrayList<>();
    }

    public void addStatement(Statement stmnt)
    {
        if (stmnt != null)
            statementList.add(stmnt);
        else
            throw new IllegalArgumentException("Invalid statement");
    }

    public void evaluate()
    {
        for ( Statement s : statementList)
        {
            s.evaluate();
        }
    }
}
