// Carregando um módulo do express
const express = require('express');
//Variável que irá receber a cópia do módulo
const app = express();

//criando a primeira rota do app
// app.get("/", function(req,res){
//     res.send("<h3>Seja bem vindo ao app com express.js</h3>");
// });

// app.get("/sobre", function(req,res){
//     res.send("Seja bem vindo a página com o conteúdo sobre");

// });

// //criando uma nova rota parametrizada com 1 parametro
// app.get("/Ola/:nome", function(req,res){
//     // res.send("Olá");
//     res.send(req.params);
// });

// //criando uma rota parametrizada com mais de um parametro
// app.get("/profissao/:nome/:cargo", function(req,res){
//     res.send(req.params);
// });

// //abertura da nossa página através de uma rota para chamar a página html
// app.get("/pagina", function(req,res){
//     res.sendFile(__dirname+"/index.html");
// });



//abertura com app.use
app.use(express.static('public'));

app.listen(8081,function(){
    console.log("Rodando o nosso servidor na porta http://localhost:8081")
});