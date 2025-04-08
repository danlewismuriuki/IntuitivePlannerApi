import { PrismaClient } from "@prisma/client";
import { Request, Response } from "express";

const prisma = new PrismaClient();

export const getAll = async (req: Request, res: Response): Promise<void> => {
  try {
    const data = await prisma.networkRoom.findMany({
      select: {
        id: true,
        name: true,
        tilesWidth: true,
        tilesLength: true,
        customerId: true,
        customer: true,
        floorId: true,
        floor: true,
      },
    });
    res.json(data);
  } catch (error) {
    res.status(500).json({ error: "Error on getAll: networkRoom" });
  }
};

export const getById = async (req: Request, res: Response): Promise<void> => {
  const { id } = req.params;
  try {
    const data = await prisma.networkRoom.findUnique({
      where: { id: Number(id) },
      include: {
        customer: true,
        floor: true,
      },
    });
    if (data) {
      res.json(data);
    } else {
      res.status(404).json({ error: "Not found" });
    }
  } catch (error) {
    res.status(500).json({ error: "Error on getById: networkRoom" });
  }
};

export const getByCustomerId = async (
  req: Request,
  res: Response
): Promise<void> => {
  const { customerId } = req.params;
  try {
    const data = await prisma.networkRoom.findMany({
      where: {
        customerId: Number(customerId),
      },
      include: {
        customer: true,
      },
    });
    res.json(data);
  } catch (error) {
    res.status(500).json({
      error: "Error on getByCustomerId: networkRoom",
    });
  }
};

export const create = async (req: Request, res: Response): Promise<void> => {
  const { name, tilesWidth, tilesLength, customerId, floorId } = req.body;
  try {
    const data = await prisma.networkRoom.create({
      data: {
        name: name,
        tilesWidth: Number(tilesWidth),
        tilesLength: Number(tilesLength),
        customerId: Number(customerId),
        floorId: Number(floorId),
      },
    });
    res.status(201).json(data);
  } catch (error) {
    res.status(500).json({ error: "Error on create: networkRoom" });
  }
};

export const update = async (req: Request, res: Response): Promise<void> => {
  const { id } = req.params;
  const { name, tilesWidth, tilesLength, customerId, floorId } = req.body;

  const currentId = Number(id);
  const found = await prisma.networkRoom.findUnique({
    where: { id: Number(id) },
  });

  if (isNaN(currentId)) {
    res.status(400).json({ error: "Invalid ID format" });
  } else if (!found) {
    res.status(404).json({ error: `ID not found` });
  } else {
    try {
      const data = await prisma.networkRoom.update({
        where: { id: Number(id) },
        data: {
          name: name,
          tilesWidth: Number(tilesWidth),
          tilesLength: Number(tilesLength),
          customerId: Number(customerId),
          floorId: Number(floorId),
        },
      });
      res.json(data);
    } catch (error) {
      res.status(500).json({ error: "Error on update: networkRoom" });
    }
  }
};

export const remove = async (req: Request, res: Response): Promise<void> => {
  const { id } = req.params;
  try {
    await prisma.networkRoom.delete({
      where: { id: Number(id) },
    });
    res.status(204).send();
  } catch (error) {
    res.status(500).json({ error: "Error on remove: networkRoom" });
  }
};
