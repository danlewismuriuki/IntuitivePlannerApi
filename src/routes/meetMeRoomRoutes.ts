import express from "express";
import {
  create,
  getAll,
  getByCustomerId,
  getById,
  remove,
  update,
} from "../controllers/meetMeRoomController";

const router = express.Router();

router.get("/meetMeRoom", getAll);
router.get("/customers/:customerId/meetMeRoom", getByCustomerId);
router.get("/meetMeRoom/:id", getById);
router.post("/meetMeRoom", create);
router.put("/meetMeRoom/:id", update);
router.delete("/meetMeRoom/:id", remove);

export default router;
