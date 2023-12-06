print('\
\n\ttype_name:\
\n\tlw $t0, 0($sp)\
\n\tlw $t1, 0($t0)\
\n\tmove $a0, $t1\
\n\tjr $ra\nout_int:\
\n\tlw $a0, 4($sp)\n\tli $v0, 1\n\tsyscall\n\tlw $a0, 0($sp)\n\tjr $ra\n')