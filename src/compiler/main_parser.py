from parser.cool_parser import CoolLexer, CoolParser
import os
import colorama
from colorama import Fore
colorama.init()

base_dir = os.getcwd()
base_url = os.path.join(base_dir, "tests/parser/")
cases = [case for case in os.listdir(base_url) if case.endswith('.cl')] 
cases.sort()

for i in range(len(cases)):
    case = cases[i]
    case_error = case[:-3] + '_error.txt'
    dir = '/'.join([base_url,case])
    dir_error = '/'.join([base_url,case_error])
    with open(dir, "r") as f:
        code = f.read()
    with open(dir_error, "r") as f:
        error = f.read()

    lexer = CoolLexer()
    parser = CoolParser(lexer = lexer)

    PROGRAM = parser.parse(lexer.tokenize(code))

    e = str(parser.errors[0])
    if e != error:
        print(Fore.RED)
        print(f'\n\n\n######################### CASE {i+1} #############################')
        print('----------------------PARSER ERRORS---------------------------')
        for e in parser.errors:
            print(e)
        print ("\n---------------------EXPECTED ERRORS:-------------------------")
        print(error) 
    else:
        print(Fore.GREEN)
        print(f'CASE {i+1} PASSED')
            