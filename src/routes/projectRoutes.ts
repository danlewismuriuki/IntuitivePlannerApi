import express from "express";
import {
    create,
    getAll,
    getByCustomerId,
    getById,
    remove,
    update,
} from "../controllers/projectController";

const router = express.Router();

router.get("/project", getAll);
router.get("/customers/:customerId/project", getByCustomerId);
router.get("/project/:id", getById);
router.post("/project", create);
router.put("/project/:id", update);
router.delete("/project/:id", remove);

export default router;
