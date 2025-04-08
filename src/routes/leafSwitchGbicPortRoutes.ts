import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/leafSwitchGbicPortController";

const router = express.Router();

router.get("/leafSwitchGbicPort", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/leafSwitchGbicPort", getByCustomerAndDataHallId);
router.get("/leafSwitchGbicPort/:id", getById);
router.post("/leafSwitchGbicPort", create);
router.put("/leafSwitchGbicPort/:id", update);
router.delete("/leafSwitchGbicPort/:id", remove);

export default router;