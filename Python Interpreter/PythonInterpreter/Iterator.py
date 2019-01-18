class Iterator:

    def __init__(self, expr1, expr2):
        self.expr1 = expr1
        self.expr2 = expr2

    def get_start(self):
        start = self.expr1.evaluate()
        return start

    def get_end(self):
        end = self.expr2.evaluate()
        return end
