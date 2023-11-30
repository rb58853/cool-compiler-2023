from codegen.cool2cil.codegener import CILExpr, CILArithmeticOp, CILMethod, CILAssign, CILProgram, CILVar, IntNode, CILCommet, USE_i
from codegen.cil2mips.utils import to_hex

class Registers():
    def __init__(self, cil_method:CILMethod) -> None:
        self.base_id = {'t':0}
        for line in cil_method.body:
            if isinstance(line, CILAssign) and not isinstance(line.dest, CILVar):
                self.base_id['t'] = int(line.dest[5:])
                break
            
    def get_temp(self,expr_id:str):
        id = int(expr_id[5:])
        return f'$t{id-self.base_id["t"]}'
     
class MIPS:
    def __init__(self) -> None:
        self.body:list[str] = []
    
    def add_line(self, line):
        self.body.append(line)
    
    def code(self) -> str:
        result = ''
        for line in self.body:
            result+= f'{line}\n'        
        return result
    
class CIL2MIPS():
    '''Recive un CILProgram y un MIPS, crea un codigo en mips con la informacion de CILProgram '''
    def __init__(self, cil, mips) -> None:
        self.mips:MIPS = mips
        self.generate_code(cil)

    def generate_code(self,cil:CILProgram):
        for method in cil.methods:
            self.generate_from_method(method)

    def generate_from_method(self, cil_method:CILMethod):
        register = Registers(cil_method)
        for expr in cil_method.body:
            self.generate_line_from_expr(expr, register)
    
    def generate_line_from_expr(self, cil_expr:CILExpr, register:Registers):
        if isinstance(cil_expr, CILAssign):
            self.assign(cil_expr,register)
        
        if isinstance(cil_expr, CILCommet):
            self.mips.add_line(str(cil_expr))

    def assign (self, cil_assign:CILAssign, register:Registers):
        if cil_assign.is_temp:
            if isinstance(cil_assign.source,CILArithmeticOp):
                lines = self.op(cil_assign.source,register, cil_assign.dest)
                for line in lines:
                    self.mips.add_line(line=line)

            if isinstance(cil_assign.source,IntNode):
                r = register.get_temp(cil_assign.dest)
                if not USE_i:
                    hex_num = to_hex(cil_assign.source.value)
                    self.mips.add_line(f'lui {r} {hex_num[:6]}')
                    self.mips.add_line(f'ori {r} 0x{hex_num[4:]}')
                else:
                    self.mips.add_line(f'li {r} {cil_assign.source.value}')
        else:
            #Este es el caso donde se le asigna valor a una variable
            pass        

    def op(self, cil_add:CILArithmeticOp, register:Registers, dest):
        r = register.get_temp(dest)
        left = cil_add.left
        rigth = cil_add.right
        if not isinstance (left, IntNode):left = register.get_temp(left)
        if not isinstance (rigth, IntNode): rigth = register.get_temp(rigth)
        
        if cil_add.operation == '+':
            operation = 'add'
        if cil_add.operation == '-':
            operation = 'sub'
        
        if cil_add.operation == '*' or cil_add.operation == '/':   
            if cil_add.operation == '*':
                operation = 'mul'    
            if cil_add.operation == '/':
                operation = 'div'

            return [f'{operation} {left} {rigth}',f'mflo {r}']                    
        
        if cil_add.constant: operation +='i'
        return [f'{operation} {r} {left} {rigth}']