const express= require('express');
const bodyParser= require('body-parser');
const cors= require('cors');
const app= express();
const {db}= require('./model/dbConnection');

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
            res.send(result);
            console.log(result);
        }   
    });
});
//read product by id
app.get('/api/readProductById/',(req,res)=>{
    const id=req.body.id;
    
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
app.get('/api/readProductByName/',(req,res)=>{
  
    const productName= req.body.productName
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
    const productName= req.body.productName;
    const productDescription= req.body.productDescription;
    const productImageUrl= req.body.productImageUrl;
    const sqlQuery= "INSERT INTO product (productName, productDescription, productImageUrl) VALUE (?, ?, ?)";

    db.query(sqlQuery, [productName, productDescription, productImageUrl], (err,result)=>{
        if(err){
            console.log(err);
     
         }else{
             res.send(result);
             console.log(result);
         }
    });
    
});
//update product
app.put('/api/updateProduct/',(req,res)=>{
    const idproduct = req.body.id;
    const productName= req.body.productName;
    const productDescription= req.body.productDescription;
    const productImageUrl= req.body.productImageUrl;;
    const sqlQuery= "UPDATE product SET productName = ? , productDescription = ?, productImageUrl = ?  WHERE id = ? ";

    db.query(sqlQuery, [productName, productDescription,productImageUrl,idproduct], (err,result)=>{
        if(err){
            console.log(err);
     
         }else{
             res.send(result);
             console.log(result);
         }
    });
   });
//delete
app.delete('/api/deleteProduct',(req,res)=>{
    const idproduct = req.body.id;

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

//create
app.post('/api/createUser',(req,res)=>{
   const id= req.body.id;
    const username= req.body.username;
    const password= req.body.password;
    const sqlQuery= "INSERT INTO user (username, password) VALUE (?,? )";

    db.query(sqlQuery, [username, password], (err,result)=>{
        if(err){
            console.log(err);
     
         }else{
             res.send(result);
             console.log(result);
         }
    });
    
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
app.delete('/api/deleteUserById',(req,res)=>{
    const id = req.body.iduser;

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
