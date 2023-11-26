from lexer.cool_lexer import CoolLexer
import os
import colorama
from colorama import Fore
colorama.init()

def test_all_cases():
    base_dir = os.getcwd()
    base_url = os.path.join(base_dir, "tests/lexer/")
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
        
        for token in lexer.tokenize(code):
            pass

        e = lexer.errors
        
        if len(e)>0:
            if str(e[0]) == error:
                print(Fore.GREEN)
                print(f'{case} PASSED')
            else:
                print(Fore.RED)
                print(f'\n\n\n######################### {case} #############################')

                print('----------------------LEXER ERRORS---------------------------')
                for e in lexer.errors:
                    print(e)
                print ("\n---------------------EXPECTED ERRORS:-------------------------")
                print(error)        
        else:
            print(Fore.RED)
            print(f'\n\n######################### {case} #############################')
            print('----------------------LEXER ERRORS---------------------------')
            print("<empty>")
            print ("\n---------------------LEXER ERRORS:-------------------------")
            print(error)        
        