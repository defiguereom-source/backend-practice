// Importa o arquivo JSON usando require
const curso = require('./curso.json')

console.log(curso)

// creando un objeto JavaScript y convirtiendo a JSON
let infoCurso = {
    "titulo": "Curso de Node.js",
    "numVistas": 1000,
    "numLikes": 500,
    "numDislikes": 100,
    "temas": [
        "Introducción a Node.js",
        "Módulos en Node.js",
        "Eventos en Node.js",
        "Streams en Node.js",
        "Express.js"
    ],
    "esPublico": true
}

// Conviertiendo un objeto JavaScript para un string JSON
let infoCurso = JSON.stringify(infoCurso)