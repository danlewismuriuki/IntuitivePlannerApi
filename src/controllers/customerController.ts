import { PrismaClient } from "@prisma/client";
import { Request, Response } from "express";

const prisma = new PrismaClient();

export const getAll = async (req: Request, res: Response): Promise<void> => {
    try {
        const data = await prisma.customer.findMany({
            select: {
                _count: true,
                buildings: true,
                city: true,
                continent: true,
                country: true,
                createdAt: true,
                dataHalls: true,
                floors: true,
                id: true,
                name: true,
                projects: true,
                sites: true,
                state: true,
                updatedAt: true,
            },
        });
        res.json(data);
    } catch (error) {
        res.status(500).json({ error: "Error on getAll: customer" });
    }
};

export const getById = async (req: Request, res: Response): Promise<void> => {
    const { id } = req.params;
    try {
        const data = await prisma.customer.findUnique({
            where: { id: Number(id) },
            include: {
                _count: true,
                buildings: true,
                dataHalls: true,
                floors: true,
                projects: true,
                sites: true,
            },
        });
        if (data) {
            res.json(data);
        } else {
            res.status(404).json({ error: "Not found" });
        }
    } catch (error) {
        res.status(500).json({ error: "Error on getById: customer" });
    }
};

export const create = async (req: Request, res: Response): Promise<void> => {
    const { name, continent, country, state, city } = req.body;
    try {
        const data = await prisma.customer.create({
            data: {
                name: name,
                continent: continent,
                country: country,
                state: state,
                city: city,
                createdAt: new Date(),
            },
        });
        res.status(201).json(data);
    } catch (error) {
        res.status(500).json({ error: "Error on create: customer" });
    }
};

export const update = async (req: Request, res: Response): Promise<void> => {
    const { id } = req.params;
    const { name, continent, country, state, city } = req.body;

    const currentId = Number(id);
    const found = await prisma.customer.findUnique({
        where: { id: Number(id) },
    });

    if (isNaN(currentId)) {
        res.status(400).json({ error: "Invalid ID format" });
    } else if (!found) {
        res.status(404).json({ error: `ID not found` });
    } else {
        try {
            const data = await prisma.customer.update({
                where: { id: Number(id) },
                data: {
                    name: name,
                    continent: continent,
                    country: country,
                    state: state,
                    city: city,
                    updatedAt: new Date(),
                },
            });
            res.json(data);
        } catch (error) {
            res.status(500).json({ error: "Error on update: customer" });
        }
    }
};

export const remove = async (req: Request, res: Response): Promise<void> => {
    const { id } = req.params;
    try {
        await prisma.customer.delete({
            where: { id: Number(id) },
        });
        res.status(204).send();
    } catch (error) {
        res.status(500).json({ error: "Error on remove: customer" });
    }
};
