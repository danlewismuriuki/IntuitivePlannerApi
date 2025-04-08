import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/rackController";

const router = express.Router();

router.get("/rack", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/rack", getByCustomerAndDataHallId);
router.get("/rack/:id", getById);
router.post("/rack", create);
router.put("/rack/:id", update);
router.delete("/rack/:id", remove);

export default router;