package CPLJavaInterpreter;

public class Memory
{

    private static int[] mem = new int [52];

    /**
     * @param ch - must be a valid identifier
     * @return value of ch
     * @throws IllegalArgumentException if ch is not a valid identifier
     */
    public static int fetch (char ch)
    {
        return mem[getIndex(ch)];
    }

    /**
     * @param ch - must be a valid identifier
     * @param value
     * @throws IllegalArgumentException if ch is not a valid identifier
     */
    public static void store (char ch, int value)
    {
        mem[getIndex(ch)] = value;
    }

    private static int getIndex (char ch)
    {
        if (!LexicalAnalyzer.isValidIdentifier(ch))
        {throw new IllegalArgumentException (ch + " is not a valid identifier");}
        if (ch -'A' < 26)
            return ch - 'A';
        else return ch - 'a' + 26;

    }

    public static void displayMemory()
    {
        for (int i = 0; i < 52; i++)
            if(i < 26)
               System.out.println ((char)('A' + i ) + ": " + mem[i]);
            else
                System.out.println((char)('a' + i - 26) + ": " + mem[i]);
    }
}
