import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/storageUnitZoneController";

const router = express.Router();

router.get("/storageUnitZone", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/storageUnitZone", getByCustomerAndDataHallId);
router.get("/storageUnitZone/:id", getById);
router.post("/storageUnitZone", create);
router.put("/storageUnitZone/:id", update);
router.delete("/storageUnitZone/:id", remove);

export default router;