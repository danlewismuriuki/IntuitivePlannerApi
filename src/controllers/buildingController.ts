import { PrismaClient } from "@prisma/client";
import { Request, Response } from "express";

const prisma = new PrismaClient();

export const getAll = async (req: Request, res: Response): Promise<void> => {
  try {
    const data = await prisma.building.findMany({
      select: {
        _count: true,
        customer: true,
        customerId: true,
        floors: true,
        id: true,
        name: true,
        site: true,
        siteId: true,
      },
    });
    res.json(data);
  } catch (error) {
    res.status(500).json({ error: "Error on getAll: building" });
  }
};

export const getById = async (req: Request, res: Response): Promise<void> => {
  const { id } = req.params;
  try {
    const data = await prisma.building.findUnique({
      where: { id: Number(id) },
      include: {
        _count: true,
        customer: true,
        floors: true,
        site: true,
      },
    });
    if (data) {
      res.json(data);
    } else {
      res.status(404).json({ error: "Not found" });
    }
  } catch (error) {
    res.status(500).json({ error: "Error on getById: building" });
  }
};

export const getByCustomerId = async (
  req: Request,
  res: Response
): Promise<void> => {
  const { customerId } = req.params;
  try {
    const data = await prisma.building.findMany({
      where: {
        customerId: Number(customerId),
      },
      include: {
        _count: true,
        customer: true,
        floors: true,
        site: true,
      },
    });
    res.json(data);
  } catch (error) {
    res.status(500).json({
      error: "Error on getByCustomerId: building",
    });
  }
};

export const create = async (req: Request, res: Response): Promise<void> => {
  const { name, siteId, customerId } = req.body;
  try {
    const data = await prisma.building.create({
      data: {
        name: name,
        siteId: Number(siteId),
        customerId: Number(customerId),
      },
    });
    res.status(201).json(data);
  } catch (error) {
    res.status(500).json({ error: "Error on create: building" });
  }
};

export const update = async (req: Request, res: Response): Promise<void> => {
  const { id } = req.params;
  const { name, siteId } = req.body;

  const currentId = Number(id);
  const found = await prisma.building.findUnique({
    where: { id: Number(id) },
  });

  if (isNaN(currentId)) {
    res.status(400).json({ error: "Invalid ID format" });
  } else if (!found) {
    res.status(404).json({ error: `ID not found` });
  } else {
    try {
      const data = await prisma.building.update({
        where: { id: Number(id) },
        data: {
          name: name,
          siteId: Number(siteId),
        },
      });
      res.json(data);
    } catch (error) {
      res.status(500).json({ error: "Error on update: building" });
    }
  }
};

export const remove = async (req: Request, res: Response): Promise<void> => {
  const { id } = req.params;
  try {
    await prisma.building.delete({
      where: { id: Number(id) },
    });
    res.status(204).send();
  } catch (error) {
    res.status(500).json({ error: "Error on remove: building" });
  }
};
