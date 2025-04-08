import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/spineLeafZoneController";

const router = express.Router();

router.get("/spineLeafZone", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/spineLeafZone", getByCustomerAndDataHallId);
router.get("/spineLeafZone/:id", getById);
router.post("/spineLeafZone", create);
router.put("/spineLeafZone/:id", update);
router.delete("/spineLeafZone/:id", remove);

export default router;