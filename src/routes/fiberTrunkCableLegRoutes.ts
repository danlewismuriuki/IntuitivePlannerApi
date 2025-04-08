import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/fiberTrunkCableLegController";

const router = express.Router();

router.get("/fiberTrunkCableLeg", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/fiberTrunkCableLeg", getByCustomerAndDataHallId);
router.get("/fiberTrunkCableLeg/:id", getById);
router.post("/fiberTrunkCableLeg", create);
router.put("/fiberTrunkCableLeg/:id", update);
router.delete("/fiberTrunkCableLeg/:id", remove);

export default router;