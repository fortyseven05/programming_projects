import sys


class FileContentsError(Exception):

    def __init__(self, message):
        print(message)
        sys.exit()


class LexicalError(Exception):

    def __init__(self, row, col):
        print(f"Invalid lexeme at row number {row} and column {col}")
        sys.exit()


class ParserError(Exception):

    def __init__(self, tokType, tok):
        self.row = tok.get_row_number()
        self.col = tok.get_col_number()
        self.found = tok.get_tok_type().name
        print(f"{tokType.name} expected at row {self.row} and column {self.col}: Found {self.found}")
        sys.exit()

    def __init__(self, message, tok):
        self.row = tok.get_row_number()
        self.col = tok.get_col_number()
        self.found = tok.get_tok_type().name
        print(f"{message} expected at row {self.row} and column {self.col}: Found {self.found}")
        sys.exit()


class NullExpressionError(Exception):
    pass


class NullIDError(Exception):
    pass


class MemoryError(Exception):

    def __init__(self, ch):
        self.ch = ch
        print(f"Attempted to access un-stored identifier in Memory() : ", ch)
        sys.exit()
