from compiler.parser.cool_parser import CoolLexer, CoolParser
from compiler.AST.ast import CoolProgram
from compiler.semantic.semantic_ import semantic, Semantic
from compiler.semantic.semantic_visitor import init_classes, init_types, validate_program

import os
import colorama
from colorama import Fore
colorama.init()

base_dir = os.getcwd()
base_url = os.path.join(base_dir, "tests/semantic/")

def test_all_cases(index = 0):
    print("\n___________________SEMANTIC TESTS____________________")

    cases = [case for case in os.listdir(base_url) if case.endswith('.cl')] 
    cases.sort()

    for i in range(index,len(cases)):
        case = cases[i]
        simple_case(case)
        
def simple_case(case):
    semantic.errors = []
    case_error = case[:-3] + '_error.txt'
    dir = '/'.join([base_url,case])
    dir_error = '/'.join([base_url,case_error])
    with open(dir, "r") as f:
        code = f.read()
    with open(dir_error, "r") as f:
        error = f.read()

    lexer = CoolLexer()
    tokens = lexer.tokenize(code)
    if len(lexer.errors)>0:
        raise Exception(lexer.errors)
    
    parser = CoolParser(lexer = lexer)
    program = parser.parse(tokens)
    if len(parser.errors)>0:
        raise Exception(parser.errors)
    
    
    validate_program(program)

    if len(semantic.errors) > 0:
        e = str(semantic.errors[0])
        # if e != error:
        if e.replace(' ','') != error.replace('\n', '').replace(' ',''):
            print(Fore.RED)
            print(f'\n######################### {case} #############################')
            print('----------------------SEMANTIC ERRORS---------------------------')
            for e in semantic.errors:
                print(e)
            print ("\n---------------------EXPECTED ERRORS:-------------------------")
            print(error) 
        else:
            print(Fore.GREEN)
            print(f'{case} ',end='')
            for i in range(0,20-len(case)):
                print('-',end='')
            print(f' | {semantic.errors[0]}')
    else:
        print(Fore.RED)
        print(f'\n\n\n######################### {case} #############################')
        print('----------------------SEMANTIC ERRORS---------------------------')
        print("<empty>")
        print ("\n---------------------EXPECTED ERRORS:-------------------------")
        print(error) 

def get_token(case,token):
    print (Fore.YELLOW)
    dir = '/'.join([base_url,case])
    with open(dir, "r") as f:
        code = f.read()

    lexer = CoolLexer()
    for t in lexer.tokenize(code):
        if t.value == token:
            print(t)


