const express= require('express');
const bodyParser= require('body-parser');
const cors= require('cors');
const app= express();
const {db}= require('./model/dbConnection');


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
app.put('/api/updateProduct/:idproduct',(req,res)=>{
    const idproduct = req.body.idproduct;
    const productName= req.body.productName;
    const productDescription= req.body.productDescription;
    const productImageUrl= req.body.productImageUrl;;
    const sqlQuery= "UPDATE user SET productName = ? , productDescription = ?, productImageUrl = ?  WHERE idproduct = ? ";

    db.query(sqlQuery, [idproduct,productName, productDescription,productImageUrl], (err,result)=>{
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
    const idproduct = req.body.idproduct;

    const sqlQuery= "DELETE FROM product WHERE idproduct = ? ";

    db.query(sqlQuery, idproduct, (err,result)=>{
        if(err){
            console.log(err);
     
         }else{
             res.send(result);
             console.log(result);
         }
    });
     
 });

//read
app.get('/api/readData',(req,res)=>{
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

app.get('/api/readUser/:username',(req,res)=>{
    const username= req.params.username;
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
app.put('/api/updateUser/:iduser_new',(req,res)=>{
     const id = req.body.iduser_new;
     const username= req.body.username;
     const password= req.body.password;
     const sqlQuery= "UPDATE user SET username = ? , password = ?  WHERE iduser_new = ? ";
 
     db.query(sqlQuery, [id,username, password], (err,result)=>{
         if(err){
             console.log(err);
      
          }else{
              res.send(result);
              console.log(result);
          }
     });
    });

//delete
app.delete('/api/deleteUser',(req,res)=>{
    const id = req.body.iduser_new;

    const sqlQuery= "DELETE FROM user  WHERE iduser_new = ? ";

    db.query(sqlQuery, id, (err,result)=>{
        if(err){
            console.log(err);
     
         }else{
             res.send(result);
             console.log(result);
         }
    });
     
 });

app.listen(3001,()=>{
console.log(`server 3001`);
});
