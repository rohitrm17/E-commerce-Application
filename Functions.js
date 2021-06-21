var mysql = require('mysql2');

var con = mysql.createConnection({
    hostname : 'localhost',
    user     : 'root',
    password : '',
    database : 'e-commerce'
});

con.connect(function(err){
    if (err) throw err;
    console.log("Connected!");
});

function mySearchProduct()
{
    var input;
    input = document.getElementById("mySearch");
    var sql = "select * from product where Pname like input";
    con.query(sql , function(err , result){
        if(err) throw err;
        result.innerHTML
    });
}