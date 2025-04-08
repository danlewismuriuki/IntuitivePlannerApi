import express from "express";
import {
    create,
    getAll,
    getByCustomerId,
    getById,
    remove,
    update,
} from "../controllers/siteController";

const router = express.Router();

router.get("/site", getAll);
router.get("/customers/:customerId/site", getByCustomerId);
router.get("/site/:id", getById);
router.post("/site", create);
router.put("/site/:id", update);
router.delete("/site/:id", remove);

export default router;
