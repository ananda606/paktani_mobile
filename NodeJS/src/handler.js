
const {nanoid} = require('nanoid');
const books= require('./books');

const addBooksHandler = (request, h)=>{
    const {name ,year,author,summary, publisher,pageCount, readPage, reading,} = request.payload;
    const id = nanoid(16);
    const insertedAt = new Date().toISOString();
    const updatedAt=insertedAt;
    const finished = true?readPage===pageCount:false;
   
    if(name === undefined){
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
    
    const newBooks={
        name,year,author,summary, publisher,pageCount,readPage,reading,id,insertedAt,updatedAt, finished,
    };
    books.push(newBooks);

    
    const isSuccess = books.filter((book)=>book.id === id).length > 0;
    if( isSuccess ){
            const response= h.response({
                status:'success',
                message:'Buku berhasil ditambahkan',
                data:{
                    bookId:id,
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

const getAllBooksHandler = (request,h)=>{
   const{reading,finished,name}=request.query;
   const isReading= books.filter((n)=> Number(n.reading)==Number(reading));
   const isFinished= books.filter((n)=>Number(n.finished)===Number(finished));
   const isNameDicoding= books.filter((n)=>n.name.toLowerCase().includes('Dicoding'.toLowerCase()));
   if(!reading && !finished && !name){
       const response=h.response(
        {
        status: 'success',
        data: {
            books: books.map((data) => ({
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
            books: isReading.map((data) => ({
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
           books: isFinished.map((data) => ({
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
        books: isNameDicoding.map((data) => ({
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

const getBooksByIdHandler = (request,h)=>{
 const {id}=request.params;
 const book= books.filter((n)=>n.id===id)[0];

if(book !== undefined){
    const response = h.response({
        status: 'success',
        data: { 
          book,
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

const editBooksByIdHandler=(request,h) => {
    const {id} = request.params;
    const {name, year, author,summary, publisher, pageCount,readPage,reading}= request.payload;
    
    const finished = true?readPage===pageCount:false;
    const index= books.findIndex((book)=>book.id===id);
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
        books[index] = {
        ...books[index],
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

const deleteBooksByIdHandler=(request,h)=>{
    const {id}=request.params;
    const index= books.findIndex((book) => book.id===id);
    if (index !== -1) {
        books.splice(index, 1);
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
addBooksHandler,
getAllBooksHandler,
getBooksByIdHandler,
editBooksByIdHandler,
deleteBooksByIdHandler,

};