import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/scalableUnitZoneController";

const router = express.Router();

router.get("/scalableUnitZone", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/scalableUnitZone", getByCustomerAndDataHallId);
router.get("/scalableUnitZone/:id", getById);
router.post("/scalableUnitZone", create);
router.put("/scalableUnitZone/:id", update);
router.delete("/scalableUnitZone/:id", remove);

export default router;