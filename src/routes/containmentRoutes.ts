import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/containmentController";

const router = express.Router();

router.get("/containment", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/containment", getByCustomerAndDataHallId);
router.get("/containment/:id", getById);
router.post("/containment", create);
router.put("/containment/:id", update);
router.delete("/containment/:id", remove);

export default router;