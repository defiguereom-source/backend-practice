const EventEmitter = require('events');
const emisorProductos = new EventEmitter();

// Este evento se dispara cada vez que se compra un producto
emisorProductos.on('compra', (producto, total, numProductos) =>{
    console.log(`Se ha comprado el producto: ${producto}, por un total de $${total} (${numProductos} unidades)`);
});

// Simulamos la compra de un producto
emisorProductos.emit('compra', 'Laptop', 1000, 2);

