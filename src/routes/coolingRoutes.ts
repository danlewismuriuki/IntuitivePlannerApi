import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/coolingController";

const router = express.Router();

router.get("/cooling", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/cooling", getByCustomerAndDataHallId);
router.get("/cooling/:id", getById);
router.post("/cooling", create);
router.put("/cooling/:id", update);
router.delete("/cooling/:id", remove);

export default router;