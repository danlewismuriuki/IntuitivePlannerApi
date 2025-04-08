import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/networkSwitchController";

const router = express.Router();

router.get("/networkSwitch", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/networkSwitch", getByCustomerAndDataHallId);
router.get("/networkSwitch/:id", getById);
router.post("/networkSwitch", create);
router.put("/networkSwitch/:id", update);
router.delete("/networkSwitch/:id", remove);

export default router;