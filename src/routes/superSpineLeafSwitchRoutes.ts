import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/superSpineLeafSwitchController";

const router = express.Router();

router.get("/superSpineLeafSwitch", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/superSpineLeafSwitch", getByCustomerAndDataHallId);
router.get("/superSpineLeafSwitch/:id", getById);
router.post("/superSpineLeafSwitch", create);
router.put("/superSpineLeafSwitch/:id", update);
router.delete("/superSpineLeafSwitch/:id", remove);

export default router;