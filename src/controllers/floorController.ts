import { PrismaClient } from "@prisma/client";
import { Request, Response } from "express";

const prisma = new PrismaClient();

export const getAll = async (req: Request, res: Response): Promise<void> => {
    try {
        const data = await prisma.floor.findMany({
            select: {
                _count: true,
                customer: true,
                customerId: true,
                building: true,
                buildingId: true,
                dataHalls: true,
                id: true,
                lengthMeters: true,
                name: true,
                widthMeters: true,
            },
        });
        res.json(data);
    } catch (error) {
        res.status(500).json({ error: "Error on getAll: floor" });
    }
};

export const getById = async (req: Request, res: Response): Promise<void> => {
    const { id } = req.params;
    try {
        const data = await prisma.floor.findUnique({
            where: { id: Number(id) },
            include: {
                _count: true,
                customer: true,
                building: true,
                dataHalls: true,
            },
        });
        if (data) {
            res.json(data);
        } else {
            res.status(404).json({ error: "Not found" });
        }
    } catch (error) {
        res.status(500).json({ error: "Error on getById: floor" });
    }
};

export const getByCustomerId = async (
    req: Request,
    res: Response
): Promise<void> => {
    const { customerId } = req.params;
    try {
        const data = await prisma.floor.findMany({
            where: {
                customerId: Number(customerId),
            },
            include: {
                _count: true,
                customer: true,
                building: true,
                dataHalls: true,
            },
        });
        res.json(data);
    } catch (error) {
        res.status(500).json({
            error: "Error on getByCustomerId: floor",
        });
    }
};

export const create = async (req: Request, res: Response): Promise<void> => {
    const { name, buildingId, customerId, lengthMeters, widthMeters } =
        req.body;
    try {
        const data = await prisma.floor.create({
            data: {
                name: name,
                buildingId: Number(buildingId),
                customerId: Number(customerId),
                lengthMeters: parseFloat(lengthMeters),
                widthMeters: parseFloat(widthMeters),
            },
        });
        res.status(201).json(data);
    } catch (error) {
        res.status(500).json({ error: "Error on create: floor" });
    }
};

export const update = async (req: Request, res: Response): Promise<void> => {
    const { id } = req.params;
    const { name, buildingId, lengthMeters, widthMeters } = req.body;

    const currentId = Number(id);
    const found = await prisma.floor.findUnique({
        where: { id: Number(id) },
    });

    if (isNaN(currentId)) {
        res.status(400).json({ error: "Invalid ID format" });
    } else if (!found) {
        res.status(404).json({ error: `ID not found` });
    } else {
        try {
            const data = await prisma.floor.update({
                where: { id: Number(id) },
                data: {
                    name: name,
                    buildingId: Number(buildingId),
                    lengthMeters: parseFloat(lengthMeters),
                    widthMeters: parseFloat(widthMeters),
                },
            });
            res.json(data);
        } catch (error) {
            res.status(500).json({ error: "Error on update: floor" });
        }
    }
};

export const remove = async (req: Request, res: Response): Promise<void> => {
    const { id } = req.params;
    try {
        await prisma.floor.delete({
            where: { id: Number(id) },
        });
        res.status(204).send();
    } catch (error) {
        res.status(500).json({ error: "Error on remove: floor" });
    }
};
