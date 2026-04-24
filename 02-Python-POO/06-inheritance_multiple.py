# Herencia (multiple)

class Telefono:
    def __init__(self):
        pass
    
    def llamar(self):
        print("Llamando...")
        
    def ocupado(self):
        print("Ocupado...")
        
class Camara:
    def __init__(self):
        pass
    
    def tomar_foto(self):
        print("Tomando foto...")

class Reproduccion:
    def __init__(self):
        pass
    
    def reproducir_musica(self):
        print("Reproduciendo música...")
        
    def reproducir_video(self):
        print("Reproduciendo video...")

class Smartphone(Telefono, Camara, Reproduccion):
    def __del__(self):
        print("El smartphone ha sido destruido.")
        
mobile = Smartphone()
mobile.llamar()
mobile.tomar_foto()
mobile.reproducir_musica()
mobile.reproducir_video()


# print(dir(mobile)) // esto sirve para ver todos los metodos 
