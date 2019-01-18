import Memory
from LexicalAnalyzer import LexicalAnalyzer


class Id:

    def __init__(self, ch):
        if LexicalAnalyzer.is_valid_identifier(ch):
            self.ch = ch
        else:
            raise AttributeError("Invalid character set to ID")

    def evaluate(self):
        try:
            return Memory.fetch(self.ch)
        except AttributeError:
            print("Attempted to evaluate un-stored id")

    def get_char(self):
        return self.ch
