const promesaCumplida = true

const miPromesa = new Promise((resolve, reject)=>{
    
    setTimeout(()=>{    
        if(promesaCumplida){
            resolve('La promesa se cumplió')
        } else {
            reject('La promesa rechazada...')
        }
    } , 2000);
});

miPromesa.then((mensaje)=>{
    console.log(mensaje);
}); 


// async await
async function ordenarProducto(producto){
    try {
        const resultado = await ordenarProducto(producto);
        console.log(resultado);
    } catch (error) {
        console.error(error);
    }
}