package CPLJavaInterpreter;

import java.io.FileNotFoundException;


public class Parser
{
    private LexicalAnalyzer lex;

    public Parser(String fileName) throws FileNotFoundException, LexicalException
    {
        lex = new LexicalAnalyzer (fileName);
    }

    /*****************************************************
     * implements the production <assign> -> <id> assign_op <expr>
     */
    public Program parse() throws ParserException, LexicalException
    {

        Token tok = lex.getNextToken();
        match (tok, TokenType.FUNC_KW_TOK);
        Id id = getId();
        tok = lex.getNextToken();
        match (tok, TokenType.OPEN_PAREN_TOK);
        tok = lex.getNextToken();
        match (tok, TokenType.CLOSE_PAREN_TOK);
        Block b = getBlock();
        tok = lex.getNextToken();
        match (tok, TokenType.END_KW_TOK);

        return new Program(b);
    }

    /**************************************************************
     * implements the production <expr> -> <operator> <expr> <expr> | id | constant
     */
    private Expression getExpression() throws ParserException, LexicalException
    {
        Expression expr;
        Token tok = lex.getLookaheadToken ();
        if (tok.getTokType() == TokenType.ADD_TOK || tok.getTokType() == TokenType.MUL_TOK || tok.getTokType() == TokenType.SUB_TOK || tok.getTokType() == TokenType.DIV_TOK
            || tok.getTokType() == TokenType.MOD_TOK || tok.getTokType() == TokenType.EXP_TOK || tok.getTokType() == TokenType.REV_DIV_TOK)

            expr = getBinaryExpression ();

        else if (tok.getTokType() == TokenType.ID_TOK)
            expr = getId();
        else
            expr = getConstant();
        return expr;
    }

    /****************************************************
     * implements the production <expr> -> <operator> <expr> <expr>
     */

    public Assignment getAssignment() throws ParserException, LexicalException
    {
        Id var = getId();
        Token tok = lex.getNextToken();
        match (tok, TokenType.ASSIGN_TOK);
        Expression expr = getExpression();
        return new Assignment (var, expr);
    }



    private Block getBlock() throws ParserException, LexicalException
    {
        Statement s;
        Block b = new Block();
        Token tok = lex.getLookaheadToken();
        while(tok.getTokType() == TokenType.FOR_KW_TOK || tok.getTokType() == TokenType.WHILE_KW_TOK ||
                tok.getTokType() == TokenType.IF_KW_TOK || tok.getTokType() == TokenType.PRINT_KW_TOK || tok.getTokType() == TokenType.ID_TOK)
        {
            s = getStatement(tok);
            b.addStatement(s);
            tok = lex.getLookaheadToken();
        }
        return b;
    }

    private Statement getStatement(Token tok) throws ParserException, LexicalException
    {
        Statement s;
        if (tok.getTokType() == TokenType.PRINT_KW_TOK)
            s = getPrint();
        else if (tok.getTokType() == TokenType.IF_KW_TOK)
            s = getIf();
        else if (tok.getTokType() == TokenType.WHILE_KW_TOK)
            s = getWhile();
        else if (tok.getTokType() == TokenType.FOR_KW_TOK)
            s = getFor();
        else if (tok.getTokType() == TokenType.ID_TOK)
            s = getAssignment();
        else
            throw new ParserException("Invalid statement token at row " + tok.getRowNumber() + " and column "  + tok.getColumnNumber());
        return s;
    }

    private BooleanExpression getBooleanExpression() throws ParserException, LexicalException
    {
        RelativeOperator rOp;
        Token tok = lex.getNextToken();
        if (tok.getTokType() == TokenType.EQ_TOK)
        {
            match(tok, TokenType.EQ_TOK);
            rOp = RelativeOperator.EQ_OP;
        }
        else if (tok.getTokType() == TokenType.NE_TOK)
        {
            match(tok, TokenType.NE_TOK);
            rOp = RelativeOperator.NE_OP;
        }
        else if (tok.getTokType() == TokenType.LT_TOK)
        {
            match(tok, TokenType.LT_TOK);
            rOp = RelativeOperator.LT_OP;
        }
        else if (tok.getTokType() == TokenType.GT_TOK)
        {
            match(tok, TokenType.GT_TOK);
            rOp = RelativeOperator.GT_OP;
        }
        else if (tok.getTokType() == TokenType.LE_TOK)
        {
            match(tok, TokenType.LE_TOK);
            rOp = RelativeOperator.LE_OP;
        }
        else if (tok.getTokType() == TokenType.GE_TOK)
        {
            match(tok, TokenType.GE_TOK);
            rOp = RelativeOperator.GE_OP;
        }
        else
        throw new ParserException (" operator expected at row " +
                tok.getRowNumber() +" and column "  + tok.getColumnNumber());

        Expression expr1 = getExpression();
        Expression expr2 = getExpression();
        return new BooleanExpression (rOp, expr1, expr2);
    }

