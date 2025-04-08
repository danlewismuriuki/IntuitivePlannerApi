import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/fiberTrunkCableController";

const router = express.Router();

router.get("/fiberTrunkCable", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/fiberTrunkCable", getByCustomerAndDataHallId);
router.get("/fiberTrunkCable/:id", getById);
router.post("/fiberTrunkCable", create);
router.put("/fiberTrunkCable/:id", update);
router.delete("/fiberTrunkCable/:id", remove);

export default router;