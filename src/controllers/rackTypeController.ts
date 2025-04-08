import { PrismaClient } from "@prisma/client";
import { Request, Response } from "express";

const prisma = new PrismaClient();

export const getAll = async (req: Request, res: Response): Promise<void> => {
  try {
    const data = await prisma.rackType.findMany({
      include: {
        racks: true,
      },
    });
    res.json(data);
  } catch (error) {
    res.status(500).json({ error: "Error on getAll: rackType" });
  }
};

export const getById = async (req: Request, res: Response): Promise<void> => {
  const { id } = req.params;
  try {
    const data = await prisma.rackType.findUnique({
      where: { id: Number(id) },
      include: {
        racks: true,
      },
    });
    if (data) {
      res.json(data);
    } else {
      res.status(404).json({ error: "Not found" });
    }
  } catch (error) {
    res.status(500).json({ error: "Error on getById: rackType" });
  }
};

export const create = async (req: Request, res: Response): Promise<void> => {
  const { name } = req.body;

  try {
    const data = await prisma.rackType.create({
      data: {
        name,
      },
    });
    res.status(201).json(data);
  } catch (error) {
    console.error("Error details:", error);
    res.status(500).json({ error: "Error on create: rackType" });
  }
};

export const update = async (req: Request, res: Response): Promise<void> => {
  const { id } = req.params;
  const { name } = req.body;

  try {
    // First check if the record exists
    const existing = await prisma.rackType.findUnique({
      where: { id: Number(id) },
    });

    if (!existing) {
      res.status(404).json({ error: "RackType not found" });
      return;
    }

    const data = await prisma.rackType.update({
      where: { 
        id: Number(id) 
      },
      data: {
        name,
      },
    });
    res.json(data);
  } catch (error) {
    console.error("Update error:", error);
    res.status(500).json({ error: "Error on update: rackType" });
  }
};

export const remove = async (req: Request, res: Response): Promise<void> => {
  const { id } = req.params;
  try {
    await prisma.rackType.delete({
      where: { id: Number(id) },
    });
    res.status(204).send();
  } catch (error) {
    res.status(500).json({ error: "Error on remove: rackType" });
  }
};