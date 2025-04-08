import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/superSpineZoneController";

const router = express.Router();

router.get("/superSpineZone", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/superSpineZone", getByCustomerAndDataHallId);
router.get("/superSpineZone/:id", getById);
router.post("/superSpineZone", create);
router.put("/superSpineZone/:id", update);
router.delete("/superSpineZone/:id", remove);

export default router;