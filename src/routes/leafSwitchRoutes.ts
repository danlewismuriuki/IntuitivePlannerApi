import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/leafSwitchController";

const router = express.Router();

router.get("/leafSwitch", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/leafSwitch", getByCustomerAndDataHallId);
router.get("/leafSwitch/:id", getById);
router.post("/leafSwitch", create);
router.put("/leafSwitch/:id", update);
router.delete("/leafSwitch/:id", remove);

export default router;