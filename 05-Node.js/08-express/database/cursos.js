// simulando base de datos
let infoCursos = {
    'programacion': [
        {
            id: 1,
            titulo: 'Aprende Python',
            lenguaje: 'python',
            vista: 1500,
            nivel: 'principiante'
        },
        {
            id: 2,
            titulo: 'Aprende JavaScript',
            lenguaje: 'javascript',
            vista: 2000,
            nivel: 'principiante'
        }
    ],
    'web': [
        {
            id: 3,
            titulo: 'Desarrollo Web',
            lenguaje: 'html',
            vista: 1000,
            nivel: 'principiante'
        }
    ]
}

module.exports.infoCursos = infoCursos;