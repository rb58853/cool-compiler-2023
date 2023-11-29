# Class C Structure
# string s = "c_string"; (1024 bytes)

# Tamaño total: 1024 bytes
.data
C_vtable: .word C_print_c  # Direcc del mtdo de la clase C
C_string: .asciiz "c_string"  # Cadena por defecto para el atributo s

.text
C_print_c:
    # método print_c de la clase C
    # Retorna la dirección del string s
    la $v0, C_string  # Carga la dirección de la cadena "c_string"
    jr $ra            # llamada


