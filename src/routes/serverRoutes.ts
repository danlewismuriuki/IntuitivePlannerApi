import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/serverController";

const router = express.Router();

router.get("/server", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/server", getByCustomerAndDataHallId);
router.get("/server/:id", getById);
router.post("/server", create);
router.put("/server/:id", update);
router.delete("/server/:id", remove);

export default router;