    private Expression getBinaryExpression() throws ParserException, LexicalException
    {
        ArithmeticOperator op;
        Token tok = lex.getNextToken();
        if (tok.getTokType() == TokenType.ADD_TOK)
        {
            match (tok, TokenType.ADD_TOK);
            op = ArithmeticOperator.ADD_OP;
        }
        else if (tok.getTokType() == TokenType.MUL_TOK)
        {
            match (tok, TokenType.MUL_TOK);
            op = ArithmeticOperator.MUL_OP;
        }
        else if (tok.getTokType() == TokenType.SUB_TOK)
        {
            match (tok, TokenType.SUB_TOK);
            op = ArithmeticOperator.SUB_OP;
        }
        else if (tok.getTokType() == TokenType.DIV_TOK)
        {
            match (tok, TokenType.DIV_TOK);
            op = ArithmeticOperator.DIV_OP;
        }
        else if (tok.getTokType() == TokenType.MOD_TOK)
        {
            match (tok, TokenType.MOD_TOK);
            op = ArithmeticOperator.MOD_OP;
        }
        else if (tok.getTokType() == TokenType.REV_DIV_TOK)
        {
            match (tok, TokenType.REV_DIV_TOK);
            op = ArithmeticOperator.REV_DIV_OP;
        }
        else if (tok.getTokType() == TokenType.EXP_TOK)
        {
            match (tok, TokenType.EXP_TOK);
            op = ArithmeticOperator.EXP_OP;
        }
        else
            throw new ParserException (" operator expected at row " +
                    tok.getRowNumber() +" and column "  + tok.getColumnNumber());
        Expression expr1 = getExpression();
        Expression expr2 = getExpression();
        return new BinaryExpression (op, expr1, expr2);
    }

    private Iter getIter() throws LexicalException, ParserException
    {
        Expression expr1 = getExpression();
        Token tok = lex.getNextToken();
        match (tok, TokenType.ITER_TOK);
        Expression expr2 = getExpression();
        return new Iter(expr1, expr2);
    }

    private Id getId() throws LexicalException, ParserException
    {
        Token tok = lex.getNextToken();
        match (tok, TokenType.ID_TOK);
        return new Id (tok.getLexeme().charAt(0));
    }

    private Expression getConstant() throws ParserException, LexicalException
    {
        Token tok = lex.getNextToken();
        match (tok, TokenType.CONST_TOK);
        int value = Integer.parseInt(tok.getLexeme());
        return new Constant (value);
    }

    private Statement getPrint() throws ParserException, LexicalException
    {
        Token tok =  lex.getNextToken();
        match(tok, TokenType.PRINT_KW_TOK);
        tok = lex.getNextToken();
        match(tok, TokenType.OPEN_PAREN_TOK);
        Expression exp = getExpression();
        tok = lex.getNextToken();
        match(tok, TokenType.CLOSE_PAREN_TOK);
        return new Print(exp);

    }

    private Statement getFor() throws ParserException, LexicalException
    {
        Token tok = lex.getNextToken();
        match(tok, TokenType.FOR_KW_TOK);
        Id id = getId();
        tok = lex.getNextToken();
        match(tok, TokenType.ASSIGN_TOK);
        Iter iter = getIter();
        Block block = getBlock();
        tok = lex.getNextToken();
        match(tok, TokenType.END_KW_TOK);
        return new ForStatement(id, iter, block);
    }

    private Statement getWhile() throws ParserException, LexicalException
    {
        Token tok = lex.getNextToken();
        match(tok, TokenType.WHILE_KW_TOK);
        BooleanExpression bool = getBooleanExpression();
        Block block = getBlock();
        tok = lex.getNextToken();
        match(tok, TokenType.END_KW_TOK);
        return new WhileStatement(bool, block);
    }



    private Statement getIf() throws ParserException, LexicalException
    {
        Token tok = lex.getNextToken();
        match(tok, TokenType.IF_KW_TOK);
        BooleanExpression bool = getBooleanExpression();
        Block block1 = getBlock();
        tok = lex.getNextToken();
        match(tok, TokenType.ELSE_KW_TOK);
        Block block2 = getBlock();
        tok = lex.getNextToken();
        match(tok, TokenType.END_KW_TOK);
        return new IfStatement(bool, block1, block2);
    }

    private void match(Token tok, TokenType tokType) throws ParserException
    {
        assert (tok != null && tokType != null);
        if (tok.getTokType() != tokType)
            throw new ParserException (tokType.name() + " expected at row " +
                    tok.getRowNumber() +" and column "  + tok.getColumnNumber());
    }

}