import { PrismaClient } from "@prisma/client";
import { Request, Response } from "express";

const prisma = new PrismaClient();

export const getAll = async (req: Request, res: Response): Promise<void> => {
  try {
    const data = await prisma.cpuComputeRack.findMany({
      include: {
        customer: true, dataHall: true, rack: true
      }
    });
    res.json(data);
  } catch (error) {
    res.status(500).json({ error: "Error on getAll: cpuComputeRack" });
  }
};

export const getById = async (req: Request, res: Response): Promise<void> => {
  const { id } = req.params;
  try {
    const data = await prisma.cpuComputeRack.findUnique({
      where: { id: Number(id) },
      include: {
        customer: true, dataHall: true, rack: true
      }
    });
    if (data) {
      res.json(data);
    } else {
      res.status(404).json({ error: "Not found" });
    }
  } catch (error) {
    res.status(500).json({ error: "Error on getById: cpuComputeRack" });
  }
};

export const getByCustomerAndDataHallId = async (
  req: Request,
  res: Response
): Promise<void> => {
  const { customerId, dataHallId } = req.params;
  try {
    const data = await prisma.cpuComputeRack.findMany({
      where: {
        customerId: Number(customerId),
        dataHallId: Number(dataHallId),
      },
      include: {
        customer: true, dataHall: true, rack: true
      }
    });
    res.json(data);
  } catch (error) {
    res.status(500).json({
      error: "Error on getByCustomerAndDataHallId: cpuComputeRack",
    });
  }
};

export const create = async (req: Request, res: Response): Promise<void> => {
  const body = req.body;

  try {
    const data = await prisma.cpuComputeRack.create({
      data: {
        ...body,
      },
    });
    res.status(201).json(data);
  } catch (error) {
    res.status(500).json({ error: "Error on create: cpuComputeRack" });
  }
};

export const update = async (req: Request, res: Response): Promise<void> => {
  const { id } = req.params;
  const body = req.body;

  const currentId = Number(id);
  const found = await prisma.cpuComputeRack.findUnique({
    where: { id: Number(id) },
  });

  if (isNaN(currentId)) {
    res.status(400).json({ error: "Invalid ID format" });
  } else if (!found) {
    res.status(404).json({ error: "ID not found" });
  } else {
    try {
      const data = await prisma.cpuComputeRack.update({
        where: { id: Number(id) },
        data: {
          ...body,
        },
      });
      res.json(data);
    } catch (error) {
      res.status(500).json({ error: "Error on update: cpuComputeRack" });
    }
  }
};

export const remove = async (req: Request, res: Response): Promise<void> => {
  const { id } = req.params;
  try {
    await prisma.cpuComputeRack.delete({
      where: { id: Number(id) },
    });
    res.status(204).send();
  } catch (error) {
    res.status(500).json({ error: "Error on remove: cpuComputeRack" });
  }
};