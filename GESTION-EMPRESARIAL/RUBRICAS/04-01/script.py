import sys

'''
    Al programa se le deben pasar 2 argumentos: la ruta del fichero y la palabra a buscar inicialmente
'''
opcionesSi = ["Sí", "sí", "si", "Si", "s", "S", "y", "Y", "yes"]

def validarArgumentos():
    if len(sys.argv) == 3:
        # print("Buscando {} en {}...".format(sys.argv[2], sys.argv[1]))
        return True
    else:
        print("Recuerda que debes pasarme la ruta del fichero y la palabra a buscar!")
        return False

def cargarLista():
    with open(sys.argv[1], 'r') as fichero:
        contenido = fichero.readlines()
    return contenido

def getResultado(lista):
    print("Se han encontrado las siguientes líneas que contienen la palabra objetivo: ")
    print()
    for palabra in lista:
        print("- {}".format(palabra))
    print()
    print("*" * 30)

def getLineas(lista, palabraMagica):
    lineasDiana = []
    for palabra in lista:
        if palabraMagica in palabra:
            # print("Encontrada coincidencia en {}".format(palabra))
            lineasDiana.append(palabra)
    getResultado(lineasDiana)

def main():
    if not validarArgumentos():
        return
    else:
        palabraMagica = sys.argv[2]
    while(True):
        print("Buscando \"{}\"...".format(palabraMagica))
        print("-" * 30)
        lista = cargarLista()
        getLineas(lista, palabraMagica)
        # print(lista)
        respuesta = input("Deseas buscar otra palabra? (y/n): ")
        if not respuesta in opcionesSi:
            print("Hasta la próxima!")
            print("-" * 30)
            return
        else:
            palabraMagica = input("Introduce la nueva palabra a buscar: ")
            print()
    
main()