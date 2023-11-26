from parser.cool_parser import CoolLexer, CoolParser, CoolProgram
from code_gen.cool_to_cil.code_gener import (
    generate_type_hierarchy, 
    generate_cil_code
)

def main():
    lexer = CoolLexer()
    parser = CoolParser(lexer=lexer)

    # Código COOL de prueba
    code = '''
    class A {
        x: Int;
        y: Int;
        f1(): Int { x + y };
    };
    class C {
        m: Int;
        n: Int;
        f1(): Int { 
            while m < n loop
                m <- m + 1
            pool
        };
    };
    class B inherits A {
        z: String;
        f2(): String { z };
    };
    '''

    tokens = lexer.tokenize(code)
    program: CoolProgram = parser.parse(tokens)

    if len(lexer.errors) > 0:
        raise Exception(f'Lexer error: {lexer.errors[0]}')
    if len(parser.errors) > 0:
        raise Exception(f'Parser error: {parser.errors[0]}')

    cil_hierarchy = generate_type_hierarchy(program)
    print("Jerarquía de tipos CIL:")
    print(cil_hierarchy)

    cil_code = generate_cil_code(program)
    print("Código CIL generado:")
    print(cil_code)

if __name__ == "__main__":
    main()
