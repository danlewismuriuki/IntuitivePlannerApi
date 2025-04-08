import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/superSpineSwitchPortController";

const router = express.Router();

router.get("/superSpineSwitchPort", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/superSpineSwitchPort", getByCustomerAndDataHallId);
router.get("/superSpineSwitchPort/:id", getById);
router.post("/superSpineSwitchPort", create);
router.put("/superSpineSwitchPort/:id", update);
router.delete("/superSpineSwitchPort/:id", remove);

export default router;