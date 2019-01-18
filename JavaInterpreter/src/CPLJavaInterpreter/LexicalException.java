package CPLJavaInterpreter;

public class LexicalException extends Exception
{

    public LexicalException(String string)
    {
        System.out.println("Lexical Exception: " + string);
    }

}
