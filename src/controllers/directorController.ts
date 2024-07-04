import { Request, Response } from 'express';
import prisma from './prisma/client';
import { Director } from './types/director';

class DirectorController {
  public async getAllDirectors(req: Request, res: Response): Promise<void> {
    try {
      const directors = await prisma.director.findMany();
      res.status(200).json(directors);
    } catch (error:unknown) {
      const message = error instanceof Error ? error.message : 'Unknown error occurred';
      res.status(500).json({ error: message });
    }
  }

  public async getDirectorById(req: Request, res: Response): Promise<void> {
    const { id } = req.params;
    try {
      const director = await prisma.director.findUnique({
        where: { id: Number(id) },
        include: { classes: true, students: true, subjects: true },
      });
      if (director) {
        res.status(200).json(director);
      } else {
        res.status(404).json({ error: 'Director not found' });
      }
    }  catch (error:unknown) {
      const message = error instanceof Error ? error.message : 'Unknown error occurred';
      res.status(500).json({ error: message });
    }
  }

  public async createDirector(req: Request, res: Response): Promise<void> {
    const { name, phone, email, password }: Director = req.body;
    try {
      const newDirector = await prisma.director.create({
        data: { name, phone, email, password },
      });
      res.status(201).json(newDirector);
    }  catch (error:unknown) {
      const message = error instanceof Error ? error.message : 'Unknown error occurred';
      res.status(500).json({ error: message });
    }
  }

  public async updateDirector(req: Request, res: Response): Promise<void> {
    const { id } = req.params;
    const { name, phone, email, password }: Director = req.body;
    try {
      const updatedDirector = await prisma.director.update({
        where: { id: Number(id) },
        data: { name, phone, email, password },
      });
      res.status(200).json(updatedDirector);
    }  catch (error:unknown) {
      const message = error instanceof Error ? error.message : 'Unknown error occurred';
      res.status(500).json({ error: message });
    }
  }

  public async deleteDirector(req: Request, res: Response): Promise<void> {
    const { id } = req.params;
    try {
      await prisma.director.delete({
        where: { id: Number(id) },
      });
      res.status(204).send();
    }  catch (error:unknown) {
      const message = error instanceof Error ? error.message : 'Unknown error occurred';
      res.status(500).json({ error: message });
    }
  }
}

export default new DirectorController();
