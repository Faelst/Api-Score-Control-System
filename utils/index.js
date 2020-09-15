var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : '177.52.245.161',
  user     : 'cliente_s',
  password : 'T?JVFu=fc35@',
  database : 'dbemp00250'
});
 
connection.connect();

const id = [ 49, 61, 216, 4757, 8945, 10427, 15039, 19266, 19615, 37928, 40289, 41487, 42914, 43065, 43810, 45599, 46596, 46770, 53949, 57077, 57094, 57100, 57104, 57142, 63276, 63903, 63904, 65567, 68601, 70355, 71864 ]

id.map(e => {
    
    connection.query(`select id, name, street, neighborhood, city, status, email, phone, cell_phone_1 as phone2, id, deleted from people p where p.deleted = 0 and p.technical = 1 and p.id = ${e}`, function (error, results, fields) {
      if (error) throw error;

      console.log(`INSERT INTO technicals(id, name, street, neighborhood, city, status, email, phone, phone2, erp_people_id) VALUES (${results[0].id || null},${'"'+results[0].name+'"' || null},${'"'+results[0].street+'"' || null},${'"'+results[0].neighborhood+'"' || null},${'"'+results[0].city+'"' || null},${results[0].status || null},${'"'+results[0].email+'"' || null},${'"'+results[0].phone+'"' || null},${'"'+results[0].phone2+'"' || null},${results[0].id});`)

    });
    

})

 
connection.end();