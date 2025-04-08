import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/gpuComputeRackController";

const router = express.Router();

router.get("/gpuComputeRack", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/gpuComputeRack", getByCustomerAndDataHallId);
router.get("/gpuComputeRack/:id", getById);
router.post("/gpuComputeRack", create);
router.put("/gpuComputeRack/:id", update);
router.delete("/gpuComputeRack/:id", remove);

export default router;