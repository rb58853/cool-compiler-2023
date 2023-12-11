# Incluya aquí las instrucciones necesarias para ejecutar su compilador

INPUT_FILE=$1
OUTPUT_FILE=${INPUT_FILE:0: -2}mips

# Si su compilador no lo hace ya, aquí puede imprimir la información de contacto
echo "COOL-COMPILER 1.0"        # TODO: Recuerde cambiar estas
echo "Copyright (c) 2023: Raúl Beltrán, Víctor Amador"    # TODO: líneas a los valores correctos

# Llamar al compilador
python3 cool $INPUT_FILE $OUTPUT_FILE
