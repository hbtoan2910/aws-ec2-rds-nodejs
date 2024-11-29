const express = require('express')
const morgan = require('morgan') //use to log out requests
const mysql = require('mysql2') //use to connect with SQL server, in this case: app <> Amazon RDS <> MySql db
require('dotenv').config();

const fs = require('fs')
var path = require('path')

const app = express()

// Middleware to parse JSON request body
app.use(express.json());

// Create a write stream (in append mode) to log out requests data in log file
var accessLogStream = fs.createWriteStream(path.join(__dirname, 'ryan_access.log'), { flags: 'a' })
 
// app.use(morgan(':method :url :status :res[content-length] - :response-time ms'))
// Create own customed format to log out requests data in console
app.use(morgan(function (tokens, req, res) {
  const currentTime = new Date().toLocaleString();
  return [
    `Time: [${currentTime}]`,
    `Method: [${tokens.method(req, res)}]`,
    `--- URL: [${tokens.url(req, res)}]`,
    `--- Status: [${tokens.status(req, res)}]`,
    `--- Content-Length: [${tokens.res(req, res, 'content-length') || '0'}]`,
    `--- Response-Time: [${tokens['response-time'](req, res)} ms]`
  ].join(' ')
}, { stream: accessLogStream }))

const pool = mysql.createPool({
  host: process.env.MYSQL_HOST,
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD,
  database: process.env.MYSQL_DATABASE,
  port: 3306, // Add this line
  connectTimeout: 10000, // Optional: Increase timeout
  multipleStatements: true,
})
// Path to the SQL file
const sqlFilePath = './database.sql';

pool.query('SELECT 1', (err, results) => {
  if (err) {
    console.error('Database connection failed:', err.message);
  } else {
    console.log('Database connection successful:', results);
  }
});

// Read and execute the SQL file
/*
fs.readFile(sqlFilePath, 'utf8', (err, sql) => {
  if (err) {
    console.error('Error reading the SQL file:', err.message);
    return;
  }
//Let's run this query to populate database with content in sql file: 
//create database named 'lotr' with 1 table named 'characters' and popuplate it with 51 records
  pool.query(sql, (err, results) => {
    if (err) {
      console.error('SQL Execution Error:', err.message, err.stack);
      return;
    }
    console.log('Database initialized:', results);
    pool.end(); // Close the connection pool
  });
})
*/ 

// Function to get details of a character in the database
async function getCharacterDetailsByName(name) {
  const [characters] = await pool.promise().query("SELECT * FROM characters WHERE name = ?", [name]);
  return characters[0]?.details;
}

// Function to insert a new character into the database
async function createCharacter(name, details) {
  const [result] = await pool.promise().query(
    "INSERT INTO characters (name, details) VALUES (?, ?)",
    [name, details]
  );
  return result;
}

app.get("/", async (req, res) => {
  res.send("<h1>HOME PAGE ✌😁😜</h1>")  
})

//use this as Health Checks for your Load Balancer
app.get("/test", (req, res) => {
  res.send("<h1>It's working - RyanInstance 01 (Origin) 🤗</h1>")
})

app.get("/character/:name", async(req, res) => {
  const detail = await getCharacterDetailsByName(req.params?.name)
  res.send(`Details of character ${req.params?.name} is: ${detail}`)
})

app.post("/character/create", async(req, res) => {
  const { name, details } = req.body;

   // Validate the input
   if (!name || !details) {
    return res.status(400).json({ error: "Name and details are required." });
  }

  try {
    const result = await createCharacter(name, details);
    res.status(201).json({
      message: "Character created successfully",
      characterId: result.insertId, // Returns the ID of the newly inserted character
    });
  } catch (err) {
    console.error("Error creating characcter:", err.message);
    res.status(500).json({ error: "Failed to create character." });
  }
})

const quotes = [
"Life is short, break the rules",
"Life is not a matter of holding good cards, but of playing a poor hand well",
"The best and most beautiful things in the world cannot be seen or even touched - they must be felt with the heart",
"Life is 10% what happens to me and 90% of how I react to it",
"The purpose of life, after all, is to live it, to taste experience to the utmost, to reach out eagerly and without fear for newer and richer experience",
"Life is a journey, not a destination",
"What we do in life echoes in eternity",
"Live in the sunshine, swim the sea, drink the wild air",
"The greatest glory in living lies not in never falling, but in rising every time we fall",
"Life is too short to waste time hating anyone",
"Don't be afraid to give up the good to go for the great",
"The future belongs to those who believe in the beauty of their dream"
]

app.get("/random-quote", (req, res) => {
  const randomIndex = Math.floor(Math.random() * quotes.length);
  const randomQuote = quotes[randomIndex];
  res.json(randomQuote);
})

const port = process.env.PORT || 3000
app.listen(port, () => console.log(`Server is listening on port ${port}...`))