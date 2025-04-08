import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/zoneController";

const router = express.Router();

router.get("/zone", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/zone", getByCustomerAndDataHallId);
router.get("/zone/:id", getById);
router.post("/zone", create);
router.put("/zone/:id", update);
router.delete("/zone/:id", remove);

export default router;