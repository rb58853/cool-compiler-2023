from codegen.cool2cil.codegener import CILExpr, CILArithmeticOp, CILMethod, CILAssign, CILProgram, CILVar, IntNode


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

    def assign (self, cil_assign:CILAssign, register:Registers):
        if isinstance(cil_assign.source,CILArithmeticOp):
            arithmetic = self.op(cil_assign.source,register)
            r = register.get_temp(cil_assign.dest)
            line = f'{arithmetic[0]} {r} {arithmetic[1]} {arithmetic[2]}'
            self.mips.add_line(line=line)
        
        if isinstance(cil_assign.source,IntNode):
            r = register.get_temp(cil_assign.dest)
            line = f'move {r} {cil_assign.source}'
            self.mips.add_line(line=line)

    def op(self, cil_add:CILArithmeticOp, register:Registers):
        if cil_add.operation == '+':
            operation = 'add'
        if cil_add.operation == '-':
            operation = 'rest'
        if cil_add.operation == '*':
            operation = 'mul'    
        if cil_add.operation == '/':
            operation = 'div'
                    
        if cil_add.constant: operation +='i'
        left = cil_add.left
        rigth = cil_add.right
        if not isinstance (left, IntNode):left = register.get_temp(left)
        if not isinstance (rigth, IntNode): rigth = register.get_temp(rigth)
        
        return (operation, left, rigth)

                
        

    
