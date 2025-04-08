import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/patchPanelModulePortController";

const router = express.Router();

router.get("/patchPanelModulePort", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/patchPanelModulePort", getByCustomerAndDataHallId);
router.get("/patchPanelModulePort/:id", getById);
router.post("/patchPanelModulePort", create);
router.put("/patchPanelModulePort/:id", update);
router.delete("/patchPanelModulePort/:id", remove);

export default router;