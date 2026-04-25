# herencia practico

# Calculadora Herencia

class Calculadora:
    pass
    def __init__(self, numero):
        self.n = numero
        self.datos = [0 for i in range(numero)]
        
    def ingresarDato(self):
        pass
        self.datos = [int(input('ingresar datos: '+str(i + 1)+' = ')) for i in range(self.n)]
        

class Ope_basicas(Calculadora):
    def __init__(self):
        Calculadora.__init__(self, 2)
    
    def suma(self):
        n1, n2, = self.datos
        sum = n1 + n2
        print('El resultado es: ', sum)

    def restar(self):
        n1, n2, = self.datos
        res = n1 - n2
        print('El resultado es: ', res)
        
    def multiplicacion(self):
        n1, n2, = self.datos
        mul = n1 * n2
        print('El resultado es: ', mul)
    
    def divicion(self):
        n1, n2, = self.datos
        div = n1 / n2
        print('El resultado es: ', div)

class Raiz(Calculadora):
    def __init__(self):
        Calculadora.__init__(self, 1)
        
    def cuadrada(self):
        import math
        n1, = self.datos
        print('el resultado es: ', math.sqrt(n1))
        
# Ejecutando el code

calcular = Raiz()
print(calcular.ingresarDato())
print(calcular.cuadrada())

objecto = Ope_basicas()
# Esta funcion trabaja con la herencia, ya que el objeto es de la clase Ope_basicas pero tambien es de la clase Calculadora
print(isinstance(objecto, Ope_basicas))

# Esta funcion trabaja con la herencia, ya que el objeto es de la clase Ope_basicas pero tambien es de la clase Calculadora
print(issubclass(Ope_basicas, Calculadora))