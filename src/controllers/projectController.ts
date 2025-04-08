import { PrismaClient } from "@prisma/client";
import { Request, Response } from "express";

const prisma = new PrismaClient();

export const getAll = async (req: Request, res: Response): Promise<void> => {
    try {
        const data = await prisma.project.findMany({
            select: {
                _count: true,
                customerId: true,
                id: true,
                name: true,
                sites: true,
            },
        });
        res.json(data);
    } catch (error) {
        res.status(500).json({ error: "Error on getAll: project" });
    }
};

export const getById = async (req: Request, res: Response): Promise<void> => {
    const { id } = req.params;
    try {
        const data = await prisma.project.findUnique({
            where: { id: Number(id) },
            include: {
                _count: true,
                sites: true,
            },
        });
        if (data) {
            res.json(data);
        } else {
            res.status(404).json({ error: "Not found" });
        }
    } catch (error) {
        res.status(500).json({ error: "Error on getById: project" });
    }
};

export const getByCustomerId = async (
    req: Request,
    res: Response
): Promise<void> => {
    const { customerId } = req.params;
    try {
        const data = await prisma.project.findMany({
            where: {
                customerId: Number(customerId),
            },
            include: {
                _count: true,
                customer: true,
                sites: true,
            },
        });
        res.json(data);
    } catch (error) {
        res.status(500).json({
            error: "Error on getByCustomerId: project",
        });
    }
};

export const create = async (req: Request, res: Response): Promise<void> => {
    const { name, customerId } = req.body;
    try {
        const data = await prisma.project.create({
            data: {
                name: name,
                customerId: Number(customerId),
            },
        });
        res.status(201).json(data);
    } catch (error) {
        res.status(500).json({ error: "Error on create: project" });
    }
};

export const update = async (req: Request, res: Response): Promise<void> => {
    const { id } = req.params;
    const { name } = req.body;

    const currentId = Number(id);
    const found = await prisma.project.findUnique({
        where: { id: Number(id) },
    });

    if (isNaN(currentId)) {
        res.status(400).json({ error: "Invalid ID format" });
    } else if (!found) {
        res.status(404).json({ error: `ID not found` });
    } else {
        try {
            const data = await prisma.project.update({
                where: { id: Number(id) },
                data: {
                    name: name,
                },
            });
            res.json(data);
        } catch (error) {
            res.status(500).json({ error: "Error on update: project" });
        }
    }
};

export const remove = async (req: Request, res: Response): Promise<void> => {
    const { id } = req.params;
    try {
        await prisma.project.delete({
            where: { id: Number(id) },
        });
        res.status(204).send();
    } catch (error) {
        res.status(500).json({ error: "Error on remove: project" });
    }
};
