def leerArchivo():
    numPalabras = 0
    dictionary = {}
    keys = range(numPalabras)
    str = open("texto1.txt", "r")
    sub = "victor"

    for palabra in str:
        print (palabra)


if __name__ == "__main__":
    print('Leyendo Archivo...')
    leerArchivo()
