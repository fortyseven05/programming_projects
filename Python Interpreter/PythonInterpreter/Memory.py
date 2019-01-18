import collections
import Exceptions

memory_dict = {}


def store(ch, value):
    memory_dict[ch] = value


def fetch(ch):
    if ch in memory_dict:
        return memory_dict[ch]
    else:
        raise Exceptions.MemoryError(ch)


def display_memory():
    ordered_mem = collections.OrderedDict(sorted(memory_dict.items(), key=lambda t: t[0]))
    for key, value in ordered_mem.items():
        print(key, ': ', value)
