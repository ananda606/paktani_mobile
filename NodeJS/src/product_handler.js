
const {nanoid} = require('nanoid');
const Products= require('./products');

const addProductsHandler = (request, h)=>{
    const {name ,year,author,summary, publisher,pageCount, readPage, reading,} = request.payload;
    const id = nanoid(16);
    const insertedAt = new Date().toISOString();
    const updatedAt=insertedAt;
    const finished = true?readPage===pageCount:false;
   
    if(name === null){
        const response=h.response({
            status:'fail',
            message:'Gagal menambahkan buku. Mohon isi nama buku'
        });
        response.code(400);
        return response;
    } else if(readPage > pageCount){
        const response=h.response({
            status:'fail',
            message:'Gagal menambahkan buku. readPage tidak boleh lebih besar dari pageCount',
            
        });
        response.code(400);
        return response;
    

    }
    
    const newProducts={
        name,year,author,summary, publisher,pageCount,readPage,reading,id,insertedAt,updatedAt, finished,
    };
    Products.push(newProducts);

    
    const isSuccess = Products.filter((product)=>product.id === id).length > 0;
    if( isSuccess ){
            const response= h.response({
                status:'success',
                message:'Buku berhasil ditambahkan',
                data:{
                    productId:id,
                },
            });
            response.code(201);
            return response;
        
    }else{
    const response=h.response({
        status:'fail',
        message:'Buku gagal ditambahkan',
    });
    response.code(500);
    return response;  
}
};

const getAllProductsHandler = (request,h)=>{
   const{reading,finished,name}=request.query;
   const isReading= Products.filter((n)=> Number(n.reading)==Number(reading));
   const isFinished= Products.filter((n)=>Number(n.finished)===Number(finished));
   const isNameDicoding= Products.filter((n)=>n.name.toLowerCase().includes('Dicoding'.toLowerCase()));
   if(!reading && !finished && !name){
       const response=h.response(
        {
        status: 'success',
        data: {
            Products: Products.map((data) => ({
              id: data.id,
              name: data.name,
              publisher: data.publisher,
            })),
          },
        });
        response.code(200);
       return response;
   }
   if(reading){
      
       const response=h.response({
        status: 'success',
        data: {
            Products: isReading.map((data) => ({
              id: data.id,
              name: data.name,
              publisher: data.publisher,
            })),
          },
        });
        response.code(200);
        return response;
   }
   if(finished){
       
       const response=h.response({status: 'success',
       data: {
           Products: isFinished.map((data) => ({
             id: data.id,
             name: data.name,
             publisher: data.publisher,
           })),
         },
       });
       response.code(200);
       return response;
   }
   
   if(name.toLowerCase().includes('Dicoding'.toLowerCase())){
   
    const response=h.response({status: 'success',
    data: {
        Products: isNameDicoding.map((data) => ({
          id: data.id,
          name: data.name,
          publisher: data.publisher,
        })),
      },
    });
    response.code(200);
    return response;
   }
    
    
};

const getProductsByIdHandler = (request,h)=>{
 const {id}=request.params;
 const product= Products.filter((n)=>n.id===id)[0];

if(product !== undefined){
    const response = h.response({
        status: 'success',
        data: { 
          product,
          },
     });
     response.code(200);
     return response;
    }
    
        const response=h.response({
            status:'fail',
            message:'Buku tidak ditemukan',
            });
            response.code(404);
            return response;
    
    
}

const editProductsByIdHandler=(request,h) => {
    const {id} = request.params;
    const {name, year, author,summary, publisher, pageCount,readPage,reading}= request.payload;
    
    const finished = true?readPage===pageCount:false;
    const index= Products.findIndex((product)=>product.id===id);
    if(name===undefined){
        const response= h.response({
            status:'fail',
            message:'Gagal memperbarui buku. Mohon isi nama buku',
        });
        response.code(400);
        return response;
    }else if(readPage > pageCount){
        const response=h.response({
            status:'fail',
            message:'Gagal memperbarui buku. readPage tidak boleh lebih besar dari pageCount',
        });
        response.code(400);
        return response;
    }else if(index !== -1) {
        const updatedAt= new Date().toISOString();
        Products[index] = {
        ...Products[index],
        name,
        year,
        author,
        summary,
        publisher,
        pageCount,
        readPage,
        reading,
        updatedAt,
        finished,
 };
    const response = h.response({
    status: 'success',
    message: 'Buku berhasil diperbarui',
    });
 response.code(200);
 return response;
}else{
const response = h.response({
 status: 'fail',
 message: 'Gagal memperbarui buku. Id tidak ditemukan',
});
response.code(404);
return response;
};
};

const deleteProductsByIdHandler=(request,h)=>{
    const {id}=request.params;
    const index= Products.findIndex((product) => product.id===id);
    if (index !== -1) {
        Products.splice(index, 1);
        const response = h.response({
          status: 'success',
          message: 'Buku berhasil dihapus',
        });
        response.code(200);
        return response;
      }else{
      const response = h.response({
        status: 'fail',
        message: 'Buku gagal dihapus. Id tidak ditemukan',
      });
        response.code(404);
        return response; 
 }
 };




module.exports = {
addProductsHandler,
getAllProductsHandler,
getProductsByIdHandler,
editProductsByIdHandler,
deleteProductsByIdHandler,

};