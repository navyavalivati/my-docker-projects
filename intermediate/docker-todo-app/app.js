const express = require('express');
const mysql = require('mysql2/promise');
const app = express();
const port = 3000;

app.use(express.json());

const dbConfig = {
    host: 'db',
    user: 'root',
    password: 'password',
    database: 'todo_db'
};

// Wait for MySQL to be ready with retries
async function waitForDatabase() {
    let attempts = 0;
    const maxAttempts = 10;
    while (attempts < maxAttempts) {
        try {
            const connection = await mysql.createConnection(dbConfig);
            await connection.execute('SELECT 1');
            await connection.end();
            console.log('Database is ready!');
            return;
        } catch (error) {
            attempts++;
            console.log(`Waiting for database... Attempt ${attempts}/${maxAttempts}`);
            await new Promise(resolve => setTimeout(resolve, 2000)); // Wait 2 seconds
        }
    }
    throw new Error('Database connection failed after max attempts');
}

// Initialize the database
async function initializeDatabase() {
    await waitForDatabase(); // Wait until DB is ready
    const connection = await mysql.createConnection(dbConfig);
    await connection.execute(`
        CREATE TABLE IF NOT EXISTS tasks (
            id INT AUTO_INCREMENT PRIMARY KEY,
            task VARCHAR(255) NOT NULL
        )
    `);
    await connection.end();
    console.log('Database initialized!');
}

// Start the app
initializeDatabase()
    .then(() => {
        app.post('/tasks', async (req, res) => {
            const { task } = req.body;
            if (!task) return res.status(400).send('Task is required');
            const connection = await mysql.createConnection(dbConfig);
            const [result] = await connection.execute('INSERT INTO tasks (task) VALUES (?)', [task]);
            await connection.end();
            res.status(201).send({ id: result.insertId, task });
        });

        app.get('/tasks', async (req, res) => {
            const connection = await mysql.createConnection(dbConfig);
            const [rows] = await connection.execute('SELECT * FROM tasks');
            await connection.end();
            res.json(rows);
        });

        app.listen(port, () => {
            console.log(`App running on http://localhost:${port}`);
        });
    })
    .catch(err => {
        console.error('Failed to initialize app:', err);
        process.exit(1); // Exit with error code if initialization fails
    });