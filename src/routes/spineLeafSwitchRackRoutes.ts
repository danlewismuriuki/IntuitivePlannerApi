import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/spineLeafSwitchRackController";

const router = express.Router();

router.get("/spineLeafSwitchRack", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/spineLeafSwitchRack", getByCustomerAndDataHallId);
router.get("/spineLeafSwitchRack/:id", getById);
router.post("/spineLeafSwitchRack", create);
router.put("/spineLeafSwitchRack/:id", update);
router.delete("/spineLeafSwitchRack/:id", remove);

export default router;