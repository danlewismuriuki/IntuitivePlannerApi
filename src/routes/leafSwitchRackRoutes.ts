import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/leafSwitchRackController";

const router = express.Router();

router.get("/leafSwitchRack", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/leafSwitchRack", getByCustomerAndDataHallId);
router.get("/leafSwitchRack/:id", getById);
router.post("/leafSwitchRack", create);
router.put("/leafSwitchRack/:id", update);
router.delete("/leafSwitchRack/:id", remove);

export default router;