import express from "express";
import {
    create,
    getAll,
    getByCustomerId,
    getById,
    remove,
    update,
} from "../controllers/dataHallController";

const router = express.Router();

router.get("/dataHall", getAll);
router.get("/customers/:customerId/dataHall", getByCustomerId);
router.get("/dataHall/:id", getById);
router.post("/dataHall", create);
router.put("/dataHall/:id", update);
router.delete("/dataHall/:id", remove);

export default router;
