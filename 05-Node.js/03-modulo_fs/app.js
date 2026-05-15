const fs = require('fs');

fs.readFile('index.html', 'utf-8', (err, data) => {
    if(err){
        throw err;
    }
    console.log(data);
    
}) 

// fs.appendFile agrega contenido al final del archivo, si el archivo no existe, lo crea
fs.appendFile('index.html', '\n<p>Hola Mundo</p>', (err) => {
    if(err){
        throw err;
    }
    console.log('Archivo modificado');
})


// fs.rename renombra el archivo, si el nuevo nombre ya existe, lo sobreescribe 

// fs.writeFile crea un nuevo archivo o sobreescribe el contenido de un archivo existente

// fs.unlink elimina un archivo


// Si le agregas un Sync se vuelven síncronos, es decir, el código se ejecuta de manera secuencial, bloqueando el hilo de ejecución hasta que se complete la operación. Por ejemplo:
try {const data = fs.readFileSync('index.html', 'utf-8');
    console.log(data);
}catch(err){
    console.error(err);
}