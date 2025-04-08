import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/spineSwitchPortController";

const router = express.Router();

router.get("/spineSwitchPort", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/spineSwitchPort", getByCustomerAndDataHallId);
router.get("/spineSwitchPort/:id", getById);
router.post("/spineSwitchPort", create);
router.put("/spineSwitchPort/:id", update);
router.delete("/spineSwitchPort/:id", remove);

export default router;