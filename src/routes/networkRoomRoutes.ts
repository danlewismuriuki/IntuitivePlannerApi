import express from "express";
import {
  create,
  getAll,
  getByCustomerId,
  getById,
  remove,
  update,
} from "../controllers/networkRoomController";

const router = express.Router();

router.get("/networkRoom", getAll);
router.get("/customers/:customerId/networkRoom", getByCustomerId);
router.get("/networkRoom/:id", getById);
router.post("/networkRoom", create);
router.put("/networkRoom/:id", update);
router.delete("/networkRoom/:id", remove);

export default router;
