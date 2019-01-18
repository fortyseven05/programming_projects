class Program:

    def __init__(self, block):
        if block is not None:
            self.block = block
        else:
            raise AttributeError("Block is null")

    def evaluate(self):
        self.block.evaluate()
