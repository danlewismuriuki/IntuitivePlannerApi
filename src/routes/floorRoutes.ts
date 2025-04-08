import express from "express";
import {
    create,
    getAll,
    getByCustomerId,
    getById,
    remove,
    update,
} from "../controllers/floorController";

const router = express.Router();

router.get("/floor", getAll);
router.get("/customers/:customerId/floor", getByCustomerId);
router.get("/floor/:id", getById);
router.post("/floor", create);
router.put("/floor/:id", update);
router.delete("/floor/:id", remove);

export default router;
