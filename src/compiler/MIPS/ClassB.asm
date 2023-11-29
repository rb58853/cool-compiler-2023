# Class B Structure
# int x = 1; (4 bytes)
# C c; (4 bytes, puntero a C)

# Tamaño total: 8 bytes
.data
B_vtable: .word B_c_f  # Direcc del mtdo de la clase B

.text
B_c_f:
    # Implementación del método c_f de la clase B
    # Retorna el puntero al atributo c
    lw $v0, 4($a0)  # Carga la dirección de c (sabemos que a0 tiene la direcc de la instancia de B)
    jr $ra          # Retorna a la llamada



