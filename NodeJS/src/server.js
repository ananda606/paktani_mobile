const Hapi = require('@hapi/hapi');
const routes = require('./product_routes');

const init = async () => {
    const server = Hapi.server({
        port: 5000 ,
        host: 'localhost' ,
        routes:{
            cors: {
              origin: ['*'] ,
            } ,
          } ,
        });
        server.route(routes);
        await server.start(error=>{
          if(error){
            throw error;
          }
        });
        console.log(`Server: ${server.info.uri}`);
        
    };
init();
