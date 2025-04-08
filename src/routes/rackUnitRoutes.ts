import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/rackUnitController";

const router = express.Router();

router.get("/rackUnit", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/rackUnit", getByCustomerAndDataHallId);
router.get("/rackUnit/:id", getById);
router.post("/rackUnit", create);
router.put("/rackUnit/:id", update);
router.delete("/rackUnit/:id", remove);

export default router;