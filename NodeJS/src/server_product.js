const Hapi = require('@hapi/hapi');
const routes = require('./product_routes');

const init = async ()=>{
    const server = Hapi.server({
        port:8080,
        host: 'localhost',
        routes:{
            cost:{
                origin:['*'],
            },
        },
    });
    server.route(routes);
    await server.start(error=>{
            if(error){
                throw error;
            }
        }
    );
    console.log(`server local: ${server.info.uri}`);
};
init();

