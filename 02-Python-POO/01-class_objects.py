# CLASS and Objects

# Ejemplo 1 (con objetos incluidos)
class Auto: 
    marca = ''
    modelo = 0
    Placa = ''
    
taxi = Auto()

print(taxi.modelo); # Devuelve 0

# Ejemplo 2 (con metodos/funciones incluidas)
class Calculadora:
    
    # Esto es un tipo de constructor
    def __init__(self, n1, n2):
        self.n1 = n1
        self.n2 = n2
    
    def sumar (self):
        resultado = self.n1 + self.n2
        return resultado
    
    def restar (self):
        resultado = self.n1 - self.n2
        return resultado
    
    def multiplicar(self):
        resultado = self.n1 * self.n2
        return resultado
    
    def dividir(self):
        if self.n2 != 0:
            resultado = self.n1 / self.n2
        else:
            return "Error: divicion por cero"
        
        return resultado

calc = Calculadora(1, 1)
print(calc.sumar())

# Ejemplo 3 (mejor forma de hacer la Calculadora)
class CalculadoraB:
    def __init__(self, n1, n2):
        self.suma = n1 + n2;
        self.resta = n1 - n2;
        self.multiplicacion = n1 * n2;
        self.divicion = n1 / n2;
        
operacion = CalculadoraB(2,3)
print(operacion.suma)        

# notes: 
# no se puede utilizar el self y el @staticmethod juntos