import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/fiberTransceiverTypeController";

const router = express.Router();

router.get("/fiberTransceiverType", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/fiberTransceiverType", getByCustomerAndDataHallId);
router.get("/fiberTransceiverType/:id", getById);
router.post("/fiberTransceiverType", create);
router.put("/fiberTransceiverType/:id", update);
router.delete("/fiberTransceiverType/:id", remove);

export default router;