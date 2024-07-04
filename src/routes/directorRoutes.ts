import { Router } from 'express';
import DirectorController from '../controllers/directorController';

const router = Router();

router.get('/', DirectorController.getAllDirectors);
router.get('/:id', DirectorController.getDirectorById);
router.post('/', DirectorController.createDirector);
router.put('/:id', DirectorController.updateDirector);
router.delete('/:id', DirectorController.deleteDirector);

export default router;
