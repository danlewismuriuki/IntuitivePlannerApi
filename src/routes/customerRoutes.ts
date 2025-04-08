import express from "express";
import {
    create,
    getAll,
    getById,
    remove,
    update,
} from "../controllers/customerController";

const router = express.Router();

router.get("/customer", getAll);
router.get("/customer/:id", getById);
router.post("/customer", create);
router.put("/customer/:id", update);
router.delete("/customer/:id", remove);

export default router;
