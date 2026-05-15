const express = require('express');
const app = express();

const routerProgramacion = require("./routers/programacion");
const routerWeb = require('./routers/web');

// Ruta principal
app.get('/', (req, res) => {
    res.send('Mi primer servidor express');
});

// Middleware de rutas
app.use('/api/cursos/programacion', routerProgramacion);
app.use('/api/cursos/web', routerWeb);

// Puerto
const port = process.env.PORT || 3000;

app.listen(port, () => {
    console.log(`Servidor escuchando en el puerto ${port}`);
});