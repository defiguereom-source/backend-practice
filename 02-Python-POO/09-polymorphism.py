# polymorphism: capacidad de un objeto de tomar muchas formas

class Animal:
    def __init__(self, nombre):
        self.nombre = nombre
    
    def tipo(self):
        pass
    
class Perro(Animal):
    def tipo(self):
        return "Mamifero"
    
class Mariposa(Animal):
    def tipo(self):
        return "Invertebrado"
    
animal_uno = Perro("Firulais")
animal_dos = Mariposa("Mariposita")

print(f"{animal_uno.nombre} es un {animal_uno.tipo()}")
print(f"{animal_dos.nombre} es un {animal_dos.tipo()}")