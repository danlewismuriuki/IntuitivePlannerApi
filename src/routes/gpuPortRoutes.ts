import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/gpuPortController";

const router = express.Router();

router.get("/gpuPort", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/gpuPort", getByCustomerAndDataHallId);
router.get("/gpuPort/:id", getById);
router.post("/gpuPort", create);
router.put("/gpuPort/:id", update);
router.delete("/gpuPort/:id", remove);

export default router;