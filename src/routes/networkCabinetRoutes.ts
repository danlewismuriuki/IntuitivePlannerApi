import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/networkCabinetController";

const router = express.Router();

router.get("/networkCabinet", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/networkCabinet", getByCustomerAndDataHallId);
router.get("/networkCabinet/:id", getById);
router.post("/networkCabinet", create);
router.put("/networkCabinet/:id", update);
router.delete("/networkCabinet/:id", remove);

export default router;