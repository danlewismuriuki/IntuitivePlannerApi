import express from "express";
import {
  create,
  getAll,
  getById,
  remove,
  update,
} from "../controllers/zoneTypeController";

const router = express.Router();

router.get("/zoneType", getAll);
router.get("/zoneType/:id", getById);
router.post("/zoneType", create);
router.put("/zoneType/:id", update);
router.delete("/zoneType/:id", remove);

export default router;
