# formart %

# turiales de %
curso = "Python"
print("tutoriales de %s" % curso)

nombre = "juan"
edad = 30
# print("mi nombre es %s y tengo %d años" % (nombre, edad))

# print("que tal soy {} tengo {} años".format(nombre, edad))

# print(f"que tal soy {nombre} tengo {edad} años")


#   Orientado a Objetos

class Estudiante:
    def __init__(self, nombre, apellido, edad):
        self.nombre = nombre
        self.apellido = apellido
        self.edad = edad
    
    def __repr__(self):
        return f"Estudiante: {self.nombre} {self.apellido}, Edad: {self.edad}"

estudiante_uno = Estudiante("Maria", "Gomez", 22)

print(estudiante_uno)
