import os

def create_file(code, filename):
    directorio = "src/compiler/codegen/cil2mips/examples"
    archivo = f'{filename}.s'
    dir = os.path.join(directorio, archivo)

    with open(dir, "w") as f:
        f.write(code)

def to_hex(x):
    hex_num = hex(x)[2:]
    if len(hex_num)>8: raise Exception("En cool lo numeros no pueden tener mas de 32 bits")
    result = ""
    for i in range (8-len(hex_num)):
        result +='0'
    return result+hex_num

def string_to_hex(s):
    s = s.encode("utf-8")
    hexadecimal = s.hex()
    return hexadecimal