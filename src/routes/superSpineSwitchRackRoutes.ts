import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/superSpineSwitchRackController";

const router = express.Router();

router.get("/superSpineSwitchRack", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/superSpineSwitchRack", getByCustomerAndDataHallId);
router.get("/superSpineSwitchRack/:id", getById);
router.post("/superSpineSwitchRack", create);
router.put("/superSpineSwitchRack/:id", update);
router.delete("/superSpineSwitchRack/:id", remove);

export default router;