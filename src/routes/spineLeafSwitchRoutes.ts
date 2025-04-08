import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/spineLeafSwitchController";

const router = express.Router();

router.get("/spineLeafSwitch", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/spineLeafSwitch", getByCustomerAndDataHallId);
router.get("/spineLeafSwitch/:id", getById);
router.post("/spineLeafSwitch", create);
router.put("/spineLeafSwitch/:id", update);
router.delete("/spineLeafSwitch/:id", remove);

export default router;