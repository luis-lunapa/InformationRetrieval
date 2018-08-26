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


documentsDictionary = { "1.txt" :1,
                        "2.txt" :2,
                        "3.txt" :3
                        }

    #Meter todas las palabras en un arreglo
    #Eliminar duplicados en un array.
    #

#Abrir documentos


def leerArchivos():
    aBuscar = "atom"
    diccionarioSinRepetidos = {}
    diccionarioConPosting = {} #Que la llave sea su palabra y el value la lista ligada de index donde aàrece la palabra.
    for documento in documentsDictionary:
        dictionary = {}
        palabrasTokenizadas = []
        with open(documento, "r") as archivo:
            lineas = [linea.split() for linea in archivo]


        for linea in lineas:
            palabrasTokenizadas += linea
        #print(palabrasTokenizadas)

        for palabra in palabrasTokenizadas:
            if palabra in palabrasTokenizadas:
                dictionary[palabra] = [documentsDictionary[documento]]
        #print(dictionary)

        #GENERAR POSTING LIST AQUI DE TODAS LAS PALABRAS EN EL DICCIONARIO.
        #Que quede asi {'atom': [[1] => [3]], 'brutus': [[1] => [2] => [3]]}


        for palabra, index in dictionary.items():
            if palabra not in diccionarioSinRepetidos.keys():
                diccionarioSinRepetidos[palabra] = index
    #print(diccionarioSinRepetidos)

    #for palabra, index in diccionarioSinRepetidos.items():
    #    print(palabra)



if __name__ == "__main__":
    print('Leyendo Archivo...')
    leerArchivos()
