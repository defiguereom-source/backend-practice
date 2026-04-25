#metodo constructor

class Persona:
    pass
    # Este es el constructor
    def __init__(self, name, lastname, age):
        self.name = name
        self.lastname = lastname
        self.age = age
        
    def descripcion(self):
        return '{} {} tiene {}'.format(self.name,  self.lastname, self.age)
    
    def comentario(self, frase):
        return '{} {} dice: {}'.format(self.name, self.lastname, frase)

doctor = Persona('Daniel', 'Encarnacion', 25)
print(doctor.descripcion())
print(doctor.comentario('Hola Mundo'))

print('---------------------------------------------')
# modificar un atribuno

class Email:
    pass
    def __init__(self):
        self.enviado = False
    
    def enviar_correo(self):
        self.enviado = True   

correo = Email()
print(correo.enviado)

correo.enviar_correo()
print(correo.enviado)