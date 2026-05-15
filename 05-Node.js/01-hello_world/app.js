//Existen mas console.log() como console.error(), console.warn(), console.info(), etc.
console.log("Hola Mundo!");
console.warn("Esto es una advertencia");
console.error("Esto es un error");
console.info("Esto es una información");


console.log(process.memoryUsage()); //Muestra el uso de memoria del proceso actual

// informcion del usuario
const os = require('os');

console.log(process.env.USER); //Muestra el nombre del usuario actual
console.log(process.env.HOME); //Muestra el directorio home del usuario actual
console.log(os.userInfo()); //Muestra la información del usuario actual

// modulo timers
function mostrarTema(tema){
    console.log(`Estoy aprendiendo ${tema}`);
}
setTimeout(mostrarTema, 5000, "Node.js"); //Ejecuta la función mostrarTema después de 2 segundos con el argumento "Node.js"

