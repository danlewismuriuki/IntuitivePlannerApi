import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/gpuFrontSideController";

const router = express.Router();

router.get("/gpuFrontSide", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/gpuFrontSide", getByCustomerAndDataHallId);
router.get("/gpuFrontSide/:id", getById);
router.post("/gpuFrontSide", create);
router.put("/gpuFrontSide/:id", update);
router.delete("/gpuFrontSide/:id", remove);

export default router;