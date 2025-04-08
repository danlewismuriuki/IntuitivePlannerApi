import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/networkTopologyController";

const router = express.Router();

router.get("/networkTopology", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/networkTopology", getByCustomerAndDataHallId);
router.get("/networkTopology/:id", getById);
router.post("/networkTopology", create);
router.put("/networkTopology/:id", update);
router.delete("/networkTopology/:id", remove);

export default router;