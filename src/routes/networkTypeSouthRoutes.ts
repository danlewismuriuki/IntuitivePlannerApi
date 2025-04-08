import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/networkTypeSouthController";

const router = express.Router();

router.get("/networkTypeSouth", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/networkTypeSouth", getByCustomerAndDataHallId);
router.get("/networkTypeSouth/:id", getById);
router.post("/networkTypeSouth", create);
router.put("/networkTypeSouth/:id", update);
router.delete("/networkTypeSouth/:id", remove);

export default router;