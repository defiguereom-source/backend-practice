const express = require('express');
const router = express.Router();

const { infoCursos } = require('../database/cursos');

// Obtener cursos web
router.get('/', (req, res) => {
    res.send(JSON.stringify(infoCursos.web));
});

module.exports = router;