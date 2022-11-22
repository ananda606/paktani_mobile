

const{
    addProductsHandler,
    getAllProductsHandler,
    getProductsByIdHandler,
    editProductsByIdHandler,
    deleteProductsByIdHandler,
} = require('./product_handler');

const routes=[
    {
        method:'POST',
        path:'/products',
        handler: addProductsHandler,
    },
    {
        method:'GET',
        path:'/products',
        handler: getAllProductsHandler,
    },
    
];
module.exports = routes;