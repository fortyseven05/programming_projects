from enum import Enum


class ArithmeticOperator(Enum):
    ADD_OP = 1
    SUB_OP = 2
    MUL_OP = 3
    DIV_OP = 4
    MOD_OP = 5
    REV_DIV_OP = 6
    EXP_OP = 7


class RelativeOperator(Enum):
    LE_OP = 1
    LT_OP = 2
    GE_OP = 3
    GT_OP = 4
    EQ_OP = 5
    NE_OP = 6


class TokenType(Enum):
    ASSIGN_TOK = 1
    ID_TOK = 2
    LE_TOK = 3
    LT_TOK = 4
    GE_TOK = 5
    GT_TOK = 6
    EQ_TOK = 7
    NE_TOK = 8
    ADD_TOK = 9
    SUB_TOK = 10
    MUL_TOK = 11
    DIV_TOK = 12
    MOD_TOK = 13
    REV_DIV_TOK = 14
    EXP_TOK = 15
    OPEN_PAREN_TOK = 16
    CLOSE_PAREN_TOK = 17
    ITER_TOK = 18
    CONST_TOK = 19
    EOS_TOK = 20
    FUNC_KW_TOK = 21
    PRINT_KW_TOK = 22
    END_KW_TOK = 23
    IF_KW_TOK = 24
    ELSE_KW_TOK = 25
    WHILE_KW_TOK = 26
    FOR_KW_TOK = 27
