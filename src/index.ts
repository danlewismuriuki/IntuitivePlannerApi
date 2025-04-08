import { PrismaClient } from "@prisma/client";
import bcrypt from "bcryptjs";
import cors from "cors";
import dotenv from "dotenv";
import express from "express";

// Customer Page Controllers
import authRoutes from "./routes/authRoutes";
import customerRoutes from "./routes/customerRoutes";
import projectRoutes from "./routes/projectRoutes";
import siteRoutes from "./routes/siteRoutes";
import buildingRoutes from "./routes/buildingRoutes";
import floorRoutes from "./routes/floorRoutes";
import networkRoomRoutes from "./routes/networkRoomRoutes";
import meetMeRoomRoutes from "./routes/meetMeRoomRoutes";
import dataHallRoutes from "./routes/dataHallRoutes";

// Zone Page Controllers
import zoneTypeController from "./routes/zoneTypeRoutes";
import zoneController from "./routes/zoneRoutes";
import scalableUnitZoneController from "./routes/scalableUnitZoneRoutes";
import storageUnitZoneController from "./routes/storageUnitZoneRoutes";
import superSpineZoneController from "./routes/superSpineZoneRoutes";
import spineLeafZoneController from "./routes/spineLeafZoneRoutes";
import rackTypeController from "./routes/rackTypeRoutes";
import rackController from "./routes/rackRoutes";
import rackUnitController from "./routes/rackUnitRoutes";
import networkSwitchController from "./routes/networkSwitchRoutes";
import fiberTrunkCableController from "./routes/fiberTrunkCableRoutes";
import fiberTrunkCableLegController from "./routes/fiberTrunkCableLegRoutes";
import gpuController from "./routes/gpuRoutes";
import fiberTransceiverTypeController from "./routes/fiberTransceiverTypeRoutes";
import gpuPortController from "./routes/gpuPortRoutes";
import patchPanelController from "./routes/patchPanelRoutes";
import patchPanelPortController from "./routes/patchPanelPortRoutes";
import ocpRackController from "./routes/ocpRackRoutes";
import serverController from "./routes/serverRoutes";
import cpuComputeRackController from "./routes/cpuComputeRackRoutes";
import gpuComputeRackController from "./routes/gpuComputeRackRoutes";
import leafSwitchController from "./routes/leafSwitchRoutes";
import leafSwitchPortController from "./routes/leafSwitchPortRoutes";
import spineLeafSwitchController from "./routes/spineLeafSwitchRoutes";
import spineSwitchPortController from "./routes/spineSwitchPortRoutes";
import superSpineLeafSwitchController from "./routes/superSpineLeafSwitchRoutes";
import superSpineSwitchPortController from "./routes/superSpineSwitchPortRoutes";
import leafSwitchRackController from "./routes/leafSwitchRackRoutes";
import spineLeafSwitchRackController from "./routes/spineLeafSwitchRackRoutes";
import superSpineSwitchRackController from "./routes/superSpineSwitchRackRoutes";
import containmentController from "./routes/containmentRoutes";
import coolingController from "./routes/coolingRoutes";
import connectivityPathController from "./routes/connectivityPathRoutes";
import networkCabinetController from "./routes/networkCabinetRoutes";
import cableController from "./routes/cableRoutes";
import patchPanelModulePortController from "./routes/patchPanelModulePortRoutes";
import networkTypeController from "./routes/networkTypeRoutes";
import networkTopologyController from "./routes/networkTopologyRoutes";
import gpuFrontSideController from "./routes/gpuFrontSideRoutes";
import gpuRearSideController from "./routes/gpuRearSideRoutes";
import networkTypeSouthController from "./routes/networkTypeSouthRoutes";
import scalableUnitGpuLeafSwitchRackController from "./routes/scalableUnitGpuLeafSwitchRackRoutes";
import leafSwitchGbicPortController from "./routes/leafSwitchGbicPortRoutes";

dotenv.config();

const prisma = new PrismaClient();

dotenv.config();

const app = express();
const PORT = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());

// Customer Page Routes
app.use("/api", authRoutes);
app.use("/api", customerRoutes);
app.use("/api", projectRoutes);
app.use("/api", siteRoutes);
app.use("/api", buildingRoutes);
app.use("/api", floorRoutes);
app.use("/api", networkRoomRoutes);
app.use("/api", meetMeRoomRoutes);
app.use("/api", dataHallRoutes);

// Zone Page Routes
app.use("/api", zoneTypeController);
app.use("/api", zoneController);
app.use("/api", scalableUnitZoneController);
app.use("/api", storageUnitZoneController);
app.use("/api", superSpineZoneController);
app.use("/api", spineLeafZoneController);
app.use("/api", rackTypeController);
app.use("/api", rackController);
app.use("/api", rackUnitController);
app.use("/api", networkSwitchController);
app.use("/api", fiberTrunkCableController);
app.use("/api", fiberTrunkCableLegController);
app.use("/api", gpuController);
app.use("/api", fiberTransceiverTypeController);
app.use("/api", gpuPortController);
app.use("/api", patchPanelController);
app.use("/api", patchPanelPortController);
app.use("/api", ocpRackController);
app.use("/api", serverController);
app.use("/api", cpuComputeRackController);
app.use("/api", gpuComputeRackController);
app.use("/api", leafSwitchController);
app.use("/api", leafSwitchPortController);
app.use("/api", spineLeafSwitchController);
app.use("/api", spineSwitchPortController);
app.use("/api", superSpineLeafSwitchController);
app.use("/api", superSpineSwitchPortController);
app.use("/api", leafSwitchRackController);
app.use("/api", spineLeafSwitchRackController);
app.use("/api", superSpineSwitchRackController);
app.use("/api", containmentController);
app.use("/api", coolingController);
app.use("/api", connectivityPathController);
app.use("/api", networkCabinetController);
app.use("/api", cableController);
app.use("/api", patchPanelModulePortController);
app.use("/api", networkTypeController);
app.use("/api", networkTopologyController);
app.use("/api", gpuFrontSideController);
app.use("/api", gpuRearSideController);
app.use("/api", networkTypeSouthController);
app.use("/api", scalableUnitGpuLeafSwitchRackController);
app.use("/api", leafSwitchGbicPortController);


async function createAdminUser() {
  const adminUsername = "Admin";
  const adminPassword = "Admin";

  try {
    const existingUser = await prisma.user.findUnique({
      where: { username: adminUsername },
    });

    if (!existingUser) {
      const hashedPassword = await bcrypt.hash(adminPassword, 10);

      await prisma.user.create({
        data: {
          username: adminUsername,
          password: hashedPassword,
        },
      });

      console.log("Admin user created.");
    } else {
      console.log("Admin user already exists.");
    }
  } catch (error) {
    console.error("Error creating admin user:", error);
  }
}

app.get("/", (req, res) => {
  res.send("API is running");
});

app.listen(PORT, async () => {
  await createAdminUser();
  console.log(`Server is running on http://localhost:${PORT}`);
});
