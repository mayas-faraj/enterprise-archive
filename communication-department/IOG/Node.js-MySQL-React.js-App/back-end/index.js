const express = require('express');
const cors = require('cors');
const mysql = require('mysql');
const PORT = process.env.PORT || 4000;
const app = express();


const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'reactdb'
});

connection.connect( err => {
    if(err){
        return err;
    }
});
    
//console.log(connection);
app.use(cors())

app.get('/', (req, res) =>{
    res.send('go to / user to see users')
});

app.get('/user', (req, res) => {
    const SELECT_ALL_USER_QUERY = 'SELECT * FROM reactdb.user';
    connection.query(SELECT_ALL_USER_QUERY, (err, resultados) => {
        if(err) {
            return res.send(err)
        } else {
            return res.json({
                data: resultados
            });
        }
    });
});

app.get('/user/add', (req, res) => {
    const{ userName, password, name, email, roleID } = req.query
    const INSERT_USER_QUERY = "INSERT INTO reactdb.user (userName,password,name,email,roleID) VALUES ('${username}','${password}','${name}','${email}','${roleID}')";
    //'INSERT INTO reactdb.user(userName, password, name, email, roleID) VALUES('${name}', '${password}', '${name}', '${email}', '${roleID}')';
    connection.query(INSERT_USER_QUERY, (err, resultados) => {
        if(err) {
            return res.send(err)
        } else {
            return res.send('user added with event')
        }
    });
});

app.get('/account', (req, res) => {
    const SELECT_ALL_ACCOUNT_QUERY = 'SELECT * FROM reactdb.accounts';
    connection.query(SELECT_ALL_ACCOUNT_QUERY, (err, resultados) => {
        if(err) {
            return res.send(err)
        } else {
            return res.json({
                data: resultados
            });
        }
    });
});

app.get('/account/free', (req, res) => {
    const SELECT_ALL_FREE_ACCOUNT_QUERY = 'SELECT * FROM reactdb.accounts WHERE status=0';
    connection.query(SELECT_ALL_FREE_ACCOUNT_QUERY, (err, resultados) => {
        if(err) {
            return res.send(err)
        } else {
            return res.json({
                data: resultados
            });
        }
    });
});

app.get('/account/blocked', (req, res) => {
    const SELECT_ALL_BLOCKED_ACCOUNT_QUERY = 'SELECT * FROM reactdb.accounts WHERE status=2';
    connection.query(SELECT_ALL_BLOCKED_ACCOUNT_QUERY, (err, resultados) => {
        if(err) {
            return res.send(err)
        } else {
            return res.json({
                data: resultados
            });
        }
    });
});

app.get('/account/busy', (req, res) => {
    const SELECT_ALL_BUSY_ACCOUNT_QUERY = 'SELECT * FROM reactdb.accounts WHERE status=1';
    connection.query(SELECT_ALL_BUSY_ACCOUNT_QUERY, (err, resultados) => {
        if(err) {
            return res.send(err)
        } else {
            return res.json({
                data: resultados
            });
        }
    });
});

app.get('/account/add', (req, res) => {
    
    const name = req.query.body.name || "";
    const url = req.body.url || "";
    const initDate = req.body.initDate || "";
    const status = req.body.status || "0";
    const mobileNumber = req.body.mobileNumber || "";
    const email = req.body.email || "";
    const password = req.body.password || "";
    //const{ name, url, initDate, status, mobileNumber, email, password } = req.query
    const INSERT_ACCOUNT_QUERY = 'INSERT INTO reactdb.accounts ( name, url, initDate, status, mobileNumber, email, password ) VALUES ('+name+','+url+','+initDate+','+status+','+mobileNumber+','+email+','+password+')';
    //'INSERT INTO reactdb.user(userName, password, name, email, roleID) VALUES('${name}', '${password}', '${name}', '${email}', '${roleID}')';
    connection.query(INSERT_ACCOUNT_QUERY, (err, resultados) => {
        if(err) {
            return res.send(err)
        } else {
            return res.send(req.body)
            return res.send('account added with event')
        }
    });
});

app.get('/account/delete', (req, res) => {
    const{ account_id } = req.query
    const DELETE_ACCOUNT_QUERY = "Delete FROM reactdb.accounts WHERE id=$account_id";
    //'INSERT INTO reactdb.user(userName, password, name, email, roleID) VALUES('${name}', '${password}', '${name}', '${email}', '${roleID}')';
    connection.query(DELETE_ACCOUNT_QUERY, (err, resultados) => {
        if(err) {
            return res.send(err)
        } else {
            return res.send('account deleted with event')
        }
    });
});

