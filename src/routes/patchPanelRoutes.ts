import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/patchPanelController";

const router = express.Router();

router.get("/patchPanel", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/patchPanel", getByCustomerAndDataHallId);
router.get("/patchPanel/:id", getById);
router.post("/patchPanel", create);
router.put("/patchPanel/:id", update);
router.delete("/patchPanel/:id", remove);

export default router;