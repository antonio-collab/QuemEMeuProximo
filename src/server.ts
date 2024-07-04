import express from 'express';
import directorRoutes from './routes/directorRoutes';

const app = express();

app.use(express.json());
app.use('/directors', directorRoutes);

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
