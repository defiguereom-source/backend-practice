const express = require('express');
const router = express.Router();

const { infoCursos } = require('../database/cursos');

// Obtener todos los cursos de programación
router.get('/', (req, res) => {
    res.send(JSON.stringify(infoCursos.programacion));
});

// Filtrar por lenguaje y nivel
router.get('/:lenguaje/:nivel', (req, res) => {

    const lenguaje = req.params.lenguaje;
    const nivel = req.params.nivel;

    const resultados = infoCursos.programacion.filter(
        curso =>
            curso.lenguaje === lenguaje &&
            curso.nivel === nivel
    );

    if (resultados.length === 0) {
        return res
            .status(404)
            .send(`No se encontraron cursos de ${lenguaje} con nivel ${nivel}`);
    }

    if (req.query.ordenar === 'vistas') {

        return res.send(
            JSON.stringify(
                resultados.sort((a, b) => b.vistas - a.vistas)
            )
        );
    }

    res.send(JSON.stringify(resultados));
});

module.exports = router;