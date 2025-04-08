import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/gpuController";

const router = express.Router();

router.get("/gpu", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/gpu", getByCustomerAndDataHallId);
router.get("/gpu/:id", getById);
router.post("/gpu", create);
router.put("/gpu/:id", update);
router.delete("/gpu/:id", remove);

export default router;