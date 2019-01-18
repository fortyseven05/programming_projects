import Enumerated


class BinaryExpression:

    def __init__(self, arith_op, expr1, expr2):
        if expr1 is None or expr2 is None:
            raise RuntimeError("Empty expression object called in BinaryExpression")
        self.arith_op = arith_op
        self.expr1 = expr1
        self.expr2 = expr2

    def evaluate(self):
        if self.arith_op is Enumerated.ArithmeticOperator.ADD_OP:
            value = self.expr1.evaluate() + self.expr2.evaluate()
        elif self.arith_op is Enumerated.ArithmeticOperator.SUB_OP:
            value = self.expr1.evaluate() - self.expr2.evaluate()
        elif self.arith_op is Enumerated.ArithmeticOperator.MUL_OP:
            value = self.expr1.evaluate() * self.expr2.evaluate()
        elif self.arith_op is Enumerated.ArithmeticOperator.DIV_OP:
            value = self.expr1.evaluate() / self.expr2.evaluate()
        elif self.arith_op is Enumerated.ArithmeticOperator.EXP_OP:
            value = pow(self.expr1.evaluate(), self.expr2.evaluate())
        elif self.arith_op is Enumerated.ArithmeticOperator.MOD_OP:
            value = self.expr1.evaluate() % self.expr2.evaluate()
        else:
            value = self.expr2.evaluate() / self.expr1.evaluate()
        return value


class BooleanExpression:

    def __init__(self, rel_op, expr1, expr2):
        if expr1 is None or expr2 is None:
            raise RuntimeError("Empty expression object called in BooleanExpression")
        self.rel_op = rel_op
        self.expr1 = expr1
        self.expr2 = expr2

    def evaluate(self):
        value = False
        if self.rel_op is Enumerated.RelativeOperator.EQ_OP:
            value = self.expr1.evaluate() == self.expr2.evaluate()
        elif self.rel_op is Enumerated.RelativeOperator.LT_OP:
            value = self.expr1.evaluate() < self.expr2.evaluate()
        elif self.rel_op is Enumerated.RelativeOperator.GT_OP:
            value = self.expr1.evaluate() > self.expr2.evaluate()
        elif self.rel_op is Enumerated.RelativeOperator.LE_OP:
            value = self.expr1.evaluate() <= self.expr2.evaluate()
        elif self.rel_op is Enumerated.RelativeOperator.GE_OP:
            value = self.expr1.evaluate() >= self.expr2.evaluate()
        elif self.rel_op is Enumerated.RelativeOperator.NE_OP:
            value = self.expr1.evaluate() != self.expr2.evaluate()
        return value
