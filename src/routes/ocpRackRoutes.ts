import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/ocpRackController";

const router = express.Router();

router.get("/ocpRack", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/ocpRack", getByCustomerAndDataHallId);
router.get("/ocpRack/:id", getById);
router.post("/ocpRack", create);
router.put("/ocpRack/:id", update);
router.delete("/ocpRack/:id", remove);

export default router;