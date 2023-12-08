from compiler.codegen.cil2mips.utils import to_hex
import compiler.AST.environment as env
from compiler.codegen.cil2mips.templates import methods as templates
from compiler.codegen.cil2mips.templates import init_bases, StartMethod, uninherits_methods, contants
from compiler.codegen.cool2cil.codegener import CILExpr, CILArithmeticOp, CILMethod, CILAssign, CILProgram, CILVar, IntNode, CILCommet, USE_i, StoreLocal, CILCallLocal, ReserveSTACK, FreeStack, CILReturn, Label, CILLogicalOP, CILIf, GOTO, CallMethod, FromA0, CloseProgram, MipsLine, ReserveHeap, StoreInDir, LoadFromDir, Data, StoreString, CILUminus, CILNot, LoadString, NameLabel, CILogicalString, CallFromDir, TYPES, CILVoid, CILIsVoid

class Registers():
    def __init__(self, cil_method:CILMethod) -> None:
        pass
        # self.base_id = {'t':0}
        # for line in cil_method.body:
        #     if isinstance(line, CILAssign) and not isinstance(line.dest, CILVar):
        #         self.base_id['t'] = int(line.dest[5:])
        #         break
            
    def get_temp(self,expr_id:str):
        if expr_id == 'a0':
            return '$a0'
        if expr_id[0] == '$':
            return expr_id
        id = int(expr_id[5:])
        return f'$t{id}'
        # return f'$t{id-self.base_id["t"]}'
     
class MIPS:
    def __init__(self) -> None:
        self.body:list[str] = []
    
    def add_line(self, line, tab =True):
        #move $xy, $xy
        if not(line[:4] == 'move' and line[6:8] == line[11:13]):
            if tab:
                self.body.append(f'\t{line}')
            else:
                self.body.append(line)
    
    def code(self) -> str:
        result = '.data\n'
        for line in Data.body:
            result+= f'{line}\n'

        result += '.text\n'
        for line in self.body:
            result+= f'{line}\n'        

        for base in init_bases:
            for line in base.code():
                result+= f'{line}\n'                

        for type in TYPES.keys():
            for meth in templates:
                if meth.name not in TYPES[type].redefined_base_methods and meth.name in TYPES[type].methods:
                    result +=f'{type}_'
                    for line in meth.code():
                        result+= f'{line}\n'
        
        for meth in contants:
            #Estos son metodos de las clases constantes
            for line in meth.code():
                result+= f'{line}\n'

        for meth in uninherits_methods:
            #Estos son metodos que no se pueden heredar, luego siempre tienen el mismo nombre y etiqueta
            for line in meth.code():
                result+= f'{line}\n'
        
        return result
    
