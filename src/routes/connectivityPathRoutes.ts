import express from "express";
import {
    create,
    getAll,
    getByCustomerAndDataHallId,
    getById,
    remove,
    update,
} from "../controllers/connectivityPathController";

const router = express.Router();

router.get("/connectivityPath", getAll);
router.get("/customers/:customerId/dataHalls/:dataHallId/connectivityPath", getByCustomerAndDataHallId);
router.get("/connectivityPath/:id", getById);
router.post("/connectivityPath", create);
router.put("/connectivityPath/:id", update);
router.delete("/connectivityPath/:id", remove);

export default router;