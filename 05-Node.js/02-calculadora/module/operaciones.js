function sumar(n1, n2){
   return console.log(n1 + n2);
}   

function restar(n1, n2){
   return console.log(n1 - n2);
}   

function multiplicar(n1, n2){
   return console.log(n1 * n2);
}   

function dividir(n1, n2){
   return console.log(n1 / n2);
}   

module.exports.sumar = sumar;
module.exports.restar = restar;
module.exports.multiplicar = multiplicar;
module.exports.dividir = dividir;