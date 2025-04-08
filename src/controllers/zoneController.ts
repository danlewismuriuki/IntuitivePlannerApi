import { PrismaClient } from "@prisma/client";
import { Request, Response } from "express";

const prisma = new PrismaClient();

export const getAll = async (req: Request, res: Response): Promise<void> => {
  try {
    const data = await prisma.zone.findMany({
      include: {
        customer: true,
        dataHall: true,
      },
    });
    res.json(data);
  } catch (error) {
    res.status(500).json({ error: "Error on getAll: zone" });
  }
};

export const getById = async (req: Request, res: Response): Promise<void> => {
  const { id } = req.params;
  try {
    const data = await prisma.zone.findUnique({
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
    res.status(500).json({ error: "Error on getById: zone" });
  }
};

export const getByCustomerAndDataHallId = async (
  req: Request,
  res: Response
): Promise<void> => {
  const { customerId, dataHallId } = req.params;
  try {
    const data = await prisma.zone.findMany({
      where: {
        customerId: Number(customerId),
        dataHallId: Number(dataHallId),
      },
      include: {
        zoneType: true,
        customer: true,
        dataHall: true,
      },
    });
    res.json(data);
  } catch (error) {
    res.status(500).json({
      error: "Error on getByCustomerAndDataHallId: zone",
    });
  }
};

export const create = async (req: Request, res: Response): Promise<Response> => {
  const {
    name,
    numberOfScalableUnits,
    numberOfRacks,
    numberOfTilesBetweenScalableUnitRows,
    numberOfTilesBetwenScalableUnits,
    customerId,
    dataHallId,
    zoneTypeId,
  } = req.body;

  // Check if all required fields are provided
  if (!name || !customerId || !dataHallId || !zoneTypeId) {
    return res.status(400).json({ error: 'Missing required fields' });
  }

  try {
    // Attempt to create the zone
    const newZone = await prisma.zone.create({
      data: {
        name,
        numberOfScalableUnits,
        numberOfRacks,
        numberOfTilesBetweenScalableUnitRows,
        numberOfTilesBetwenScalableUnits,
        customerId,
        dataHallId,
        zoneTypeId,
      },
    });

    return res.status(201).json(newZone);  // Ensure you return the response
  } catch (error: unknown) {  // 'error' is now typed as 'unknown'
    if (error instanceof Error) {
      // Now we know 'error' is of type 'Error', and we can access 'message'
      console.error('Error creating zone:', error.message);
      return res.status(500).json({ error: 'Error on create: zone', details: error.message });
    } else {
      // If the error is not an instance of Error, provide a generic message
      console.error('Unknown error:', error);
      return res.status(500).json({ error: 'Error on create: zone', details: 'An unknown error occurred' });
    }
  }
};

export const update = async (req: Request, res: Response): Promise<void> => {
  const { id } = req.params;
  const body = req.body;

  const currentId = Number(id);
  const found = await prisma.zone.findUnique({
    where: { id: Number(id) },
  });

  if (isNaN(currentId)) {
    res.status(400).json({ error: "Invalid ID format" });
  } else if (!found) {
    res.status(404).json({ error: "ID not found" });
  } else {
    try {
      const data = await prisma.zone.update({
        where: { id: Number(id) },
        data: {
          ...body,
        },
      });
      res.json(data);
    } catch (error) {
      res.status(500).json({ error: "Error on update: zone" });
    }
  }
};

export const remove = async (req: Request, res: Response): Promise<void> => {
  const { id } = req.params;
  try {
    await prisma.zone.delete({
      where: { id: Number(id) },
    });
    res.status(204).send();
  } catch (error) {
    res.status(500).json({ error: "Error on remove: zone" });
  }
};
