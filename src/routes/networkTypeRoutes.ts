import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/networkTypeController";

const router = express.Router();

router.get("/networkType", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/networkType", getByCustomerAndDataHallId);
router.get("/networkType/:id", getById);
router.post("/networkType", create);
router.put("/networkType/:id", update);
router.delete("/networkType/:id", remove);

export default router;