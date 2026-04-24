# Funciones para atributos

class Person:
    name = 'Daniel E. Figuereo Mendez'
    age = 18

doctor = Person();
print('Su nombre es: ' , doctor.name , ' Su edad es: ' , doctor.age)

# notes:
# hasattr sirve para ver si existe un objeto en la clase
# setattr sirve para cambiar el atributo que tenga el objeto
# delattr sirve para eliminar atributos/objetos de la clase