app.get('/account/update', (req, res) => {
    const{ account_id, name, url, initDate, status, mobileNumber, email, password } = req.query
    const UPDATE_ACCOUNT_QUERY = "UPDATE reactdb.accounts SET name='$name',url='$url',initDate='$initDate',status='$status',mobileNumber='$mobileNumber',email='$email',password='$password' WHERE id=$account_id;";
    //'INSERT INTO reactdb.user(userName, password, name, email, roleID) VALUES('${name}', '${password}', '${name}', '${email}', '${roleID}')';
    connection.query(UPDATE_ACCOUNT_QUERY, (err, resultados) => {
        if(err) {
            return res.send(err)
        } else {
            return res.send('account updated with event')
        }
    });
});

app.get('/account/byname', (req, res) => {
    const{ name } = req.query
    const SELECT_ACCOUNT_BY_NAME_QUERY = 'SELECT * FROM reactdb.accounts WHERE name CONTAINS $name';
    connection.query(SELECT_ACCOUNT_BY_NAME_QUERY, (err, resultados) => {
        if(err) {
            return res.send(err)
        } else {
            return res.json({
                data: resultados
            });
        }
    });
});

app.get('/account/byinitDate', (req, res) => {
    const{ startDate,endDate } = req.query
    const SELECT_ACCOUNT_BY_DATE_QUERY = 'SELECT * FROM reactdb.accounts WHERE initDate BETWEEN $startDate AND $endDate';
    connection.query(SELECT_ACCOUNT_BY_DATE_QUERY, (err, resultados) => {
        if(err) {
            return res.send(err)
        } else {
            return res.json({
                data: resultados
            });
        }
    });
});

app.get('/account/bymobile', (req, res) => {
    const{ mobileNumber } = req.query
    const SELECT_ACCOUNT_BY_MOBILE_QUERY = 'SELECT * FROM reactdb.accounts WHERE mobileNumber CONTAINS $mobileNumber';
    connection.query(SELECT_ACCOUNT_BY_MOBILE_QUERY, (err, resultados) => {
        if(err) {
            return res.send(err)
        } else {
            return res.json({
                data: resultados
            });
        }
    });
});

app.get('/account/byemail', (req, res) => {
    const{ email } = req.query
    const SELECT_ACCOUNT_BY_NAME_QUERY = 'SELECT * FROM reactdb.accounts WHERE email CONTAINS $email';
    connection.query(SELECT_ACCOUNT_BY_NAME_QUERY, (err, resultados) => {
        if(err) {
            return res.send(err)
        } else {
            return res.json({
                data: resultados
            });
        }
    });
});

app.get('/category', (req, res) => {
    const SELECT_ALL_CATRGORY_QUERY = 'SELECT * FROM reactdb.category';
    connection.query(SELECT_ALL_CATEGORY_QUERY, (err, resultados) => {
        if(err) {
            return res.send(err)
        } else {
            return res.json({
                data: resultados
            });
        }
    });
});

app.get('/category/add', (req, res) => {
    const{ description } = req.query
    const INSERT_CATEGORY_QUERY = "INSERT INTO reactdb.category (description) VALUES ('${description}')";
    connection.query(INSERT_CATEGORY_QUERY, (err, resultados) => {
        if(err) {
            return res.send(err)
        } else {
            return res.send('category added with event')
        }
    });
});

app.get('/category/delete', (req, res) => {
    const{ category_id } = req.query
    const DELETE_CATEGORY_QUERY = "Delete FROM reactdb.category WHERE id=$category_id";
    connection.query(DELETE_CATEGORY_QUERY, (err, resultados) => {
        if(err) {
            return res.send(err)
        } else {
            return res.send('category deleted with event')
        }
    });
});

app.get('/category/update', (req, res) => {
    const{ category_id,description } = req.query
    const UPDATE_CATEGORY_QUERY = "UPDATE reactdb.category SET description='$description' WHERE id=$category_id;";
    connection.query(UPDATE_CATEGORY_QUERY, (err, resultados) => {
        if(err) {
            return res.send(err)
        } else {
            return res.send('category updated with event')
        }
    });
});

app.get('/account_category/add', (req, res) => {
    const{ account_id,category_id } = req.query
    const INSERT_ACCOUNT_CATEGORY_QUERY = "INSERT INTO reactdb.account_category (accountID,categoryID) VALUES ('${account_id}','${category_id}')";
    connection.query(INSERT_ACCOUNT_CATEGORY_QUERY, (err, resultados) => {
        if(err) {
            return res.send(err)
        } else {
            return res.send('category of account added with event')
        }
    });
});

app.get('/account_category/delete', (req, res) => {
    const{ account_category_id } = req.query
    const DELETE_ACCOUNT_CATEGORY_QUERY = "Delete FROM reactdb.account_category WHERE id=$account_category_id";
    connection.query(DELETE_ACCOUNT_CATEGORY_QUERY, (err, resultados) => {
        if(err) {
            return res.send(err)
        } else {
            return res.send('category of account deleted with event')
        }
    });
});

app.listen(PORT, () => {
    console.log('the server is running on port 4000')
});