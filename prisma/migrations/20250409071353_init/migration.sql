-- CreateTable
CREATE TABLE "Customer" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "continent" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Customer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Project" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "customerId" INTEGER NOT NULL,

    CONSTRAINT "Project_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Site" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "customerId" INTEGER NOT NULL,
    "projectId" INTEGER NOT NULL,

    CONSTRAINT "Site_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Building" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "customerId" INTEGER NOT NULL,
    "siteId" INTEGER NOT NULL,

    CONSTRAINT "Building_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Floor" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "lengthMeters" DOUBLE PRECISION NOT NULL,
    "widthMeters" DOUBLE PRECISION NOT NULL,
    "customerId" INTEGER NOT NULL,
    "buildingId" INTEGER NOT NULL,

    CONSTRAINT "Floor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NetworkRoom" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "tilesWidth" INTEGER NOT NULL,
    "tilesLength" INTEGER NOT NULL,
    "customerId" INTEGER NOT NULL,
    "floorId" INTEGER NOT NULL,

    CONSTRAINT "NetworkRoom_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MeetMeRoom" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "tilesWidth" INTEGER NOT NULL,
    "tilesLength" INTEGER NOT NULL,
    "customerId" INTEGER NOT NULL,
    "floorId" INTEGER NOT NULL,

    CONSTRAINT "MeetMeRoom_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DataHall" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "tilesWidth" INTEGER NOT NULL,
    "tilesLength" INTEGER NOT NULL,
    "customerId" INTEGER NOT NULL,
    "floorId" INTEGER NOT NULL,

    CONSTRAINT "DataHall_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ZoneType" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "ZoneType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Zone" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "numberOfScalableUnits" INTEGER NOT NULL,
    "numberOfRacks" INTEGER NOT NULL,
    "numberOfTilesBetweenScalableUnitRows" INTEGER NOT NULL,
    "numberOfTilesBetwenScalableUnits" INTEGER NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,
    "zoneTypeId" INTEGER NOT NULL,

    CONSTRAINT "Zone_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ScalableUnitZone" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "numberOfT1NetworkRacks" INTEGER NOT NULL,
    "numberOfGpuRacks" INTEGER NOT NULL,
    "numberOfRows" INTEGER NOT NULL,
    "numberOfTilesBetweenScalableUnitRows" INTEGER NOT NULL,
    "numberOfTilesBetwenScalableUnits" INTEGER NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,

    CONSTRAINT "ScalableUnitZone_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StorageUnitZone" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,

    CONSTRAINT "StorageUnitZone_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SuperSpineZone" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,

    CONSTRAINT "SuperSpineZone_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SpineLeafZone" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,

    CONSTRAINT "SpineLeafZone_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RackType" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "RackType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Rack" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,
    "zoneId" INTEGER NOT NULL,
    "superSpineZoneId" INTEGER NOT NULL,
    "rackTypeId" INTEGER NOT NULL,

    CONSTRAINT "Rack_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RackUnit" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,

    CONSTRAINT "RackUnit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NetworkSwitch" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,
    "networkCabinetId" INTEGER NOT NULL,
    "gpuComputeRackId" INTEGER NOT NULL,
    "cpuComputeRackId" INTEGER NOT NULL,
    "leafSwitchRackId" INTEGER NOT NULL,
    "spineLeafSwitchRackId" INTEGER NOT NULL,
    "superSpineSwitchRackId" INTEGER NOT NULL,

    CONSTRAINT "NetworkSwitch_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PatchPanelModulePort" (
    "id" SERIAL NOT NULL,
    "portLocationFrontOrBack" TEXT NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,

    CONSTRAINT "PatchPanelModulePort_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FiberTrunkCable" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "fiberCableType" TEXT NOT NULL,
    "fiberTrunkCableCoreCount" TEXT NOT NULL,
    "fiberTrunkCableSerialID" TEXT NOT NULL,
    "fireRating" TEXT NOT NULL,
    "numberOfFiberCoresPerConnector" INTEGER NOT NULL,
    "fibersPerSubUnit" INTEGER NOT NULL,
    "numberOfSubUnitsPerCable" INTEGER NOT NULL,
    "fiberTrunkCableDiameter" INTEGER NOT NULL,
    "numberOfLegsInTrunk" INTEGER NOT NULL,
    "lengthOfLegBreakout" INTEGER NOT NULL,
    "apcConnector" BOOLEAN NOT NULL,
    "legLabelnumber" TEXT NOT NULL,
    "cableLength" INTEGER NOT NULL,
    "redundantFiberFeeds" BOOLEAN NOT NULL,
    "deliveredToProject" BOOLEAN NOT NULL,
    "cablePulled" BOOLEAN NOT NULL,
    "cablePlugged" BOOLEAN NOT NULL,
    "cableTested" BOOLEAN NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,
    "networkCabinetId" INTEGER NOT NULL,
    "patchPanelModulePortId" INTEGER NOT NULL,
    "zoneId" INTEGER NOT NULL,
    "gpuComputeRackId" INTEGER NOT NULL,
    "cpuComputeRackId" INTEGER NOT NULL,
    "leafSwitchRackId" INTEGER NOT NULL,
    "spineLeafSwitchRackId" INTEGER NOT NULL,
    "superSpineSwitchRackId" INTEGER NOT NULL,

    CONSTRAINT "FiberTrunkCable_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FiberTrunkCableLeg" (
    "id" SERIAL NOT NULL,
    "nameAside" TEXT NOT NULL,
    "nameBside" TEXT NOT NULL,
    "sideAInstalledOnLeft" BOOLEAN NOT NULL,
    "sideBInstalledOnLeft" BOOLEAN NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,
    "fiberTrunkCableId" INTEGER NOT NULL,
    "patchPanelModulePortId" INTEGER NOT NULL,

    CONSTRAINT "FiberTrunkCableLeg_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Gpu" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "numberFiberPortsPerGPU" INTEGER NOT NULL,
    "numberFiberPortsPerGPUFrontSide" INTEGER NOT NULL,
    "fiberPortsPerGPURearSide" INTEGER NOT NULL,
    "powerPerGPU" INTEGER NOT NULL,
    "gpuType" TEXT NOT NULL,
    "gpuCost" INTEGER NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,
    "serverId" INTEGER NOT NULL,

    CONSTRAINT "Gpu_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FiberTransceiverType" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "transceiverType" TEXT NOT NULL,
    "transceiverPowerDraw" INTEGER NOT NULL,
    "transceiverCost" DOUBLE PRECISION NOT NULL,
    "location" TEXT NOT NULL,
    "isInGpu" BOOLEAN NOT NULL,
    "isInCPU" BOOLEAN NOT NULL,
    "isInLeafSwitch" BOOLEAN NOT NULL,
    "isInSpineSwitch" BOOLEAN NOT NULL,
    "isInSuperSpineSwitch" BOOLEAN NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,

    CONSTRAINT "FiberTransceiverType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GpuPort" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,
    "gpuFrontSideId" INTEGER NOT NULL,
    "gpuRearSideId" INTEGER NOT NULL,

    CONSTRAINT "GpuPort_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PatchPanel" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "patchPanelPresent" BOOLEAN NOT NULL,
    "patchPanelTypeFiberOrCopper" TEXT NOT NULL,
    "numberofRusPerPatchPanelType" INTEGER NOT NULL,
    "numberofPatchPanelPorts" INTEGER NOT NULL,
    "locatedInRUNumber" INTEGER NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,
    "networkCabinetId" INTEGER NOT NULL,
    "zoneId" INTEGER NOT NULL,
    "gpuComputeRackId" INTEGER NOT NULL,
    "cpuComputeRackId" INTEGER NOT NULL,
    "leafSwitchRackId" INTEGER NOT NULL,
    "spineLeafSwitchRackId" INTEGER NOT NULL,
    "superSpineSwitchRackId" INTEGER NOT NULL,

    CONSTRAINT "PatchPanel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PatchPanelPort" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "locatedInRUNumber" INTEGER NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,

    CONSTRAINT "PatchPanelPort_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OcpRack" (
    "id" SERIAL NOT NULL,
    "rackHeightInRackUnits" INTEGER NOT NULL,
    "rackWidthInMm" INTEGER NOT NULL,
    "containsFiberPatchPanel" BOOLEAN NOT NULL,
    "containsCopperPatchPanel" BOOLEAN NOT NULL,
    "numberOfFiberPatchPanels" INTEGER NOT NULL,
    "numberOfCopperPatchPanels" INTEGER NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,

    CONSTRAINT "OcpRack_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Server" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "deviceModelName" TEXT NOT NULL,
    "deviceHostName" TEXT NOT NULL,
    "deviceHostNameNumberStart" INTEGER NOT NULL,
    "deviceHostNameNumberEnd" INTEGER NOT NULL,
    "numberOfGpusPerServer" INTEGER NOT NULL,
    "serverRackUnitSize" INTEGER NOT NULL,
    "serverWidth" TEXT NOT NULL,
    "serverDepth" TEXT NOT NULL,
    "serverCost" DOUBLE PRECISION NOT NULL,
    "totalNumberOfFiberPortsPerServer" INTEGER NOT NULL,
    "totalNumberOfCopperPortsPerServer" INTEGER NOT NULL,
    "numberOfBackendPorts" INTEGER NOT NULL,
    "backendTransceiverType" TEXT NOT NULL,
    "numberOfFrontendMgmtPorts" INTEGER NOT NULL,
    "frontendTransceiverType" TEXT NOT NULL,
    "numberOfOutOfBandPorts" INTEGER NOT NULL,
    "outOfBandType" TEXT NOT NULL,
    "numberOfStorageMgmtPorts" INTEGER NOT NULL,
    "storageTransceiverType" TEXT NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,
    "gpuComputeRackId" INTEGER NOT NULL,

    CONSTRAINT "Server_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CpuComputeRack" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "containsFiberPatchPanel" BOOLEAN NOT NULL,
    "containsCopperPatchPanel" BOOLEAN NOT NULL,
    "numberOfFiberPatchPanels" INTEGER NOT NULL,
    "numberOfCopperPatchPanels" INTEGER NOT NULL,
    "numberOfServersPerRack" INTEGER NOT NULL,
    "powerLimitPerRack" INTEGER NOT NULL,
    "powerFeedActive" BOOLEAN NOT NULL,
    "temperatureFeedActive" BOOLEAN NOT NULL,
    "waterLeakDetectionActive" BOOLEAN NOT NULL,
    "doorAccessSensorActive" BOOLEAN NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,
    "rackId" INTEGER NOT NULL,

    CONSTRAINT "CpuComputeRack_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GpuComputeRack" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "numberOfServersPerRack" INTEGER NOT NULL,
    "powerLimitPerGpuComputeRack" INTEGER NOT NULL,
    "containsFiberPatchPanel" BOOLEAN NOT NULL,
    "containsCopperPatchPanel" BOOLEAN NOT NULL,
    "numberOfFiberPatchPanels" INTEGER NOT NULL,
    "numberOfCopperPatchPanels" INTEGER NOT NULL,
    "powerFeedActive" BOOLEAN NOT NULL,
    "temperatureFeedActive" BOOLEAN NOT NULL,
    "waterLeakDetectionActive" BOOLEAN NOT NULL,
    "doorAccessSensorActive" BOOLEAN NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,
    "rackId" INTEGER NOT NULL,

    CONSTRAINT "GpuComputeRack_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LeafSwitch" (
    "id" SERIAL NOT NULL,
    "nameOfSwitch" TEXT NOT NULL,
    "sizeInNumberOfRackUnits" INTEGER NOT NULL,
    "switchRuLocationStart" INTEGER NOT NULL,
    "widthInMm" INTEGER NOT NULL,
    "depthInMm" INTEGER NOT NULL,
    "totalNumberOfFiberGbicPorts" INTEGER NOT NULL,
    "numberOfFiberPortsPerGbic" INTEGER NOT NULL,
    "transceiverType" TEXT NOT NULL,
    "numberOfFiberPortsToGpu" INTEGER NOT NULL,
    "numberOfFiberPortsToSpineSwitch" INTEGER NOT NULL,
    "powerConsumptionWatts" INTEGER NOT NULL,
    "cost" DOUBLE PRECISION NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,
    "leafSwitchRackId" INTEGER NOT NULL,

    CONSTRAINT "LeafSwitch_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LeafSwitchPort" (
    "id" SERIAL NOT NULL,
    "nameOfFiberPortsToGpu" TEXT NOT NULL,
    "nameOfFiberPortsToSpine" TEXT NOT NULL,
    "sideAInstalledOnLeft" BOOLEAN NOT NULL,
    "sideBInstalledOnLeft" BOOLEAN NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,

    CONSTRAINT "LeafSwitchPort_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SpineLeafSwitch" (
    "id" SERIAL NOT NULL,
    "nameOfSwitch" TEXT NOT NULL,
    "sizeInNumberOfRackUnits" INTEGER NOT NULL,
    "switchRuLocationStart" INTEGER NOT NULL,
    "widthInMm" INTEGER NOT NULL,
    "depthInMm" INTEGER NOT NULL,
    "totalNumberOfFiberGbicPorts" INTEGER NOT NULL,
    "numberOfFiberPortsPerGbic" INTEGER NOT NULL,
    "transceiverType" TEXT NOT NULL,
    "numberOfFiberPortsToLeafSwitch" INTEGER NOT NULL,
    "numberOfFiberPortsToSuperSpineSwitch" INTEGER NOT NULL,
    "powerConsumptionWatts" INTEGER NOT NULL,
    "cost" DOUBLE PRECISION NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,

    CONSTRAINT "SpineLeafSwitch_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SpineSwitchPort" (
    "id" SERIAL NOT NULL,
    "nameOfFiberPortsToLeaf" TEXT NOT NULL,
    "nameOfFiberPortsToSuperSpine" TEXT NOT NULL,
    "sideAInstalledOnLeft" BOOLEAN NOT NULL,
    "sideBInstalledOnLeft" BOOLEAN NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,

    CONSTRAINT "SpineSwitchPort_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SuperSpineLeafSwitch" (
    "id" SERIAL NOT NULL,
    "nameOfSwitch" TEXT NOT NULL,
    "sizeInNumberOfRackUnits" INTEGER NOT NULL,
    "switchRuLocationStart" INTEGER NOT NULL,
    "widthInMm" INTEGER NOT NULL,
    "depthInMm" INTEGER NOT NULL,
    "totalNumberOfFiberGbicPorts" INTEGER NOT NULL,
    "numberOfFiberPortsPerGbic" INTEGER NOT NULL,
    "transceiverType" TEXT NOT NULL,
    "numberOfFiberPortsToSpineSwitch" INTEGER NOT NULL,
    "numberOfFiberPortsToNetworkRoom" INTEGER NOT NULL,
    "powerConsumptionWatts" INTEGER NOT NULL,
    "cost" DOUBLE PRECISION NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,

    CONSTRAINT "SuperSpineLeafSwitch_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SuperSpineSwitchPort" (
    "id" SERIAL NOT NULL,
    "nameOfFiberPortsToSpine" TEXT NOT NULL,
    "nameOfFiberPortsToNetworkRoom" TEXT NOT NULL,
    "sideAInstalledOnLeft" BOOLEAN NOT NULL,
    "sideBInstalledOnLeft" BOOLEAN NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,

    CONSTRAINT "SuperSpineSwitchPort_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LeafSwitchRack" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "containsFiberPatchPanel" BOOLEAN NOT NULL,
    "containsCopperPatchPanel" BOOLEAN NOT NULL,
    "numberOfFiberPatchPanels" INTEGER NOT NULL,
    "numberOfCopperPatchPanels" INTEGER NOT NULL,
    "numberOfLeafSwitchesPerRack" INTEGER NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,

    CONSTRAINT "LeafSwitchRack_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SpineLeafSwitchRack" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "containsFiberPatchPanel" BOOLEAN NOT NULL,
    "containsCopperPatchPanel" BOOLEAN NOT NULL,
    "numberOfFiberPatchPanels" INTEGER NOT NULL,
    "numberOfCopperPatchPanels" INTEGER NOT NULL,
    "numberOfSpineSwitchesPerRack" INTEGER NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,

    CONSTRAINT "SpineLeafSwitchRack_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SuperSpineSwitchRack" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "containsFiberPatchPanel" BOOLEAN NOT NULL,
    "containsCopperPatchPanel" BOOLEAN NOT NULL,
    "numberOfFiberPatchPanels" INTEGER NOT NULL,
    "numberOfCopperPatchPanels" INTEGER NOT NULL,
    "numberOfSpineSwitchesPerRack" INTEGER NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,

    CONSTRAINT "SuperSpineSwitchRack_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Containment" (
    "id" SERIAL NOT NULL,
    "containmentType" TEXT NOT NULL,
    "trayWidth" INTEGER NOT NULL,
    "trayLength" INTEGER NOT NULL,
    "trayHeight" INTEGER NOT NULL,
    "numberOfPathwayLanes" INTEGER NOT NULL,
    "distanceBetweenRackTypeAndFirstLane" INTEGER NOT NULL,
    "distanceBetweenEachLaneLevel" INTEGER NOT NULL,
    "startXCoordinate" INTEGER NOT NULL,
    "endXCoordinate" INTEGER NOT NULL,
    "startYCoordinate" INTEGER NOT NULL,
    "endYCoordinate" INTEGER NOT NULL,
    "costPerLength" DOUBLE PRECISION NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,

    CONSTRAINT "Containment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cooling" (
    "id" SERIAL NOT NULL,
    "coolingType" TEXT NOT NULL,
    "coolingAmountPerRack" INTEGER NOT NULL,
    "kwhConsumptionPerRack" INTEGER NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,

    CONSTRAINT "Cooling_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ConnectivityPath" (
    "id" SERIAL NOT NULL,
    "pathName" TEXT NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,

    CONSTRAINT "ConnectivityPath_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NetworkCabinet" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "containsFiberPatchPanel" BOOLEAN NOT NULL,
    "containsCopperPatchPanel" BOOLEAN NOT NULL,
    "numberOfFiberPatchPanels" INTEGER NOT NULL,
    "numberOfCopperPatchPanels" INTEGER NOT NULL,
    "widthInMm" INTEGER NOT NULL,
    "heightInMm" INTEGER NOT NULL,
    "weightInKg" INTEGER NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,
    "networkRoomId" INTEGER NOT NULL,
    "meetMeRoomId" INTEGER NOT NULL,
    "zoneId" INTEGER NOT NULL,
    "leafSwitchRackId" INTEGER NOT NULL,
    "spineLeafSwitchRackId" INTEGER NOT NULL,
    "superSpineSwitchRackId" INTEGER NOT NULL,

    CONSTRAINT "NetworkCabinet_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cable" (
    "id" SERIAL NOT NULL,
    "cableType" TEXT NOT NULL,
    "length" TEXT NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,
    "zoneId" INTEGER NOT NULL,
    "gpuComputeRackId" INTEGER NOT NULL,
    "cpuComputeRackId" INTEGER NOT NULL,
    "leafSwitchRackId" INTEGER NOT NULL,
    "spineLeafSwitchRackId" INTEGER NOT NULL,
    "superSpineSwitchRackId" INTEGER NOT NULL,

    CONSTRAINT "Cable_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NetworkType" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,
    "gpuFrontSideId" INTEGER NOT NULL,
    "gpuRearSideId" INTEGER NOT NULL,

    CONSTRAINT "NetworkType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NetworkTopology" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,
    "gpuFrontSideId" INTEGER NOT NULL,
    "gpuRearSideId" INTEGER NOT NULL,

    CONSTRAINT "NetworkTopology_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GpuFrontSide" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,
    "gpuId" INTEGER NOT NULL,

    CONSTRAINT "GpuFrontSide_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GpuRearSide" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,
    "gpuId" INTEGER NOT NULL,

    CONSTRAINT "GpuRearSide_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NetworkTypeSouth" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "numberOfFiberGbicPorts" INTEGER NOT NULL,
    "numberOfFiberPortsPerGbic" INTEGER NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,

    CONSTRAINT "NetworkTypeSouth_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ScalableUnitGpuLeafSwitchRack" (
    "id" SERIAL NOT NULL,
    "numberOfSwitchesPerRack" INTEGER NOT NULL,
    "powerLimitPerGpuSwitchRack" INTEGER NOT NULL,
    "containsFiberPatchPanel" BOOLEAN NOT NULL,
    "containsCopperPatchPanel" BOOLEAN NOT NULL,
    "numberOfFiberPatchPanels" INTEGER NOT NULL,
    "numberOfCopperPatchPanels" INTEGER NOT NULL,
    "powerFeedActive" BOOLEAN NOT NULL,
    "temperatureFeedActive" BOOLEAN NOT NULL,
    "waterLeakDetectionActive" BOOLEAN NOT NULL,
    "doorAccessSensorActive" BOOLEAN NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,

    CONSTRAINT "ScalableUnitGpuLeafSwitchRack_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LeafSwitchGbicPort" (
    "id" SERIAL NOT NULL,
    "nameOfFiberGbic" TEXT NOT NULL,
    "numberOfFiberPortsPerGbic" INTEGER NOT NULL,
    "sideAInstalledOnLeft" BOOLEAN NOT NULL,
    "sideBInstalledOnLeft" BOOLEAN NOT NULL,
    "customerId" INTEGER NOT NULL,
    "dataHallId" INTEGER NOT NULL,

    CONSTRAINT "LeafSwitchGbicPort_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- AddForeignKey
ALTER TABLE "Project" ADD CONSTRAINT "Project_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Site" ADD CONSTRAINT "Site_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Site" ADD CONSTRAINT "Site_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "Project"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Building" ADD CONSTRAINT "Building_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Building" ADD CONSTRAINT "Building_siteId_fkey" FOREIGN KEY ("siteId") REFERENCES "Site"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Floor" ADD CONSTRAINT "Floor_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Floor" ADD CONSTRAINT "Floor_buildingId_fkey" FOREIGN KEY ("buildingId") REFERENCES "Building"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NetworkRoom" ADD CONSTRAINT "NetworkRoom_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NetworkRoom" ADD CONSTRAINT "NetworkRoom_floorId_fkey" FOREIGN KEY ("floorId") REFERENCES "Floor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MeetMeRoom" ADD CONSTRAINT "MeetMeRoom_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MeetMeRoom" ADD CONSTRAINT "MeetMeRoom_floorId_fkey" FOREIGN KEY ("floorId") REFERENCES "Floor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DataHall" ADD CONSTRAINT "DataHall_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DataHall" ADD CONSTRAINT "DataHall_floorId_fkey" FOREIGN KEY ("floorId") REFERENCES "Floor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Zone" ADD CONSTRAINT "Zone_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Zone" ADD CONSTRAINT "Zone_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Zone" ADD CONSTRAINT "Zone_zoneTypeId_fkey" FOREIGN KEY ("zoneTypeId") REFERENCES "ZoneType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ScalableUnitZone" ADD CONSTRAINT "ScalableUnitZone_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ScalableUnitZone" ADD CONSTRAINT "ScalableUnitZone_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StorageUnitZone" ADD CONSTRAINT "StorageUnitZone_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StorageUnitZone" ADD CONSTRAINT "StorageUnitZone_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SuperSpineZone" ADD CONSTRAINT "SuperSpineZone_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SuperSpineZone" ADD CONSTRAINT "SuperSpineZone_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SpineLeafZone" ADD CONSTRAINT "SpineLeafZone_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SpineLeafZone" ADD CONSTRAINT "SpineLeafZone_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Rack" ADD CONSTRAINT "Rack_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Rack" ADD CONSTRAINT "Rack_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Rack" ADD CONSTRAINT "Rack_zoneId_fkey" FOREIGN KEY ("zoneId") REFERENCES "Zone"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Rack" ADD CONSTRAINT "Rack_superSpineZoneId_fkey" FOREIGN KEY ("superSpineZoneId") REFERENCES "SuperSpineZone"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Rack" ADD CONSTRAINT "Rack_rackTypeId_fkey" FOREIGN KEY ("rackTypeId") REFERENCES "RackType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RackUnit" ADD CONSTRAINT "RackUnit_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RackUnit" ADD CONSTRAINT "RackUnit_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NetworkSwitch" ADD CONSTRAINT "NetworkSwitch_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NetworkSwitch" ADD CONSTRAINT "NetworkSwitch_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NetworkSwitch" ADD CONSTRAINT "NetworkSwitch_networkCabinetId_fkey" FOREIGN KEY ("networkCabinetId") REFERENCES "NetworkCabinet"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NetworkSwitch" ADD CONSTRAINT "NetworkSwitch_gpuComputeRackId_fkey" FOREIGN KEY ("gpuComputeRackId") REFERENCES "GpuComputeRack"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NetworkSwitch" ADD CONSTRAINT "NetworkSwitch_cpuComputeRackId_fkey" FOREIGN KEY ("cpuComputeRackId") REFERENCES "CpuComputeRack"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NetworkSwitch" ADD CONSTRAINT "NetworkSwitch_leafSwitchRackId_fkey" FOREIGN KEY ("leafSwitchRackId") REFERENCES "LeafSwitchRack"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NetworkSwitch" ADD CONSTRAINT "NetworkSwitch_spineLeafSwitchRackId_fkey" FOREIGN KEY ("spineLeafSwitchRackId") REFERENCES "SpineLeafSwitchRack"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NetworkSwitch" ADD CONSTRAINT "NetworkSwitch_superSpineSwitchRackId_fkey" FOREIGN KEY ("superSpineSwitchRackId") REFERENCES "SuperSpineSwitchRack"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatchPanelModulePort" ADD CONSTRAINT "PatchPanelModulePort_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatchPanelModulePort" ADD CONSTRAINT "PatchPanelModulePort_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FiberTrunkCable" ADD CONSTRAINT "FiberTrunkCable_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FiberTrunkCable" ADD CONSTRAINT "FiberTrunkCable_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FiberTrunkCable" ADD CONSTRAINT "FiberTrunkCable_networkCabinetId_fkey" FOREIGN KEY ("networkCabinetId") REFERENCES "NetworkCabinet"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FiberTrunkCable" ADD CONSTRAINT "FiberTrunkCable_patchPanelModulePortId_fkey" FOREIGN KEY ("patchPanelModulePortId") REFERENCES "PatchPanelModulePort"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FiberTrunkCable" ADD CONSTRAINT "FiberTrunkCable_zoneId_fkey" FOREIGN KEY ("zoneId") REFERENCES "Zone"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FiberTrunkCable" ADD CONSTRAINT "FiberTrunkCable_gpuComputeRackId_fkey" FOREIGN KEY ("gpuComputeRackId") REFERENCES "GpuComputeRack"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FiberTrunkCable" ADD CONSTRAINT "FiberTrunkCable_cpuComputeRackId_fkey" FOREIGN KEY ("cpuComputeRackId") REFERENCES "CpuComputeRack"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FiberTrunkCable" ADD CONSTRAINT "FiberTrunkCable_leafSwitchRackId_fkey" FOREIGN KEY ("leafSwitchRackId") REFERENCES "LeafSwitchRack"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FiberTrunkCable" ADD CONSTRAINT "FiberTrunkCable_spineLeafSwitchRackId_fkey" FOREIGN KEY ("spineLeafSwitchRackId") REFERENCES "SpineLeafSwitchRack"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FiberTrunkCable" ADD CONSTRAINT "FiberTrunkCable_superSpineSwitchRackId_fkey" FOREIGN KEY ("superSpineSwitchRackId") REFERENCES "SuperSpineSwitchRack"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FiberTrunkCableLeg" ADD CONSTRAINT "FiberTrunkCableLeg_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FiberTrunkCableLeg" ADD CONSTRAINT "FiberTrunkCableLeg_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FiberTrunkCableLeg" ADD CONSTRAINT "FiberTrunkCableLeg_fiberTrunkCableId_fkey" FOREIGN KEY ("fiberTrunkCableId") REFERENCES "FiberTrunkCable"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FiberTrunkCableLeg" ADD CONSTRAINT "FiberTrunkCableLeg_patchPanelModulePortId_fkey" FOREIGN KEY ("patchPanelModulePortId") REFERENCES "PatchPanelModulePort"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Gpu" ADD CONSTRAINT "Gpu_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Gpu" ADD CONSTRAINT "Gpu_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Gpu" ADD CONSTRAINT "Gpu_serverId_fkey" FOREIGN KEY ("serverId") REFERENCES "Server"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FiberTransceiverType" ADD CONSTRAINT "FiberTransceiverType_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FiberTransceiverType" ADD CONSTRAINT "FiberTransceiverType_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GpuPort" ADD CONSTRAINT "GpuPort_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GpuPort" ADD CONSTRAINT "GpuPort_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GpuPort" ADD CONSTRAINT "GpuPort_gpuFrontSideId_fkey" FOREIGN KEY ("gpuFrontSideId") REFERENCES "GpuFrontSide"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GpuPort" ADD CONSTRAINT "GpuPort_gpuRearSideId_fkey" FOREIGN KEY ("gpuRearSideId") REFERENCES "GpuRearSide"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatchPanel" ADD CONSTRAINT "PatchPanel_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatchPanel" ADD CONSTRAINT "PatchPanel_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatchPanel" ADD CONSTRAINT "PatchPanel_networkCabinetId_fkey" FOREIGN KEY ("networkCabinetId") REFERENCES "NetworkCabinet"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatchPanel" ADD CONSTRAINT "PatchPanel_zoneId_fkey" FOREIGN KEY ("zoneId") REFERENCES "Zone"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatchPanel" ADD CONSTRAINT "PatchPanel_gpuComputeRackId_fkey" FOREIGN KEY ("gpuComputeRackId") REFERENCES "GpuComputeRack"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatchPanel" ADD CONSTRAINT "PatchPanel_cpuComputeRackId_fkey" FOREIGN KEY ("cpuComputeRackId") REFERENCES "CpuComputeRack"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatchPanel" ADD CONSTRAINT "PatchPanel_leafSwitchRackId_fkey" FOREIGN KEY ("leafSwitchRackId") REFERENCES "LeafSwitchRack"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatchPanel" ADD CONSTRAINT "PatchPanel_spineLeafSwitchRackId_fkey" FOREIGN KEY ("spineLeafSwitchRackId") REFERENCES "SpineLeafSwitchRack"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatchPanel" ADD CONSTRAINT "PatchPanel_superSpineSwitchRackId_fkey" FOREIGN KEY ("superSpineSwitchRackId") REFERENCES "SuperSpineSwitchRack"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatchPanelPort" ADD CONSTRAINT "PatchPanelPort_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatchPanelPort" ADD CONSTRAINT "PatchPanelPort_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OcpRack" ADD CONSTRAINT "OcpRack_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OcpRack" ADD CONSTRAINT "OcpRack_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Server" ADD CONSTRAINT "Server_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Server" ADD CONSTRAINT "Server_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Server" ADD CONSTRAINT "Server_gpuComputeRackId_fkey" FOREIGN KEY ("gpuComputeRackId") REFERENCES "GpuComputeRack"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CpuComputeRack" ADD CONSTRAINT "CpuComputeRack_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CpuComputeRack" ADD CONSTRAINT "CpuComputeRack_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CpuComputeRack" ADD CONSTRAINT "CpuComputeRack_rackId_fkey" FOREIGN KEY ("rackId") REFERENCES "Rack"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GpuComputeRack" ADD CONSTRAINT "GpuComputeRack_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GpuComputeRack" ADD CONSTRAINT "GpuComputeRack_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GpuComputeRack" ADD CONSTRAINT "GpuComputeRack_rackId_fkey" FOREIGN KEY ("rackId") REFERENCES "Rack"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeafSwitch" ADD CONSTRAINT "LeafSwitch_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeafSwitch" ADD CONSTRAINT "LeafSwitch_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeafSwitch" ADD CONSTRAINT "LeafSwitch_leafSwitchRackId_fkey" FOREIGN KEY ("leafSwitchRackId") REFERENCES "LeafSwitchRack"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeafSwitchPort" ADD CONSTRAINT "LeafSwitchPort_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeafSwitchPort" ADD CONSTRAINT "LeafSwitchPort_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SpineLeafSwitch" ADD CONSTRAINT "SpineLeafSwitch_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SpineLeafSwitch" ADD CONSTRAINT "SpineLeafSwitch_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SpineSwitchPort" ADD CONSTRAINT "SpineSwitchPort_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SpineSwitchPort" ADD CONSTRAINT "SpineSwitchPort_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SuperSpineLeafSwitch" ADD CONSTRAINT "SuperSpineLeafSwitch_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SuperSpineLeafSwitch" ADD CONSTRAINT "SuperSpineLeafSwitch_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SuperSpineSwitchPort" ADD CONSTRAINT "SuperSpineSwitchPort_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SuperSpineSwitchPort" ADD CONSTRAINT "SuperSpineSwitchPort_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeafSwitchRack" ADD CONSTRAINT "LeafSwitchRack_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeafSwitchRack" ADD CONSTRAINT "LeafSwitchRack_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SpineLeafSwitchRack" ADD CONSTRAINT "SpineLeafSwitchRack_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SpineLeafSwitchRack" ADD CONSTRAINT "SpineLeafSwitchRack_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SuperSpineSwitchRack" ADD CONSTRAINT "SuperSpineSwitchRack_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SuperSpineSwitchRack" ADD CONSTRAINT "SuperSpineSwitchRack_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Containment" ADD CONSTRAINT "Containment_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Containment" ADD CONSTRAINT "Containment_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cooling" ADD CONSTRAINT "Cooling_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cooling" ADD CONSTRAINT "Cooling_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ConnectivityPath" ADD CONSTRAINT "ConnectivityPath_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ConnectivityPath" ADD CONSTRAINT "ConnectivityPath_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NetworkCabinet" ADD CONSTRAINT "NetworkCabinet_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NetworkCabinet" ADD CONSTRAINT "NetworkCabinet_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NetworkCabinet" ADD CONSTRAINT "NetworkCabinet_networkRoomId_fkey" FOREIGN KEY ("networkRoomId") REFERENCES "NetworkRoom"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NetworkCabinet" ADD CONSTRAINT "NetworkCabinet_meetMeRoomId_fkey" FOREIGN KEY ("meetMeRoomId") REFERENCES "MeetMeRoom"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NetworkCabinet" ADD CONSTRAINT "NetworkCabinet_zoneId_fkey" FOREIGN KEY ("zoneId") REFERENCES "Zone"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NetworkCabinet" ADD CONSTRAINT "NetworkCabinet_leafSwitchRackId_fkey" FOREIGN KEY ("leafSwitchRackId") REFERENCES "LeafSwitchRack"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NetworkCabinet" ADD CONSTRAINT "NetworkCabinet_spineLeafSwitchRackId_fkey" FOREIGN KEY ("spineLeafSwitchRackId") REFERENCES "SpineLeafSwitchRack"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NetworkCabinet" ADD CONSTRAINT "NetworkCabinet_superSpineSwitchRackId_fkey" FOREIGN KEY ("superSpineSwitchRackId") REFERENCES "SuperSpineSwitchRack"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cable" ADD CONSTRAINT "Cable_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cable" ADD CONSTRAINT "Cable_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cable" ADD CONSTRAINT "Cable_zoneId_fkey" FOREIGN KEY ("zoneId") REFERENCES "Zone"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cable" ADD CONSTRAINT "Cable_gpuComputeRackId_fkey" FOREIGN KEY ("gpuComputeRackId") REFERENCES "GpuComputeRack"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cable" ADD CONSTRAINT "Cable_cpuComputeRackId_fkey" FOREIGN KEY ("cpuComputeRackId") REFERENCES "CpuComputeRack"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cable" ADD CONSTRAINT "Cable_leafSwitchRackId_fkey" FOREIGN KEY ("leafSwitchRackId") REFERENCES "LeafSwitchRack"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cable" ADD CONSTRAINT "Cable_spineLeafSwitchRackId_fkey" FOREIGN KEY ("spineLeafSwitchRackId") REFERENCES "SpineLeafSwitchRack"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cable" ADD CONSTRAINT "Cable_superSpineSwitchRackId_fkey" FOREIGN KEY ("superSpineSwitchRackId") REFERENCES "SuperSpineSwitchRack"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NetworkType" ADD CONSTRAINT "NetworkType_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NetworkType" ADD CONSTRAINT "NetworkType_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NetworkType" ADD CONSTRAINT "NetworkType_gpuFrontSideId_fkey" FOREIGN KEY ("gpuFrontSideId") REFERENCES "GpuFrontSide"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NetworkType" ADD CONSTRAINT "NetworkType_gpuRearSideId_fkey" FOREIGN KEY ("gpuRearSideId") REFERENCES "GpuRearSide"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NetworkTopology" ADD CONSTRAINT "NetworkTopology_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NetworkTopology" ADD CONSTRAINT "NetworkTopology_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NetworkTopology" ADD CONSTRAINT "NetworkTopology_gpuFrontSideId_fkey" FOREIGN KEY ("gpuFrontSideId") REFERENCES "GpuFrontSide"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NetworkTopology" ADD CONSTRAINT "NetworkTopology_gpuRearSideId_fkey" FOREIGN KEY ("gpuRearSideId") REFERENCES "GpuRearSide"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GpuFrontSide" ADD CONSTRAINT "GpuFrontSide_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GpuFrontSide" ADD CONSTRAINT "GpuFrontSide_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GpuFrontSide" ADD CONSTRAINT "GpuFrontSide_gpuId_fkey" FOREIGN KEY ("gpuId") REFERENCES "Gpu"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GpuRearSide" ADD CONSTRAINT "GpuRearSide_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GpuRearSide" ADD CONSTRAINT "GpuRearSide_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GpuRearSide" ADD CONSTRAINT "GpuRearSide_gpuId_fkey" FOREIGN KEY ("gpuId") REFERENCES "Gpu"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NetworkTypeSouth" ADD CONSTRAINT "NetworkTypeSouth_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NetworkTypeSouth" ADD CONSTRAINT "NetworkTypeSouth_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ScalableUnitGpuLeafSwitchRack" ADD CONSTRAINT "ScalableUnitGpuLeafSwitchRack_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ScalableUnitGpuLeafSwitchRack" ADD CONSTRAINT "ScalableUnitGpuLeafSwitchRack_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeafSwitchGbicPort" ADD CONSTRAINT "LeafSwitchGbicPort_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeafSwitchGbicPort" ADD CONSTRAINT "LeafSwitchGbicPort_dataHallId_fkey" FOREIGN KEY ("dataHallId") REFERENCES "DataHall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
