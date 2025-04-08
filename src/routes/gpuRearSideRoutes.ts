import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/gpuRearSideController";

const router = express.Router();

router.get("/gpuRearSide", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/gpuRearSide", getByCustomerAndDataHallId);
router.get("/gpuRearSide/:id", getById);
router.post("/gpuRearSide", create);
router.put("/gpuRearSide/:id", update);
router.delete("/gpuRearSide/:id", remove);

export default router;