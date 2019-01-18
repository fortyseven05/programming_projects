package CPLJavaInterpreter;

public class ParserException extends Exception
{

    public ParserException(String string)
    {
        System.out.println("Parser Exception: " + string);
    }

}
