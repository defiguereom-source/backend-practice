# classmethods
class Pastel_classmethod:
    def __init__(self, ingredientes):
        self.ingredientes = ingredientes

    def __repr__(self):
        return f'Pastel({self.ingredientes !r})'
    
    # Esto es un metodo de clase
    @classmethod
    def Pastel_chocolate(cls):
        return cls(['chocolate', 'harina', 'leche', 'azucar'])
    
    @classmethod
    def Pastel_vainilla(cls):
        return cls(['vainilla', 'harina', 'leche', 'azucar'])
    
# print(Pastel_classmethod(['vainilla', 'harina', 'leche', 'azucar']))

# Clases estaticas
import math

class Pastel_static:
    def __init__(self, ingredientes, size):
        self.ingredientes = ingredientes
        self.size = size
        
    def __repr__(self):
        return f'Pastel({self.ingredientes !r}, {self.size !r})'
    
    def area(self):
        return self.size_area(self.size)
    
    @staticmethod
    def size_area(Area):
        return Area * 2 * math.pi

pastel_uno = Pastel_static(['chocolate', 'harina', 'leche', 'azucar'], 4)

print(pastel_uno.ingredientes)
print(pastel_uno.size)
print(pastel_uno.area())