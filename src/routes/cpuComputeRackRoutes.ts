import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/cpuComputeRackController";

const router = express.Router();

router.get("/cpuComputeRack", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/cpuComputeRack", getByCustomerAndDataHallId);
router.get("/cpuComputeRack/:id", getById);
router.post("/cpuComputeRack", create);
router.put("/cpuComputeRack/:id", update);
router.delete("/cpuComputeRack/:id", remove);

export default router;