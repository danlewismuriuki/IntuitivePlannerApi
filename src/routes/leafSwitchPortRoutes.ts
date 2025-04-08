import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/leafSwitchPortController";

const router = express.Router();

router.get("/leafSwitchPort", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/leafSwitchPort", getByCustomerAndDataHallId);
router.get("/leafSwitchPort/:id", getById);
router.post("/leafSwitchPort", create);
router.put("/leafSwitchPort/:id", update);
router.delete("/leafSwitchPort/:id", remove);

export default router;