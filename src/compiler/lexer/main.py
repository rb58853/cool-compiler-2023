from compiler.lexer.cool_lexer import CoolLexer
import os
import colorama
from colorama import Fore
colorama.init()

def test_all_cases():
    print("\n___________________LEXER TESTS____________________")
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
            errors = f.read()
            # errors:list[str] = []
            # for line in f:
            #     errors.append(line)
        
        lexer = CoolLexer()
        
        for token in lexer.tokenize(code): pass
        
        equals = True
        # if len(errors) == len(lexer.errors):
        if True:
            full_lines = ""
            for e in lexer.errors:
                full_lines +=f'{e}\n'

            # full_lines = full_lines[:-1]
            if full_lines != errors:
                equals = False

            # for e0,e1 in zip(errors,lexer.errors):
            #     if e0.replace('\n', '').replace(' ','') != str(e1).replace(' ','').replace('\n', ''):
            #         equals = False
            #         break    

            if equals:
                print(Fore.GREEN)
                # print(f'{case} PASSED')
                print(f'\n######################### {case} #############################')
                print(lexer.errors)
            else:
                print(Fore.RED)
                print(f'\n######################### {case} #############################')

                print('----------------------LEXER ERRORS---------------------------')
                print(full_lines)
                print ("\n---------------------EXPECTED ERRORS:-------------------------")
                print(errors)   
        else:
            print(Fore.RED)
            print(f'\n######################### {case} #############################')
            print('----------------------LEXER ERRORS---------------------------')
            print("<empty>")
            print ("\n---------------------LEXER ERRORS:-------------------------")
            for e in errors:
                print(e)        
        