# Creadndo estructura base

## ClassA.asm: (Falta definir)

## Descripción: 
- Archivo define la estructura y los métodos de la clase A.
- La clase A tiene un entero, un string y referencias a las clases B y C.


## Declaraciones de la tabla de métodos virtuales y los métodos de la clase A:
- A_vtable: Tabla de métodos virtuales que contiene direcciones de los métodos de la clase A.
- A_method: Un ejemplo de método para la clase A que manipula sus atributos.



## ClassB.asm: (Falta)

### Descripción: 
Archivo q define la estructura y los métodos de la clase B.
La clase B tiene un entero y una referencia a la clase C.

### Declaraciones:
- B_vtable: Tabla de métodos virtuales que contiene direcciones de los métodos de la clase B.
- B_c_f: Método que retorna el puntero al atributo c de la clase B.


## ClassC.asm:

### Descripción: 
- Archivo define la estructura y los métodos de la clase C.
- La clase C tiene un atributo string.

### Declaraciones:
- C_vtable: Tabla de métodos virtuales que contiene direcciones de los métodos de la clase C.
- C_print_c: Método que retorna la dirección del string s de la clase C.
- C_string: Cadena de caracteres que representa el valor por defecto del atributo s.
