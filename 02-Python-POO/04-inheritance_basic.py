# Herencia

# clase padre
class Pokemon:
    pass
    def __init__(self, name, types):
        self.name = name
        self.types = types
    
    def descripcion(self):
        return '{} es un pokemon de tipo: {}'.format(self.name, self.types)

# clases hijos
class Pikachu(Pokemon):
    pass
    def ataque(self, tipoAtaque):
        return '{} a usado: {}'.format(self.name, tipoAtaque)

class Charmander(Pokemon):
    pass
    def ataque(self, tipoAtaque):
        return '{} a usado: {}'.format(self.name, tipoAtaque)

# usando las clases

new_pokemon = Pikachu('boby', 'electrico')
print(new_pokemon.descripcion())

print(new_pokemon.ataque('impacto trueno'))