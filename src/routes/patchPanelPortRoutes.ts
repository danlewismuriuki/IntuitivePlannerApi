import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/patchPanelPortController";

const router = express.Router();

router.get("/patchPanelPort", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/patchPanelPort", getByCustomerAndDataHallId);
router.get("/patchPanelPort/:id", getById);
router.post("/patchPanelPort", create);
router.put("/patchPanelPort/:id", update);
router.delete("/patchPanelPort/:id", remove);

export default router;