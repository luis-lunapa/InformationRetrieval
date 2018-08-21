documentsDictionary = { "texto.txt" :0,
                        "texto1.txt" :1,
                        "texto2.txt" :2
                        }

def leerArchivo():
    dictionary = {}

    for documento in documentsDictionary:
        palabrasSinToken = []
        with open(documento, "r") as archivo:
            lineas = [linea.split() for linea in archivo]

            for linea in lineas:
                palabrasSinToken += linea
            #print(palabrasSinToken)

            for palabra in palabrasSinToken:
                if palabra in dictionary:
                    if not (documentsDictionary[documento] in dictionary[palabra]):
                        dictionary[palabra] += [documentsDictionary[documento]]
                else:
                    dictionary[palabra] = [documentsDictionary[documento]]
    print(dictionary)

    aBuscar = input("Escribe la palabra a buscar: ")
    encontrada = False

    print(dictionary.get(aBuscar))


if __name__ == "__main__":
    print('Leyendo Archivo...')
    leerArchivo()
