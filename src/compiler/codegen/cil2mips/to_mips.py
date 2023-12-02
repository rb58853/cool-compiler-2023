from compiler.codegen.cil2mips.utils import to_hex
import compiler.AST.environment as env
from compiler.codegen.cool2cil.codegener import CILExpr, CILArithmeticOp, CILMethod, CILAssign, CILProgram, CILVar, IntNode, CILCommet, USE_i, StoreLocal, CILCallLocal, ReserveSTACK, FreeStack, CILReturn, Label, CILLogicalOP, CILIf, GOTO, CallMethod, FromA0, CloseProgram, MipsLine, ReserveHeap, StoreInDir, LoadFromDir

def write_in_heap(bytes_dir, space, free_register_0 = '$s0',free_register_1 = '$s1', temp_register = '$t9'):
    lines= [
        f'li $a0, {space}', # Número de bytes para asignar
        f'li $v0, 9', # Código de la llamada al sistema para sbrk
        f'syscall', # Asignar memoria en el heap
        f'move {free_register_0}, $v0', # Guardar la dirección de la memoria asignada en un registro, desde aqui se empieza a escribir en el heap 
        f'la {free_register_0}, {bytes_dir}', # Cargar en un registro la dirección de los bytes que se quieren escribir 
        'copy:',
        f'lb {temp_register},({free_register_0})', # Leer un byte desde la dirección de origen
        f'sb {temp_register},({free_register_1})', # Almacenarlo en la dirección de destino
        f'addiu {free_register_0},{free_register_0},1',
        f'addiu {free_register_1},{free_register_1},1',
        f'bne {temp_register},$zero,copy' # Repetir hasta que el terminador NUL haya sido copiado'
    ]
    return lines

def load_from_heap(heap_dir, register, space):
    lines = [

    ]
    return lines

class Registers():
    def __init__(self, cil_method:CILMethod) -> None:
        self.base_id = {'t':0}
        for line in cil_method.body:
            if isinstance(line, CILAssign) and not isinstance(line.dest, CILVar):
                self.base_id['t'] = int(line.dest[5:])
                break
            
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
        self.mips.add_line('.globl main')
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
            self.mips.add_line(str(cil_expr))    
        
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

    def close(self, close_, register):        
            result = close_.ret
            self.mips.add_line(f'move $a0, {register.get_temp(result)}')
            self.mips.add_line('li $v0, 1')
            self.mips.add_line('syscall')
            self.mips.add_line('li $v0, 10')
            self.mips.add_line('syscall')
    
    def call_meth(self, meth:CallMethod):
        self.mips.add_line(f'jal {meth.label}')

    def jump (self, goto:GOTO):
        self.mips.add_line(f'j {goto.label}')

    def _return(self, ret:CILReturn, register:Registers):
        result = ret.ret
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
        self.mips.add_line(f'{op} {register.get_temp(condition)}, $zero, {label}') 

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
            
            if isinstance(cil_assign.source,CILCallLocal):
                r = register.get_temp(cil_assign.dest)
                self.mips.add_line(self.load_stack(cil_assign.source,r))
            
            if isinstance(cil_assign.source, CILLogicalOP):
                lines = self.logicar_op(cil_assign.source,register, cil_assign.dest)
                for line in lines:
                    self.mips.add_line(line=line)
            if isinstance(cil_assign.source, str):
                #esto quiere decir que se le paso un string de pythona la asignacion, lo que implica que es un movmiento de un registro a un temporal
                self.mips.add_line(f'move {register.get_temp(cil_assign.dest)} {register.get_temp(cil_assign.source)}')
        else:
            #Este es el caso donde se le asigna valor a una variable
            pass        

    def logicar_op(self, cil_logicar:CILLogicalOP, register:Registers, dest):
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
            pass
        
        #TODO falta el caso = compara bit a bit los string. Lo demas es por direcciones.

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

            return [f'{operation} {left}, {rigth}',f'mflo {r}']                    
        
        if cil_add.constant:
            if operation == 'sub':
                rigth.value = -rigth.value
                return [f'addi {r}, {left}, {rigth}']
            operation +='i'
        return [f'{operation} {r}, {left}, {rigth}']
    