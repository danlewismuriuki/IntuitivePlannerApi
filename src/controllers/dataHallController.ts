import { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export const getAll = async (req: Request, res: Response) => {
  try {
    const dataHalls = await prisma.dataHall.findMany({
      include: {
        customer: true,
        floor: true,
      },
    });
    res.json(dataHalls);
  } catch (error) {
    res.status(500).json({ error: "Error fetching data halls" });
  }
};

export const getByCustomerId = async (req: Request, res: Response) => {
  try {
    const customerId = parseInt(req.params.customerId);
    const dataHalls = await prisma.dataHall.findMany({
      where: { customerId },
      include: {
        customer: true,
        floor: true,
      },
    });
    res.json(dataHalls);
  } catch (error) {
    res.status(500).json({ error: "Error fetching data halls by customer" });
  }
};

export const getById = async (req: Request, res: Response) => {
  try {
    const id = parseInt(req.params.id);
    const dataHall = await prisma.dataHall.findUnique({
      where: { id },
      include: {
        customer: true,
        floor: true,
      },
    });

    if (!dataHall) {
      return res.status(404).json({ error: "Data hall not found" });
    }

    res.json(dataHall);
  } catch (error) {
    res.status(500).json({ error: "Error fetching data hall" });
  }
};

export const create = async (req: Request, res: Response) => {
  try {
    const { name, tilesWidth, tilesLength, customerId, floorId } = req.body;

    console.log(req.body);

    const dataHall = await prisma.dataHall.create({
      data: {
        name,
        tilesWidth,
        tilesLength,
        customerId,
        floorId,
      },
    });

    res.status(201).json(dataHall);
  } catch (error) {
    res.status(500).json({ error: "Error creating data hall" });
  }
};

export const update = async (req: Request, res: Response) => {
  try {
    const id = parseInt(req.params.id);
    const { name, tilesWidth, tilesLength, customerId, floorId } = req.body;

    const dataHall = await prisma.dataHall.update({
      where: { id },
      data: {
        name,
        tilesWidth,
        tilesLength,
        customerId,
        floorId,
      },
    });

    res.json(dataHall);
  } catch (error) {
    res.status(500).json({ error: "Error updating data hall" });
  }
};

export const remove = async (req: Request, res: Response) => {
  try {
    const id = parseInt(req.params.id);

    await prisma.dataHall.delete({
      where: { id },
    });

    res.status(204).send();
  } catch (error) {
    res.status(500).json({ error: "Error deleting data hall" });
  }
};
