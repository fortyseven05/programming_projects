package CPLJavaInterpreter;

import java.io.FileNotFoundException;

public class Interpreter
{

    public static void main(String[] args)
    {
        try
        {
            Parser p = new Parser("src/CPLJavaInterpreter/resources/expr1.txt");
            Program prgm = p.parse();
            prgm.evaluate();
            Memory.displayMemory(); // to see results of assignment statement
        }
        catch (ParserException e)
        {
            e.printStackTrace();
        }

        catch (FileNotFoundException e)
        {
            e.printStackTrace();
        }
        catch (LexicalException e)
        {
            e.printStackTrace();
        }
    }
}