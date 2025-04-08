import { PrismaClient } from "@prisma/client";
import { Request, Response } from "express";

const prisma = new PrismaClient();

export const getAll = async (req: Request, res: Response): Promise<void> => {
  try {
    const data = await prisma.zoneType.findMany({});
    res.json(data);
  } catch (error) {
    res.status(500).json({ error: "Error on getAll: zoneType" });
  }
};

export const getById = async (req: Request, res: Response): Promise<void> => {
  const { id } = req.params;
  try {
    const data = await prisma.zoneType.findUnique({
      where: { id: Number(id) },
    });
    if (data) {
      res.json(data);
    } else {
      res.status(404).json({ error: "Not found" });
    }
  } catch (error) {
    res.status(500).json({ error: "Error on getById: zoneType" });
  }
};

export const create = async (req: Request, res: Response): Promise<void> => {
  const body = req.body;
  console.log("Request Body:", body);
  try {
    const data = await prisma.zoneType.create({
      data: {
        ...body,
      },
    });
    res.status(201).json(data);
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: "Error on create: zoneType" });
  }
};

export const update = async (req: Request, res: Response): Promise<void> => {
  const { id } = req.params;
  const body = req.body;

  const currentId = Number(id);
  const found = await prisma.zoneType.findUnique({
    where: { id: Number(id) },
  });

  if (isNaN(currentId)) {
    res.status(400).json({ error: "Invalid ID format" });
  } else if (!found) {
    res.status(404).json({ error: "ID not found" });
  } else {
    try {
      const data = await prisma.zoneType.update({
        where: { id: Number(id) },
        data: {
          ...body,
        },
      });
      res.json(data);
    } catch (error) {
      res.status(500).json({ error: "Error on update: zoneType" });
    }
  }
};

export const remove = async (req: Request, res: Response): Promise<void> => {
  const { id } = req.params;
  try {
    await prisma.zoneType.delete({
      where: { id: Number(id) },
    });
    res.status(204).send();
  } catch (error) {
    res.status(500).json({ error: "Error on remove: zoneType" });
  }
};
