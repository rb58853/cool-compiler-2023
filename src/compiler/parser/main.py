from compiler.parser.cool_parser import CoolLexer, CoolParser
from env import PASSED
import os
import colorama
from colorama import Fore
colorama.init()

def test_all_cases():
    print("\n___________________PARSER TESTS____________________")
    # base_dir = os.getcwd()
    base_dir = "../"
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
            errors:list[str] = []
            for line in f:
                errors.append(line)
        
        lexer = CoolLexer()
        parser = CoolParser(lexer=lexer)
        parser.parse(lexer.tokenize(code)) 
        PASSED[1] +=1
        equals = True
        if len(errors) == len(parser.errors):
            for e0,e1 in zip(errors,parser.errors):
                if e0.replace('\n', '').replace(' ','') != str(e1).replace(' ',''):
                    equals = False
                    break    

            if equals:
                PASSED[0] +=1
                print(Fore.GREEN)
                print(f'{case}: {errors[0]}')
            else:
                print(Fore.RED)
                print(f'\n######################### {case} #############################')

                print('----------------------PARSER ERRORS---------------------------')
                for e in parser.errors:
                    print(e)
                print ("\n---------------------EXPECTED ERRORS:-------------------------")
                for e in errors:
                    print(e.replace('\n', ''))   
        else:
            print(Fore.RED)
            print(f'\n######################### {case} #############################')
            print('----------------------LEXER ERRORS---------------------------')
            print("<empty>")
            print ("\n---------------------LEXER ERRORS:-------------------------")
            for e in errors:
                print(e)        
    print(Fore.WHITE)    