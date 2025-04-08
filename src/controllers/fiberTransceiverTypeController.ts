import { PrismaClient } from "@prisma/client";
import { Request, Response } from "express";
import lodash from "lodash";

const prisma = new PrismaClient();

export const getAll = async (req: Request, res: Response): Promise<void> => {
  try {
    const data = await prisma.fiberTransceiverType.findMany({
      include: {
        customer: true,
        dataHall: true,
      },
    });
    res.json(data);
  } catch (error) {
    res.status(500).json({ error: "Error on getAll: fiberTransceiverType" });
  }
};

export const getById = async (req: Request, res: Response): Promise<void> => {
  const { id } = req.params;
  try {
    const data = await prisma.fiberTransceiverType.findUnique({
      where: { id: Number(id) },
      include: {
        customer: true,
        dataHall: true,
      },
    });
    if (data) {
      res.json(data);
    } else {
      res.status(404).json({ error: "Not found" });
    }
  } catch (error) {
    res.status(500).json({ error: "Error on getById: fiberTransceiverType" });
  }
};

export const getByCustomerAndDataHallId = async (
  req: Request,
  res: Response
): Promise<void> => {
  const { customerId, dataHallId } = req.params;
  try {
    const data = await prisma.fiberTransceiverType.findMany({
      where: {
        customerId: Number(customerId),
        dataHallId: Number(dataHallId),
      },
      include: {
        customer: true,
        dataHall: true,
      },
    });
    res.json(data);
  } catch (error) {
    res.status(500).json({
      error: "Error on getByCustomerAndDataHallId: fiberTransceiverType",
    });
  }
};

export const create = async (req: Request, res: Response): Promise<void> => {
  const body = req.body;

  try {
    const data = await prisma.fiberTransceiverType.create({
      data: {
        ...body,
      },
    });
    res.status(201).json(data);
  } catch (error) {
    res.status(500).json({ error: "Error on create: fiberTransceiverType" });
  }
};

export const update = async (req: Request, res: Response): Promise<void> => {
  const { id } = req.params;
  const {
    name,
    transceiverType,
    transceiverPowerDraw,
    transceiverCost,
    location,
    isInGpu,
    isInCPU,
    isInLeafSwitch,
    isInSpineSwitch,
    isInSuperSpineSwitch,
  } = req.body;

  const currentId = Number(id);
  const found = await prisma.fiberTransceiverType.findUnique({
    where: { id: Number(id) },
    include: {
      customer: false,
      dataHall: false,
    },
  });

  if (isNaN(currentId)) {
    res.status(400).json({ error: "Invalid ID format" });
  } else if (!found) {
    res.status(404).json({ error: "ID not found" });
  } else {
    try {
      const data = await prisma.fiberTransceiverType.update({
        where: { id: Number(id) },
        data: {
          name,
          transceiverType,
          transceiverPowerDraw,
          transceiverCost,
          location,
          isInGpu,
          isInCPU,
          isInLeafSwitch,
          isInSpineSwitch,
          isInSuperSpineSwitch,
        },
      });
      res.json(data);
    } catch (error) {
      console.log(error);
      res.status(500).json({ error: "Error on update: fiberTransceiverType" });
    }
  }
};

export const remove = async (req: Request, res: Response): Promise<void> => {
  const { id } = req.params;
  try {
    await prisma.fiberTransceiverType.delete({
      where: { id: Number(id) },
    });
    res.status(204).send();
  } catch (error) {
    res.status(500).json({ error: "Error on remove: fiberTransceiverType" });
  }
};
