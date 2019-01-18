import Exceptions
import Memory
from Parser import Parser
from os import path


def get_file_path():
    base_path = path.dirname(__file__)
    file_path = path.abspath(path.join(base_path, "..", "test.txt"))
    return file_path


def main():

    file_path = get_file_path()
    try:
        p = Parser(file_path)
        program = p.parse()
        program.evaluate()
        Memory.display_memory()
    except FileNotFoundError:
        print("File Not Found Error")
    except Exceptions.LexicalError:
        print("Lexical Error")
    except Exceptions.ParserError:
        print("Parser Error")
    except MemoryError:
        print("Memory Error")


main()


