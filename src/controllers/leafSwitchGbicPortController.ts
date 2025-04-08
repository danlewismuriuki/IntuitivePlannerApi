import { PrismaClient } from "@prisma/client";
import { Request, Response } from "express";

const prisma = new PrismaClient();

export const getAll = async (req: Request, res: Response): Promise<void> => {
  try {
    const data = await prisma.leafSwitchGbicPort.findMany({
      include: {
        customer: true, dataHall: true
      }
    });
    res.json(data);
  } catch (error) {
    res.status(500).json({ error: "Error on getAll: leafSwitchGbicPort" });
  }
};

export const getById = async (req: Request, res: Response): Promise<void> => {
  const { id } = req.params;
  try {
    const data = await prisma.leafSwitchGbicPort.findUnique({
      where: { id: Number(id) },
      include: {
        customer: true, dataHall: true
      }
    });
    if (data) {
      res.json(data);
    } else {
      res.status(404).json({ error: "Not found" });
    }
  } catch (error) {
    res.status(500).json({ error: "Error on getById: leafSwitchGbicPort" });
  }
};

export const getByCustomerAndDataHallId = async (
  req: Request,
  res: Response
): Promise<void> => {
  const { customerId, dataHallId } = req.params;
  try {
    const data = await prisma.leafSwitchGbicPort.findMany({
      where: {
        customerId: Number(customerId),
        dataHallId: Number(dataHallId),
      },
      include: {
        customer: true, dataHall: true
      }
    });
    res.json(data);
  } catch (error) {
    res.status(500).json({
      error: "Error on getByCustomerAndDataHallId: leafSwitchGbicPort",
    });
  }
};

export const create = async (req: Request, res: Response): Promise<void> => {
  const body = req.body;

  try {
    const data = await prisma.leafSwitchGbicPort.create({
      data: {
        ...body,
      },
    });
    res.status(201).json(data);
  } catch (error) {
    res.status(500).json({ error: "Error on create: leafSwitchGbicPort" });
  }
};

export const update = async (req: Request, res: Response): Promise<void> => {
  const { id } = req.params;
  const body = req.body;

  const currentId = Number(id);
  const found = await prisma.leafSwitchGbicPort.findUnique({
    where: { id: Number(id) },
  });

  if (isNaN(currentId)) {
    res.status(400).json({ error: "Invalid ID format" });
  } else if (!found) {
    res.status(404).json({ error: "ID not found" });
  } else {
    try {
      const data = await prisma.leafSwitchGbicPort.update({
        where: { id: Number(id) },
        data: {
          ...body,
        },
      });
      res.json(data);
    } catch (error) {
      res.status(500).json({ error: "Error on update: leafSwitchGbicPort" });
    }
  }
};

export const remove = async (req: Request, res: Response): Promise<void> => {
  const { id } = req.params;
  try {
    await prisma.leafSwitchGbicPort.delete({
      where: { id: Number(id) },
    });
    res.status(204).send();
  } catch (error) {
    res.status(500).json({ error: "Error on remove: leafSwitchGbicPort" });
  }
};