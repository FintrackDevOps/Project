const express = require("express");
const app = express();
const cors = require("cors");
const pool = require("./db");

//middleware
app.use(cors());
app.use(express.json()); //req.body

//ROUTES//

//create a transaction

app.post("/transactions", async (req, res) => {
  try {
    const { description, buyvalue, amount, stockabreviation } = req.body;
    console.log("hello " + description + " " + buyvalue + " " + amount + " " + stockabreviation);
    const newTransaction = await pool.query(
      "INSERT INTO finboard (description, buy_value, amount, stock_abreviation) VALUES($1, $2, $3, $4) RETURNING *",
      [description, buyvalue, amount, stockabreviation]
    );

    res.json(newTransaction.rows[0]);
  } catch (err) {
    console.error(err.message);
  }
});

//get all transactions

app.get("/transactions", async (req, res) => {
  try {
    const allTransactions = await pool.query("SELECT * FROM finboard");
    res.json(allTransactions.rows);
  } catch (err) {
    console.error(err.message);
  }
});

//get a transaction

app.get("/transactions/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const transaction = await pool.query("SELECT * FROM finboard WHERE transaction_id = $1", [
      id
    ]);

    res.json(transaction.rows[0]);
  } catch (err) {
    console.error(err.message);
  }
});

//update a transaction

app.put("/transactions/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const { description } = req.body;
    const updateTransaction = await pool.query(
      "UPDATE finboard SET description = $1 WHERE transaction_id = $2",
      [description, id]
    );

    res.json("Transaction was updated!");
  } catch (err) {
    console.error(err.message);
  }
});

//delete a transaction

app.delete("/transactions/:id", async (req, res) => {
  try {
    const { id } = req.params;
    console.log("hello " + description + " " + buyvalue + " " + amount + " " + stockabreviation);
    const deleteTransaction = await pool.query("DELETE FROM finboard WHERE transaction_id = $1", [
      id
    ]);
    res.json("Transaction was deleted!");
  } catch (err) {
    console.log(err.message);
  }
});

app.listen(8000, () => {
  console.log("server has started on port 8000");
});