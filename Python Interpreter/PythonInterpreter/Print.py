class Print:

    def __init__(self, exp):
        self.exp = exp
        if self.exp is None:
            raise ValueError("Empty object reference passed to Print function")

    def evaluate(self):
        print(self.exp.evaluate())
