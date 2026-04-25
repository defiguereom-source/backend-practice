# encapsulation

class Cliente:
    def __init__(self, nombre, apellido):
        self.nombre = nombre
        self.apellido = apellido
        self.__codigo = 23412 # Dato encapsulado
    
    def __cuenta(self): # metodo encapsulado
        print("cuenta de procesamiento")
    
    def getcodigo(self):
        return self.__codigo
    
persona = Cliente("Daniel", "Figuereo")
print(persona._Cliente__codigo)