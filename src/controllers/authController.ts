import { Request, Response } from "express";
import dotenv from "dotenv";
import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";
import { PrismaClient } from "@prisma/client";
dotenv.config();

const prisma = new PrismaClient();
const secretKey = process.env.JWT_SECRET;

if (!secretKey) {
    throw new Error("JWT_SECRET is not defined in environment variables.");
}

export const login = async (req: Request, res: Response): Promise<void> => {
    const { username, password } = req.body;

    try {
        const user = await prisma.user.findUnique({ where: { username } });

        if (!user) {
            res.status(400).json({ message: "Invalid username or password" });
            return;
        }

        const isMatch = await bcrypt.compare(password, user.password);

        if (!isMatch) {
            res.status(400).json({ message: "Invalid username or password" });
            return;
        }

        const token = jwt.sign({ id: user.id }, secretKey, { expiresIn: "1h" });

        res.json({ token });
    } catch (error) {
        console.error("Error during login:", error);
        res.status(500).json({ message: "Server error" });
    }
};


