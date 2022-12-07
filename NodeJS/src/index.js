const express= require('express');
const bodyParser= require('body-parser');
const cors= require('cors');
const app= express();
const {db}= require('./model/dbConnection');
const multer= require('multer');


const serverPort= 3001;
app.use(cors());
app.use(express.json());
app.use(bodyParser.urlencoded({extended:true}));

//read product
app.get('/api/readProduct',(req,res)=>{
    const sqlQuery="SELECT * FROM product";
 
    db.query(sqlQuery,(err,result)=>{
        if(err){
            console.log(err);
        }else{
            //res.status(200).json({success:true, results:result});
            res.send(result);
            //res.jsonp(result);
          //res.status(200).json({result});
       
            console.log(result);
        }   
    });
});
//read product by id
app.get('/api/readProductById/:id',(req,res)=>{
    const id=req.params.id;
    
    const sqlQuery="SELECT * FROM product WHERE id = ?";
    db.query(sqlQuery, id, (err,result)=>{
        if(err){
            console.log(err);
        }else{
            res.send(result);
            console.log(result);
        }   
    });
});
//read product by name
app.get('/api/readProductByName/:productName',(req,res)=>{
  
    const productName= req.params.productName
    const sqlQuery="SELECT * FROM product WHERE productName = ?";
    db.query(sqlQuery, productName, (err,result)=>{
        if(err){
            console.log(err);
        }else{
            res.send(result);
            console.log(result);
        }   
    });
});
//create product
app.post('/api/createProduct',(req,res)=>{
    const id= req.body.id;
    const productName= req.body.productName;
    const productLocation=req.body.productLocation;
    const productDescription= req.body.productDescription;
    const productImageUrl= req.body.productImageUrl;
    const producRating= req.body.producRating;
    const sqlQuery= "INSERT INTO product (id, productName,productLocation, productDescription, productImageUrl,productRating) VALUE (?, ?, ?, ? , ?, ?)";

    db.query(sqlQuery, [id,productName,productLocation, productDescription, productImageUrl,producRating], (err,result)=>{
        if(err){
            console.log(err);
     
         }else{
            if(res.statusCode==201){
                res.send(true);
            }
            else{
                res.send(false);
            }
         }
    });
    
});
//update product
app.put('/api/updateProductById/:id',(req,res)=>{
    const idproduct = req.params.id;
    const productName= req.body.productName;
    const productDescription= req.body.productDescription;
    const productImageUrl= req.body.productImageUrl;;
    const sqlQuery= "UPDATE product SET productName = ? , productDescription = ?, productImageUrl = ?  WHERE id = ? ";

    db.query(sqlQuery, [productName, productDescription,productImageUrl,idproduct], (err,result)=>{
        if(err){
            console.log(err);
     
         }else{
            
           res.send(result);
          
         }
    });
   });
//delete
app.delete('/api/deleteProduct/:id',(req,res)=>{
    const idproduct = req.params.id;

    const sqlQuery= "DELETE FROM product WHERE id = ? ";

    db.query(sqlQuery, idproduct, (err,result)=>{
        if(err){
            console.log(err);
     
         }else{
            res.send(result);
             console.log(result);
         }
    });
     
 });

//read all user
app.get('/api/readUser',(req,res)=>{
    const sqlQuery="SELECT * FROM user";
    db.query(sqlQuery,(err,result)=>{
        if(err){
            console.log(err);
        }else{
            res.send(result);
            console.log(result);
        }
    });
});

app.get('/api/readUserByUsername',(req,res)=>{
    const username= req.body.username;
    const sqlQuery= "SELECT * FROM user WHERE username = ?";
    db.query(sqlQuery, username, (err,result)=>{
        if(err){
            console.log(err);
     
         }else{
             res.send(result);
             console.log(result);
         }
    });
    
});
//belum implementasi
/**app.get('/api/login/',(req,res)=>{
    const email= req.body.email;
    const password= req.body.password;
    const sqlQuery= "SELECT * FROM user WHERE email = ? AND password = ?";
    if(email && password){
    db.query(sqlQuery, [email,password], (err,result)=>{
        if(err){
            throw error;
            
     
         }else{
            if(result.length>0){
              
             res.send(result); 
             console.log(result);
             }else{
             res.send(false);
            
             }
          
         }
    });
}
    else{
        res.send(false);
    }
    
}); */
app.get('/api/login/:email/:password',(req,res)=>{
    const email= req.params.email;
    const password= req.params.password;
    const sqlQuery= "SELECT * FROM user WHERE email = ? AND password = ?";
    if(email && password){
    db.query(sqlQuery, [email,password], (err,result)=>{
        if(err){
            throw error;
            
     
         }else{
            if(result.length>0){
              
             res.send(result); 
             console.log(result);
             }else{
             res.send(false);
            
             }
          
         }
    });
}
    else{
        res.send(false);
    }
    
});

//create
app.post('/api/createUser',(req,res)=>{
   
    const username= req.body.username;
    const password= req.body.password;
    const email= req.body.email;
    const userAddress= req.body.userAddress;
    const userPhoneNumber= req.body.userPhoneNumber;
    const sqlQuery= "INSERT INTO user (email, password, username, userAddress, userPhoneNumber) VALUE (?, ?, ?, ?, ? )";
if(username!=null&&password!=null&&email!=null&&userAddress!=null&&userPhoneNumber!=null){
    db.query(sqlQuery, [email, password,username, userAddress,userPhoneNumber], (err,result)=>{
        if(err){
            console.log(err);
     
         }else{
            res.status(201);
            console.log(result);
         }
    });
}else{
        res.status(404);
    }
    
});

//update
app.put('/api/updateUserById/',(req,res)=>{
     const id = req.body.iduser;
     const username= req.body.username;
     const password= req.body.password;
     const sqlQuery= "UPDATE user SET username = ? , password = ?  WHERE iduser = ? ";
 
     db.query(sqlQuery, [ username, password,id,], (err,result)=>{
         if(err){
             console.log(err);
      
          }else{
              res.send(result);
              console.log(result);
          }
     });
    });

//delete
app.delete('/api/deleteUserById/:iduser',(req,res)=>{
    const id = req.params.iduser;

    const sqlQuery= "DELETE FROM user  WHERE iduser = ? ";

    db.query(sqlQuery, id, (err,result)=>{
        if(err){
            console.log(err);
         }else{
            
             res.send(result);
             console.log(result);
         }
    });
     
 });

app.listen(serverPort,()=>{
console.log(`localhost:${serverPort}/api/`);
});