class CIL2MIPS():
    '''Recive un CILProgram y un MIPS, crea un codigo en mips con la informacion de CILProgram '''
    def __init__(self, cil, mips) -> None:
        self.mips:MIPS = mips
        self.generate_code(cil)

    def generate_code(self,cil:CILProgram):
        for line in StartMethod.code():
            self.mips.add_line(line, False)

        for method in cil.methods:
            self.generate_from_method(method)

    def generate_from_method(self, cil_method:CILMethod):
        register = Registers(cil_method)
        for expr in cil_method.body:
            self.generate_line_from_expr(expr, register)
    
    def generate_line_from_expr(self, cil_expr:CILExpr, register:Registers):
        if isinstance(cil_expr, CILReturn):
            self._return(cil_expr, register)
        
        if isinstance(cil_expr, StoreLocal):
            self.store_stack(cil_expr,register)
        
        if isinstance(cil_expr, ReserveSTACK):
            self.reserve_stack(cil_expr)

        if isinstance(cil_expr, FreeStack):
            self.free_stack(cil_expr)

        if isinstance(cil_expr, CILAssign):
            self.assign(cil_expr,register)
        
        if isinstance(cil_expr, CILCommet):
            self.mips.add_line(str(cil_expr))

        if isinstance(cil_expr, Label):
            self.mips.add_line(str(cil_expr),False)    
        
        if isinstance(cil_expr, CILIf):
            self._if(cil_expr, register)
        
        if isinstance(cil_expr, GOTO):
            self.jump(cil_expr)

        if isinstance(cil_expr, CallMethod):
            self.call_meth(cil_expr)

        if isinstance(cil_expr, FromA0):
            self.mips.add_line(f'a0')

        if isinstance(cil_expr, MipsLine):
            self.mips.add_line(cil_expr.line)    

        if isinstance(cil_expr, CloseProgram):
            self.close(cil_expr, register)
        
        if isinstance(cil_expr, ReserveHeap):
            lines = cil_expr.to_mips()
            for line in lines:
                self.mips.add_line(line)

        if isinstance(cil_expr, StoreInDir):    
            lines = cil_expr.to_mips()
            for line in lines:
                self.mips.add_line(line)

        if isinstance(cil_expr, LoadFromDir):
            lines = cil_expr.to_mips()
            for line in lines:
                self.mips.add_line(line)

        if isinstance(cil_expr, StoreString):
            lines = cil_expr.to_mips()
            for line in lines:
                self.mips.add_line(line)
        
        if isinstance(cil_expr, CILUminus):
            lines = cil_expr.to_mips()
            for line in lines:
                self.mips.add_line(line)        
        
        if isinstance(cil_expr, CILNot):
            lines = cil_expr.to_mips()
            for line in lines:
                self.mips.add_line(line)        
        
        if isinstance(cil_expr, LoadString):
            lines = cil_expr.to_mips()
            for line in lines:
                self.mips.add_line(line) 
        if isinstance(cil_expr, CILogicalString):
            lines = cil_expr.to_mips()
            for line in lines:
                self.mips.add_line(line) 
                        
        if isinstance(cil_expr, CallFromDir):
            lines = cil_expr.to_mips()
            for line in lines:
                self.mips.add_line(line)
        
        if isinstance(cil_expr, CILVoid):
            lines = cil_expr.to_mips()
            for line in lines:
                self.mips.add_line(line)
                
        if isinstance(cil_expr, CILIsVoid):
            lines = cil_expr.to_mips()
            for line in lines:
                self.mips.add_line(line)

    def close(self, close_, register):        
            self.mips.add_line('li $v0, 10')
            self.mips.add_line('syscall')
    
    def call_meth(self, meth:CallMethod):
        self.mips.add_line(f'jal {meth.label}')

    def jump (self, goto:GOTO):
        self.mips.add_line(f'j {goto.label}')

    def _return(self, ret:CILReturn, register:Registers):
        result = ret.ret
        if result =='':
            pass
        self.mips.add_line(f'move $a0, {register.get_temp(result)}')
        self.mips.add_line('jr $ra')    

    def free_stack(self, free_s:FreeStack):
        space = free_s.space
        self.mips.add_line(f'addi $sp, $sp, {space}')

    def reserve_stack(self, res_stack:ReserveSTACK):
        space = res_stack.space
        self.mips.add_line(f'addi $sp, $sp, -{space}')
    
    def store_stack(self, s_local:StoreLocal, register:Registers):
        pos = s_local.pos
        self.mips.add_line(f'sw {s_local.register}, {pos}($sp)')
    
    def load_stack(self, c_local:CILCallLocal, register):
        pos = c_local.pos
        return f'lw {register}, {pos}($sp)'

    def _if(self, cil_if:CILIf, register: Registers):
        condition = cil_if.condition
        label = cil_if.else_label
        op = 'beq' # saltar al 'label' si condition == 0
        # if cil_if._while:
        #     op = 'bne' # saltar al 'label' si condition != 0
        if condition =='':
            pass
        self.mips.add_line(f'{op} {register.get_temp(condition)}, $zero, {label}') 

    def assign (self, cil_assign:CILAssign, register:Registers):
        if cil_assign.is_temp:
            if isinstance(cil_assign.source,CILArithmeticOp):
                lines = self.op(cil_assign.source,register, cil_assign.dest)
                for line in lines:
                    self.mips.add_line(line=line)

            if isinstance(cil_assign.source,IntNode):
                if cil_assign.dest =='':
                    pass
                r = register.get_temp(cil_assign.dest)
                if not USE_i:
                    hex_num = to_hex(cil_assign.source.value)
                    self.mips.add_line(f'lui {r} {hex_num[:6]}')
                    self.mips.add_line(f'ori {r} 0x{hex_num[4:]}')
                else:
                    self.mips.add_line(f'li {r} {cil_assign.source.value}')
            
            if isinstance(cil_assign.source,CILCallLocal):
                if cil_assign.dest =='':
                    pass
                r = register.get_temp(cil_assign.dest)
                self.mips.add_line(self.load_stack(cil_assign.source,r))
            
            if isinstance(cil_assign.source, CILLogicalOP):
                lines = self.logicar_op(cil_assign.source,register, cil_assign.dest)
                for line in lines:
                    self.mips.add_line(line=line)

            if isinstance(cil_assign.source, str):
                if cil_assign.dest =='':
                    pass
                #esto quiere decir que se le paso un string de pythona la asignacion, lo que implica que es un movmiento de un registro a un temporal
                self.mips.add_line(f'move {register.get_temp(cil_assign.dest)}, {register.get_temp(cil_assign.source)}')
        else:
            #Este es el caso donde se le asigna valor a una variable
            pass        

    def logicar_op(self, cil_logicar:CILLogicalOP, register:Registers, dest):
        if dest =='' or cil_logicar.left =='' or cil_logicar.right =='':
            pass
        r = register.get_temp(dest)
        left = register.get_temp(cil_logicar.left)
        rigth = register.get_temp(cil_logicar.right)
        
        if cil_logicar.operation == '<':
            return [f'slt {r}, {left}, {rigth}'] # $r = 1 si $lefth < right, de lo contrario r = 0
        if cil_logicar.operation == '<=':
            return [f'slt {r}, {rigth}, {left}', # $r = 1 si $rigth < lefth, r = 0 implica left <= rigth
                    f'li {rigth}, 1', 
                    f'slt {r}, {r}, {rigth}'] #si r < 1 entonces es 1, sino, es cero. Se usa un mismo registro que no necesito ya, luego esta libre. 
        if cil_logicar.operation == '=':
            label = NameLabel("compare").get()
            label_end = NameLabel("end_compare").get()
            return [
                    f'beq {left}, {rigth}, {label}', #si son iguales salta a la etiqueta de son iguales
                    f'addi {r}, $zero, 0', #si no son iguales se guarda cero, y posteriroment se salta al final de la comparacion
                    f'j {label_end}', #salto al final
                    f'{label}:', #etiqueta son iguales
                    f'addi {r}, $zero, 1', #se guarda 1 en el registro destino
                    f'{label_end}:' #etiqueta final
                ] 

    def op(self, cil_add:CILArithmeticOp, register:Registers, dest):
        r = register.get_temp(dest)
        left = cil_add.left
        rigth = cil_add.right

        if dest == '' or left == '' or rigth == '':
            pass
        
        if not isinstance (left, IntNode):left = register.get_temp(left)
        if not isinstance (rigth, IntNode): rigth = register.get_temp(rigth)
        
        if cil_add.operation == '+':
            operation = 'add'
        if cil_add.operation == '-':
            operation = 'sub'
        
        if cil_add.operation == '*':
            operation = 'mul'
        
        if  cil_add.operation == '/':# or cil_add.operation == '*':   
            # if cil_add.operation == '*':
            #     operation = 'mul'    
            if cil_add.operation == '/':
                operation = 'div'

            return [f'{operation} {left}, {rigth}',f'mflo {r}']                    
        
        if cil_add.constant:
            if operation == 'sub':
                rigth.value = -rigth.value
                return [f'addi {r}, {left}, {rigth}']
            operation +='i'
        return [f'{operation} {r}, {left}, {rigth}']
    