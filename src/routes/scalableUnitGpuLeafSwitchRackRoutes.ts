import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/scalableUnitGpuLeafSwitchRackController";

const router = express.Router();

router.get("/scalableUnitGpuLeafSwitchRack", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/scalableUnitGpuLeafSwitchRack", getByCustomerAndDataHallId);
router.get("/scalableUnitGpuLeafSwitchRack/:id", getById);
router.post("/scalableUnitGpuLeafSwitchRack", create);
router.put("/scalableUnitGpuLeafSwitchRack/:id", update);
router.delete("/scalableUnitGpuLeafSwitchRack/:id", remove);

export default router;