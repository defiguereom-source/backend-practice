# polymorphism: capacidad de un objeto de tomar muchas formas

print("--------polymorphism----------")
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

print("--------polymorphism with functions----------")

class Tomate:
    def tipo(self):
        print("Vegetal")
    
    def color(self):
        print("Rojo")
    
class Manzana:
    def tipo(self):
        print("Fruta")
    
    def color(self):
        print("Verde")
    
def funcion(objecto):
    objecto.tipo()
    objecto.color()
    
tomate_uno = Tomate();
manzana_uno = Manzana()

print("--------Tomates--------")
funcion(tomate_uno)

print("--------Manzana--------")
funcion(manzana_uno)

print("--------polymorphism with methods----------")
class Colombia:
    def capital(self):
        print('Bogota')
        
    def idioma(self):
        print('Español')
        
class Francia:
    def capital(self):
        print('Paris')
        
    def idioma(self):
        print('frances')
        
colombiano = Colombia()
frances = Francia()

for pais in (colombiano, frances):
    pais.capital()
    pais.idioma()

print("--------polymorphism with inheritance----------")

class Aves:
    def volar(self):
        print("Casi todas las aves vuelan")

class Aguila(Aves):
    def volar(self):
        print("Esta ave vuela")
        
class Gallina(Aves):
    def volar(self):
        print("Esta ave no vuela")
        
obj_ave = Aves()
obj_ave.volar()