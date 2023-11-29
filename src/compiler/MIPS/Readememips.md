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



## ClassInstances.asm:

### Descripción:
Este archivo contiene las funciones para crear instancias de las clases A, B y C. 
Cada función se encarga de reservar la memoria necesaria para su respectiva clase y 
de inicializar los atributos de la instancia.

### Funciones:
- create_(A, B, C)_instance: Reserva memoria para una instancia de la clase (A, B, C) y 
  inicializa sus atributos.


## main.asm:

### Descripción:
Este archivo es el programa principal que demuestra la creación y uso de instancias de las clases A, B y C. 

### Detalles:
- El programa comienza creando instancias de las clases A, B y C utilizando las funciones definidas en ClassInstances.asm.
- Se guarda la dirección de cada instancia en registros separados para su posterior uso.
- Se muestra cómo llamar a los métodos de las clases B y C como ejemplos de interacción con las instancias.


































  Basado en tu conversación con Raul, parece que el enfoque ahora está en la implementación de clases y la gestión de instancias en MIPS, específicamente en cómo representar las instancias de clases en memoria, manejar los atributos y los métodos, y cómo acceder a estas instancias una vez que se han creado. Aquí te propongo un plan de acción detallado:

### Plan de Acción para Implementar Clases en MIPS

#### Paso 1: Diseñar la Estructura de una Instancia de Clase en Memoria

1. **Definir la Estructura de una Clase**: Determina qué atributos necesita cada clase y cuánto espacio ocuparán en memoria (por ejemplo, 4 bytes para enteros, 4 bytes para referencias).

2. **Calcular el Tamaño Total de la Instancia**: Calcula el tamaño total necesario para almacenar todos los atributos de una clase.

#### Paso 2: Crear Instancias de Clases en MIPS

1. **Reservar Memoria para la Instancia**: Escribe código MIPS para reservar memoria en el heap para una nueva instancia de clase, basándote en el tamaño calculado.

2. **Inicializar Atributos**: Implementa la lógica para inicializar los atributos de la instancia.

#### Paso 3: Implementar Acceso y Modificación de Atributos

1. **Acceder a Atributos**: Escribe código MIPS para leer y escribir en los atributos de una instancia, utilizando su dirección base y los desplazamientos correspondientes.

#### Paso 4: Trabajar con Métodos y la Tabla de Métodos

1. **Implementar Métodos como Funciones en MIPS**: Escribe los métodos de tus clases como funciones separadas en MIPS.

2. **Usar un Puntero a la Tabla de Métodos Virtuales**: Si usas polimorfismo, necesitarás una tabla de métodos virtuales para cada clase.

#### Paso 5: Manejar Múltiples Instancias y Referencias

1. **Almacenar y Recuperar Direcciones de Instancias**: Aprende a guardar las direcciones de las instancias en registros o en memoria (heap/stack) para poder acceder a ellas más tarde.

2. **Referencias a Instancias**: Implementa cómo las instancias pueden referenciar otras instancias (por ejemplo, como atributos).

#### Paso 6: Integrar con tu Proyecto COOL/CIL

1. **Conectar con AST y Generador de Código CIL**: Considera cómo esta implementación en MIPS se relaciona con tu AST de COOL y el código generado en CIL. Por ejemplo, cómo se traducirá un objeto de COOL en una instancia de clase en MIPS.

#### Paso 7: Pruebas y Depuración

1. **Pruebas Unitarias para Cada Funcionalidad**: Realiza pruebas para cada aspecto de tu implementación en MIPS, asegurándote de que cada parte funcione como se espera antes de integrarla en el sistema más grande.

2. **Depuración**: Usa un simulador de MIPS para depurar tu código, prestando especial atención a la gestión de memoria y a cómo se accede y se modifica.

#### Paso 8: Documentación

1. **Documenta tu Proceso y Código**: Asegúrate de documentar cómo funciona cada parte de tu sistema y cómo se relaciona con el resto de tu proyecto.

### Consideraciones Finales

- **Entender el Modelo de Memoria**: Es crucial entender cómo MIPS gestiona la memoria (heap y stack) para implementar correctamente este sistema.
- **Ensamblador vs. Alto Nivel**: Recuerda que estás trabajando a un nivel mucho más bajo que en lenguajes de alto nivel, por lo que la gestión de memoria y las referencias son más explícitas y manuales.

Si necesitas ejemplos específicos de código MIPS o tienes preguntas sobre algún paso en particular, no dudes en pedirlo.
