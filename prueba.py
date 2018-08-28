# Creamos la clase node
class node:
    def __init__(self, data = None, next = None):
        self.data = data
        self.next = next

# Creamos la clase linked_list
class linked_list:
    def __init__(self):
        self.head = None

    # Método para agregar elementos en el frente de la linked list
    def add_at_front(self, data):
        self.head = node(data=data, next=self.head)

    # Método para verificar si la estructura de datos esta vacia
    def is_empty(self):
        return self.head == None

    # Método para agregar elementos al final de la linked list
    def agregarNodo(self, data):
        if not self.head:
            self.head = node(data=data)
            return
        curr = self.head
        while curr.next:
            curr = curr.next
        curr.next = node(data=data)

    # Método para obtener el ultimo nodo
    def get_last_node(self):
        temp = self.head
        while(temp.next is not None):
            temp = temp.next
        return temp.data

    # Método para imprimir la lista de nodos
    def imprimirLinkedList( self ):
        node = self.head
        while node != None:
            print(node.data, end =" => ")
            node = node.next



linkedList = linked_list()


documentsDictionary = { "documento1.txt" :1,
                        "documento2.txt" :2,
                        "documento3.txt" :3
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
                ll = linked_list()
                if palabra in dictionary:
                    if not (documentsDictionary[documento] in dictionary[palabra]):
                        dictionary[palabra] += [(documentsDictionary[documento])]
                else:
                        dictionary[palabra] = [(documentsDictionary[documento])]

    for palabra, index in dictionary.items():
        print(palabra,'=>', index)
    return(dictionary)

def queryAND(diccionario, palabra1, palabra2):
    arregloPalabras = [palabra1, palabra2]
    for elemento in arregloPalabras:
        if elemento in diccionario:
            print(elemento, '=>',diccionario[elemento])

def queryBrutus(diccionario):
    postingBrutus = None
    for elemento in diccionario:
        if elemento == "soon":
            postingBrutus = (diccionario[elemento])
    print(postingBrutus)
    return(postingBrutus)

def queryAtom(diccionario):
    postingAtom = None
    for elemento in diccionario:
        if elemento == "key":
            postingAtom = (diccionario[elemento])
    print(postingAtom)
    return(postingAtom)


def intersect(post1, post2):
    answer = []
    for elemento in post1:
        if elemento in post2:
            answer.append(elemento)
    print(answer)


if __name__ == "__main__":
    print('Leyendo Archivo...')
    diccionario = leerArchivo()
    postingBrutus = queryBrutus(diccionario)
    postingAtom = queryAtom(diccionario)
    intersect(postingBrutus, postingAtom)
    #queryAND(diccionario, "sillon", "brutus")
