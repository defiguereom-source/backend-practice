# Construtores de listas
numbers_list = list([1, 2, 3, 4]);
print(numbers_list);

# Lista basada en rango
rango = list(range(1, 11));
print(rango)

# Todos los metodos de una lista
print(dir(numbers_list));

#tuplas (todo lo que puedo hacer con una tupla)
x = ('Hola' , 'Adios', 'Etc', 'Tupl');

print(dir(x));

# Ejemplo de como usar una tupla en un diccionario
locations = {
    (35.123, 39.0000): 'Tokyo'
}