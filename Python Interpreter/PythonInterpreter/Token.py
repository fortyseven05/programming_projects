import Enumerated


class Token:

    rowNumber = 0
    colNumber = 0
    tokType = Enumerated.TokenType
    lexeme = ""

    def __init__(self, rowNumber, colNumber, lexeme, tokType):
        if rowNumber <= 0:
            raise AttributeError("Invalid row number argument")
        if colNumber <= 0:
            raise AttributeError("Invalid column number argument")
        if lexeme is None or len(lexeme) == 0:
            raise AttributeError("Invalid lexeme argument")
        if tokType is None:
            raise AttributeError("Invalid TokenType argument")

        self.rowNumber = rowNumber
        self.colNumber = colNumber
        self.lexeme = lexeme
        self.tokType = tokType

    def get_row_number(self):
        return self.rowNumber

    def get_col_number(self):
        return self.colNumber

    def get_lexeme(self):
        return self.lexeme

    def get_tok_type(self):
        return self.tokType

