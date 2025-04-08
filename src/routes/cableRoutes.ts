import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/cableController";

const router = express.Router();

router.get("/cable", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/cable", getByCustomerAndDataHallId);
router.get("/cable/:id", getById);
router.post("/cable", create);
router.put("/cable/:id", update);
router.delete("/cable/:id", remove);

export default router;