def leerArchivo():
    encontrada = False
    archivo = open("texto1.txt", "r")

    for palabra in archivo:
        if palabra == "victor":
            encontrada = True
        print(palabra)
        print(encontrada)

if __name__ == "__main__":
    print('Leyendo Archivo...')
    leerArchivo()
