from LexicalAnalyzer import LexicalAnalyzer
from Block import Block
from Id import Id
import Statement
import Expression
import Program
import Enumerated
import Exceptions
import Iterator
import Constant
import Print

TokenType = Enumerated.TokenType
RelativeOperator = Enumerated.RelativeOperator
ArithmeticOperator = Enumerated.ArithmeticOperator


class Parser:

    def __init__(self, filename):
        self.lex = LexicalAnalyzer(filename)

    def parse(self):
        tok = self.lex.get_next_token()
        self.match(tok, TokenType.FUNC_KW_TOK)
        id_var = self.get_id()
        tok = self.lex.get_next_token()
        self.match(tok, TokenType.OPEN_PAREN_TOK)
        tok = self.lex.get_next_token()
        self.match(tok, TokenType.CLOSE_PAREN_TOK)
        block = self.get_block()
        tok = self.lex.get_next_token()
        self.match(tok, TokenType.END_KW_TOK)
        tok = self.lex.get_next_token()
        self.match(tok, TokenType.EOS_TOK)
        return Program.Program(block)

    def get_expression(self):
        tok = self.lex.get_look_ahead_token()
        if tok.get_tok_type() == TokenType.ADD_TOK or tok.get_tok_type() == TokenType.MUL_TOK or tok.get_tok_type() ==\
                TokenType.SUB_TOK or tok.get_tok_type() == TokenType.DIV_TOK or tok.get_tok_type() == TokenType.MOD_TOK\
                or tok.get_tok_type() == TokenType.EXP_TOK or tok.get_tok_type() == TokenType.REV_DIV_TOK:
            expr = self.get_binary_expression()
        elif tok.get_tok_type() == TokenType.ID_TOK:
            expr = self.get_id()
        else:
            expr = self.get_constant()
        return expr

    def get_assignment(self):
        var = self.get_id()
        tok = self.lex.get_next_token()
        self.match(tok, TokenType.ASSIGN_TOK)
        expr = self.get_expression()
        return Statement.AssignmentStatement(var, expr)

    def get_block(self):
        block = Block()
        tok = self.lex.get_look_ahead_token()
        while tok.get_tok_type() == TokenType.FOR_KW_TOK or tok.get_tok_type() == TokenType.WHILE_KW_TOK or \
                tok.get_tok_type() == TokenType.IF_KW_TOK or tok.get_tok_type() == TokenType.PRINT_KW_TOK or \
                tok.get_tok_type() == TokenType.ID_TOK:
            statement = self.get_statement(tok)
            block.add_statement(statement)
            tok = self.lex.get_look_ahead_token()
        return block

    def get_statement(self, tok):
        if tok.get_tok_type() == TokenType.PRINT_KW_TOK:
            statement = self.get_print()
        elif tok.get_tok_type() == TokenType.IF_KW_TOK:
            statement = self.get_if()
        elif tok.get_tok_type() == TokenType.WHILE_KW_TOK:
            statement = self.get_while()
        elif tok.get_tok_type() == TokenType.FOR_KW_TOK:
            statement = self.get_for()
        elif tok.get_tok_type() == TokenType.ID_TOK:
            statement = self.get_assignment()
        else:
            raise Exceptions.ParserError("KW_TOK or ID_TOK", tok)
        return statement

    def get_boolean_expression(self):
        tok = self.lex.get_next_token()
        if tok.get_tok_type() == TokenType.EQ_TOK:
            self.match(tok, TokenType.EQ_TOK)
            rel_op = RelativeOperator.EQ_OP
        elif tok.get_tok_type() == TokenType.NE_TOK:
            self.match(tok, TokenType.NE_TOK)
            rel_op = RelativeOperator.NE_OP
        elif tok.get_tok_type() == TokenType.LT_TOK:
            self.match(tok, TokenType.LT_TOK)
            rel_op = RelativeOperator.LT_OP
        elif tok.get_tok_type() == TokenType.GT_TOK:
            self.match(tok, TokenType.GT_TOK)
            rel_op = RelativeOperator.GT_OP
        elif tok.get_tok_type() == TokenType.LE_TOK:
            self.match(tok, TokenType.LE_TOK)
            rel_op = RelativeOperator.LE_OP
        elif tok.get_tok_type() == TokenType.GE_TOK:
            self.match(tok, TokenType.GE_TOK)
            rel_op = RelativeOperator.GE_OP
        else:
            raise Exceptions.ParserError(Enumerated.RelativeOperator, tok)
        expr1 = self.get_expression()
        expr2 = self.get_expression()
        return Expression.BooleanExpression(rel_op, expr1, expr2)

    def get_binary_expression(self):
        tok = self.lex.get_next_token()
        if tok.get_tok_type() == TokenType.ADD_TOK:
            self.match(tok, TokenType.ADD_TOK)
            oper = ArithmeticOperator.ADD_OP
        elif tok.get_tok_type() == TokenType.MUL_TOK:
            self.match(tok, TokenType.MUL_TOK)
            oper = ArithmeticOperator.MUL_OP
        elif tok.get_tok_type() == TokenType.SUB_TOK:
            self.match(tok, TokenType.SUB_TOK)
            oper = ArithmeticOperator.SUB_OP
        elif tok.get_tok_type() == TokenType.DIV_TOK:
            self.match(tok, TokenType.DIV_TOK)
            oper = ArithmeticOperator.DIV_OP
        elif tok.get_tok_type() == TokenType.MOD_TOK:
            self.match(tok, TokenType.MOD_TOK)
            oper = ArithmeticOperator.MOD_OP
        elif tok.get_tok_type() == TokenType.REV_DIV_TOK:
            self.match(tok, TokenType.REV_DIV_TOK)
            oper = ArithmeticOperator.REV_DIV_OP
        elif tok.get_tok_type() == TokenType.EXP_TOK:
            self.match(tok, TokenType.EXP_TOK)
            oper = ArithmeticOperator.EXP_OP
        else:
            raise Exceptions.ParserError("Operator Token", tok)
        expr1 = self.get_expression()
        expr2 = self.get_expression()
        return Expression.BinaryExpression(oper, expr1, expr2)

    def get_iter(self):
        expr1 = self.get_expression()
        tok = self.lex.get_next_token()
        self.match(tok, TokenType.ITER_TOK)
        expr2 = self.get_expression()
        return Iterator.Iterator(expr1, expr2)

    def get_id(self):
        tok = self.lex.get_next_token()
        self.match(tok, TokenType.ID_TOK)
        return Id(tok.get_lexeme()[0])

    def get_constant(self):
        tok = self.lex.get_next_token()
        self.match(tok, TokenType.CONST_TOK)
        value = int(tok.get_lexeme())
        return Constant.Constant(value)

    def get_print(self):
        tok = self.lex.get_next_token()
        self.match(tok, TokenType.PRINT_KW_TOK)
        tok = self.lex.get_next_token()
        self.match(tok, TokenType.OPEN_PAREN_TOK)
        exp = self.get_expression()
        tok = self.lex.get_next_token()
        self.match(tok, TokenType.CLOSE_PAREN_TOK)
        return Print.Print(exp)

    def get_for(self):
        tok = self.lex.get_next_token()
        self.match(tok, TokenType.FOR_KW_TOK)
        id_var = self.get_id()
        tok = self.lex.get_next_token()
        self.match(tok, TokenType.ASSIGN_TOK)
        iterator = self.get_iter()
        block = self.get_block()
        tok = self.lex.get_next_token()
        self.match(tok, TokenType.END_KW_TOK)
        return Statement.ForStatement(id_var, iterator, block)

    def get_while(self):
        tok = self.lex.get_next_token()
        self.match(tok, TokenType.WHILE_KW_TOK)
        bool = self.get_boolean_expression()
        block = self.get_block()
        tok = self.lex.get_next_token()
        self.match(tok, TokenType.END_KW_TOK)
        return Statement.WhileStatement(bool, block)

    def get_if(self):
        tok = self.lex.get_next_token()
        self.match(tok, TokenType.IF_KW_TOK)
        bool = self.get_boolean_expression()
        block1 = self.get_block()
        tok = self.lex.get_next_token()
        self.match(tok, TokenType.ELSE_KW_TOK)
        block2 = self.get_block()
        tok = self.lex.get_next_token()
        self.match(tok, TokenType.END_KW_TOK)
        return Statement.IfStatement(bool, block1, block2)

    def match(self, tok, tokType):
        assert (tok is not None and tokType is not None)
        if tok.get_tok_type() != tokType:
            raise Exceptions.ParserError(tokType, tok)

