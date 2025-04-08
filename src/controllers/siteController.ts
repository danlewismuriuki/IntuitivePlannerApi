import { PrismaClient } from "@prisma/client";
import { Request, Response } from "express";

const prisma = new PrismaClient();

export const getAll = async (req: Request, res: Response): Promise<void> => {
    try {
        const data = await prisma.site.findMany({
            select: {
                _count: true,
                customer: true,
                customerId: true,
                buildings: true,
                id: true,
                name: true,
                project: true,
                projectId: true,
            },
        });
        res.json(data);
    } catch (error) {
        res.status(500).json({ error: "Error on getAll: site" });
    }
};

export const getById = async (req: Request, res: Response): Promise<void> => {
    const { id } = req.params;
    try {
        const data = await prisma.site.findUnique({
            where: { id: Number(id) },
            include: {
                _count: true,
                customer: true,
                buildings: true,
                project: true,
            },
        });
        if (data) {
            res.json(data);
        } else {
            res.status(404).json({ error: "Not found" });
        }
    } catch (error) {
        res.status(500).json({ error: "Error on getById: site" });
    }
};

export const getByCustomerId = async (
    req: Request,
    res: Response
): Promise<void> => {
    const { customerId } = req.params;
    try {
        const data = await prisma.site.findMany({
            where: {
                customerId: Number(customerId),
            },
            include: {
                _count: true,
                customer: true,
                buildings: true,
                project: true,
            },
        });
        res.json(data);
    } catch (error) {
        res.status(500).json({
            error: "Error on getByCustomerId: site",
        });
    }
};

export const create = async (req: Request, res: Response): Promise<void> => {
    const { name, customerId, projectId } = req.body;
    try {
        const data = await prisma.site.create({
            data: {
                name: name,
                customerId: Number(customerId),
                projectId: Number(projectId),
            },
        });
        res.status(201).json(data);
    } catch (error) {
        res.status(500).json({ error: "Error on create: site" });
    }
};

export const update = async (req: Request, res: Response): Promise<void> => {
    const { id } = req.params;
    const { name, projectId } = req.body;

    const currentId = Number(id);
    const found = await prisma.site.findUnique({
        where: { id: Number(id) },
    });

    if (isNaN(currentId)) {
        res.status(400).json({ error: "Invalid ID format" });
    } else if (!found) {
        res.status(404).json({ error: `ID not found` });
    } else {
        try {
            const data = await prisma.site.update({
                where: { id: Number(id) },
                data: {
                    name: name,
                    projectId: Number(projectId),
                },
            });
            res.json(data);
        } catch (error) {
            res.status(500).json({ error: "Error on update: site" });
        }
    }
};

export const remove = async (req: Request, res: Response): Promise<void> => {
    const { id } = req.params;
    try {
        await prisma.site.delete({
            where: { id: Number(id) },
        });
        res.status(204).send();
    } catch (error) {
        res.status(500).json({ error: "Error on remove: site" });
    }
};
