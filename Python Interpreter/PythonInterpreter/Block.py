class Block:

    def __init__(self):
        self.statementList = []

    def add_statement(self, stmnt):
        if stmnt is not None:
            self.statementList.append(stmnt)
        else:
            raise AttributeError("Invalid statement")

    def evaluate(self):
        for statements in self.statementList:
            statements.evaluate()
