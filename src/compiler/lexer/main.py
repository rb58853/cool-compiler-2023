from compiler.lexer.cool_lexer import CoolLexer
from env import PASSED
import os
import colorama
from colorama import Fore
colorama.init()

def test_all_cases():
    print("\n___________________LEXER TESTS____________________")
    # base_dir = os.getcwd()
    base_dir = "../"
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
            errors = f.read()
            # errors:list[str] = []
            # for line in f:
            #     errors.append(line)
        
        lexer = CoolLexer()
        
        for token in lexer.tokenize(code): pass
        
        equals = True
        full_lines = ""
        for e in lexer.errors:
            full_lines +=f'{e}\n'

        if full_lines.replace(" ", "").replace("\n", "") != errors.replace(" ", "").replace("\n", ""):
            equals = False
        
        PASSED[1]+=1

        if equals:
            print(Fore.GREEN)
            # print(f'{case} PASSED')
            print(f'\n######################### {case} #############################')
            print(full_lines)
            PASSED[0]+=1
        else:
            print(Fore.RED)
            print(f'\n######################### {case} #############################')
            print('----------------------LEXER ERRORS---------------------------')
            print(full_lines)
            print ("\n---------------------EXPECTED ERRORS:-------------------------")
            print(errors)   
            
    print(Fore.WHITE)
