class node:
    def __init__(self):
        self.data = None # contains the data
        self.next = None # contains the reference to the next node


class linked_list:
    def __init__(self):
        self.current_node = None

    def add_node(self, data):
        new_node = node()       # create a new node
        new_node.data = data
        new_node.next = self.current_node # link the new node to the 'previous' node.
        self.current_node = new_node #  set the current node to the new one.

    def list_print(self):
        node = self.current_node            # cant point to ll!
        while node:
            print (node.data)
            node = node.next



linkedList = linked_list()


documentsDictionary = { "texto.txt" :0,
                        "texto1.txt" :1,
                        "texto2.txt" :2
                        }


def leerArchivo():
    dictionary = {}
    for documento in documentsDictionary:                 #Iteramos sobre cada documento en el documentsDictionary.
        palabrasSinToken = []                             #Creamos arreglo de palabras sin tokenizar.
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
            #print(dictionary)


if __name__ == "__main__":
    print('Leyendo Archivo...')
    leerArchivo()
