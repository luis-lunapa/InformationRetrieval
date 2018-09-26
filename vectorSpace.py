def leerArchivo():
        palabrasSinToken = []
        with open("1.txt", "r") as archivo:
            lineas = [linea.split() for linea in archivo]

            print(lineas)

            #for linea in lineas:
            #    palabrasSinToken += linea
            #print(palabrasSinToken)

if __name__ == "__main__":
    leerArchivo()
