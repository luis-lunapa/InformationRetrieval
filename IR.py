def leerArchivo():
    salida = []
    with open("documento1.txt", "r") as archivo:
        lineas = [linea.split() for linea in archivo]

    for linea in lineas:
        salida += linea

    #print(salida)

    dictionary = {}
    numPalabras = (len(salida))
    keys = range(numPalabras)
    values = salida

    for indice in keys:
        dictionary[indice] = values[indice]
    print(dictionary)

if __name__ == "__main__":
    print('Leyendo Archivo...')
    leerArchivo()
