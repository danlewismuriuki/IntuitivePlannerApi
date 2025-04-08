import express from "express";
import {
  create,
  getAll,
  getById,
  remove,
  update,
} from "../controllers/rackTypeController";

const router = express.Router();

router.get("/rackType", getAll);
router.get("/rackType/:id", getById);
router.post("/rackType", create);
router.put("/rackType/:id", update);
router.delete("/rackType/:id", remove);

export default router;