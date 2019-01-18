import Memory
import Exceptions
import Iterator


class AssignmentStatement:

    def __init__(self, var, expr):
        try:
            self.var = var
        except Exceptions.NullIDError:
            print("Null ID passed to Assignment Statement")
        try:
            self.expr = expr
        except Exceptions.NullExpressionError:
            print("Null Expression passed to Assignment Statement")

    def evaluate(self):
        Memory.store(self.var.get_char(), self.expr.evaluate())

class ForStatement:

    def __init__ (self, id, itr, block):
        self.id = id.get_char()
        self.block = block
        self.start = Iterator.Iterator.get_start(itr)
        self.end = Iterator.Iterator.get_end(itr)



    def evaluate(self):
        for start in range(self.start, self.end):
            Memory.store(self.id, start)
            self.block.evaluate()


class WhileStatement:

    def __init__(self, bool, block):
        self.bool = bool
        self.block = block

    def evaluate(self):
        while self.bool.evaluate():
            self.block.evaluate()


class IfStatement:

    def __init__(self, bool, block1, block2):
        self.bool = bool
        self.block1 = block1
        self.block2 = block2

    def evaluate(self):
        if self.bool.evaluate():
            self.block1.evaluate()
        else:
            self.block2.evaluate()
