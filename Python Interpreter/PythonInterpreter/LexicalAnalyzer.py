import Enumerated
import Exceptions
from Token import Token

TokenType = Enumerated.TokenType


class LexicalAnalyzer:

    def __init__(self, file_name):
        assert(file_name is not None)
        self.tokens = list()
        line_number = 0
        with open(file_name, "r") as file:
            for line in file:
                self.process_line(line, line_number)
                line_number += 1
        if line_number < 1:
            raise Exceptions.FileContentsError("Blank Program File")
        self.tokens.append(Token(line_number, 1, "EOS", Enumerated.TokenType.EOS_TOK))

    def process_line(self, line, line_number):
        assert line is not None and line_number >= 0
        index = 0
        index = self.skip_white_space(line, index)
        while index < len(line):
            lexeme = self.get_lexeme(line, line_number, index)
            tokType = self.get_token_type(lexeme, line_number, index)
            self.tokens.append(Token(line_number + 1, index + 1, lexeme, tokType))
            index += len(lexeme)
            index = self.skip_white_space(line, index)

    def get_token_type(self, lexeme, line_number, column_number):
        assert(lexeme is not None and line_number >= 0 and column_number >= 0)
        if lexeme[0].isalpha():
            if len(lexeme) == 1:
                if self.is_valid_identifier(lexeme[0]):
                    tok_type = TokenType.ID_TOK
                else:
                    raise Exceptions.LexicalError(line_number + 1, column_number + 1)
            elif len(lexeme) > 1:
                if lexeme == "for":
                    tok_type = TokenType.FOR_KW_TOK
                elif lexeme == "function":
                    tok_type = TokenType.FUNC_KW_TOK
                elif lexeme == "print":
                    tok_type = TokenType.PRINT_KW_TOK
                elif lexeme == "end":
                    tok_type = TokenType.END_KW_TOK
                elif lexeme == "if":
                    tok_type = TokenType.IF_KW_TOK
                elif lexeme == "else":
                    tok_type = TokenType.ELSE_KW_TOK
                elif lexeme == "while":
                    tok_type = TokenType.WHILE_KW_TOK
                else:
                    raise Exceptions.LexicalError(line_number + 1, column_number + 1)
            else:
                raise Exceptions.LexicalError(line_number + 1, column_number + 1)
        elif lexeme[0].isdigit():
            if lexeme.isdigit():
                tok_type = TokenType.CONST_TOK
            else:
                raise Exceptions.LexicalError(line_number + 1, column_number + 1)
        elif lexeme == "+":
            tok_type = TokenType.ADD_TOK
        elif lexeme == "*":
            tok_type = TokenType.MUL_TOK
        elif lexeme == "=":
            tok_type = TokenType.ASSIGN_TOK
        elif lexeme == "-":
            tok_type = TokenType.SUB_TOK
        elif lexeme == "^":
            tok_type = TokenType.EXP_TOK
        elif lexeme == "/":
            tok_type = TokenType.DIV_TOK
        elif lexeme == "\\":
            tok_type = TokenType.REV_DIV_TOK
        elif lexeme == "%":
            tok_type = TokenType.MOD_TOK
        elif lexeme == "(":
            tok_type = TokenType.OPEN_PAREN_TOK
        elif lexeme == ")":
            tok_type = TokenType.CLOSE_PAREN_TOK
        elif lexeme == ":":
            tok_type = TokenType.ITER_TOK
        elif lexeme == "==":
            tok_type = TokenType.EQ_TOK
        elif lexeme == "!=":
            tok_type = TokenType.NE_TOK
        elif lexeme == "<":
            tok_type = TokenType.LT_TOK
        elif lexeme == ">":
            tok_type = TokenType.GT_TOK
        elif lexeme == ">=":
            tok_type = TokenType.GE_TOK
        elif lexeme == "<=":
            tok_type = TokenType.LE_TOK
        else:
            raise Exceptions.LexicalError(line_number + 1, column_number + 1)
        return tok_type

    def get_lexeme(self, line, line_number, index):
        assert(line is not None and line_number >= 0 and index >= 0)
        i = index
        while i < len(line) and not line[i].isspace():
            i += 1
        return line[index:i]

    def skip_white_space(self, line, index):
        assert line is not None and index >= 0
        while index < len(line) and line[index].isspace():
            index += 1
        return index

    def get_next_token(self):
        if not self.tokens:
            raise Exceptions.FileContentsError("No more tokens")
        return self.tokens.pop(0)

    def get_look_ahead_token(self):
        if not self.tokens:
            raise Exceptions.FileContentsError("No more tokens")
        return self.tokens[0]

    @staticmethod
    def is_valid_identifier(ch):
        return ch.isalpha()
