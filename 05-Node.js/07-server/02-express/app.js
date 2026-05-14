// const req = require("express/lib/request");
const http = require("http");
const cursos = require("./cursos");

const server = http.createServer((req, res) => {
  const {method} = req;
  
  switch(method){
    case "GET":
      return manejarSolicitudGet(req, res);
    case "POST":
      return manejarSolicitudPost(req, res);
    default:
      res.statusCode = 501;
      console.log('Metodo no soportado en el servidor');
  }

});

function manejarSolicitudGet(req, res){
  const path = req.url;
  
  console.log(res.statusCode);
 
  if(path === "/"){
    return res.end("Bienvenido al servidor de cursos");
  }
  else if(path === "/api/cursos"){
    return  res.end(JSON.stringify(cursos.infoCursos));
  }
  else if(path === "/api/cursos/programacion"){
    return res.end(JSON.stringify(cursos.infoCursos.programacion));
  }
  else{
    res.statusCode = 404;
    return res.end("El recurso solicitado no existe");
  }

}

function manejarSolicitudPost(req, res){
  const path = req.url;

  if(path === "/api/cursos/programacion"){
    res.statusCode = 200;
    return res.end("Creando un nuevo curso de programación");
  }
}

const port = 3000;

server.listen(port, () =>{
  console.log(`Servidor escuchando en el puerto ${port}`);
});