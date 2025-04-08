import express from "express";
import {
    create,
    getAll,
    getByCustomerId,
    getById,
    remove,
    update,
} from "../controllers/buildingController";

const router = express.Router();

router.get("/building", getAll);
router.get("/customers/:customerId/building", getByCustomerId);
router.get("/building/:id", getById);
router.post("/building", create);
router.put("/building/:id", update);
router.delete("/building/:id", remove);

export default router;
