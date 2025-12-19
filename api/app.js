require('dotenv').config();
const app = require('express')();
const mongoose = require('mongoose');

const port = process.env.PORT || 3000;
const mongoURI = process.env.mongoURI;

//connect to mongodb
mongoose.connect(mongoURI).then(() => {
  console.log('Connected to MongoDB');
}).catch((err) => {
  console.log(err);
});

app.get('/', (req, res) => {
  res.send('Api is working');
});

app.get('/apihealth', async (req, res) => {
  try {
    const db = mongoose.connection.db;
    const testCollection = db.collection('test');

    const data = {
      status: 'healthy',
      timestamp: new Date(),
      message: 'API health check successful'
    };

    await testCollection.insertOne(data);

    res.json({ success: true, message: 'Data inserted successfully', data });
  } catch (err) {
    res.status(500).json({ success: false, error: err.message });
  }
});

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});