# Class A Structure
# int x = 0; (4 bytes)
# string y = ""; (1024 bytes)
# B b; (4 bytes, puntero a B)
# C c = new C; (4 bytes, puntero a C)

# Tamaño total: 1036 bytes (4 + 1024 + 4 + 4)

.data
A_vtable: .word A_method  # disptac

.text
A_method:


    jr $ra  
