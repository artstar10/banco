// criando uma conexão com o banco de dados
const {Sequelize} = require("sequelize");
//parâmetros utilizados no sequelize database, usuário, senha, local, tipo do banco
const sequelize = new Sequelize('javagama','root','mysql',
{
    host: 'localhost',
    dialect: 'mysql'
});

//criei um módulo de conexão com sequelize
module.exports = sequelize;

//criando um then/catch para verificar se conectamos no banco de dados
sequelize.authenticate().then(function(){
    console.log("conexão com êxito!");
}).catch(function(erro){
    // console.log('o erro ocorrido foi: '+ erro);
    console.log(erro.message);
})

//criando um módulo para gerar uma tabela no banco de dados
const Aluno = sequelize.define('aluno',{
    nome:{
        type:Sequelize.STRING
    },
    idade:{
        type:Sequelize.INTEGER
    },
    email:{
        type:Sequelize.STRING
    },


});

//a alinha abaixo permite criar a tabela, após criar comentar para nao reecriar e deletar a atual
Aluno.sync({force: true});

//criando a inserção de registros na tabela
Aluno.create({
    nome:"art",
    idade:25,
    email:"teste@teste.com"   
});