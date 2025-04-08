-- CreateTable
CREATE TABLE `Customer` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `continent` VARCHAR(191) NOT NULL,
    `country` VARCHAR(191) NOT NULL,
    `state` VARCHAR(191) NOT NULL,
    `city` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Project` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `customerId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Site` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `customerId` INTEGER NOT NULL,
    `projectId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Building` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `customerId` INTEGER NOT NULL,
    `siteId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Floor` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `lengthMeters` DOUBLE NOT NULL,
    `widthMeters` DOUBLE NOT NULL,
    `customerId` INTEGER NOT NULL,
    `buildingId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `NetworkRoom` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `tilesWidth` INTEGER NOT NULL,
    `tilesLength` INTEGER NOT NULL,
    `customerId` INTEGER NOT NULL,
    `floorId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `MeetMeRoom` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `tilesWidth` INTEGER NOT NULL,
    `tilesLength` INTEGER NOT NULL,
    `customerId` INTEGER NOT NULL,
    `floorId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DataHall` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `tilesWidth` INTEGER NOT NULL,
    `tilesLength` INTEGER NOT NULL,
    `customerId` INTEGER NOT NULL,
    `floorId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ZoneType` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Zone` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `numberOfScalableUnits` INTEGER NOT NULL,
    `numberOfRacks` INTEGER NOT NULL,
    `numberOfTilesBetweenScalableUnitRows` INTEGER NOT NULL,
    `numberOfTilesBetwenScalableUnits` INTEGER NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,
    `zoneTypeId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ScalableUnitZone` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `numberOfT1NetworkRacks` INTEGER NOT NULL,
    `numberOfGpuRacks` INTEGER NOT NULL,
    `numberOfRows` INTEGER NOT NULL,
    `numberOfTilesBetweenScalableUnitRows` INTEGER NOT NULL,
    `numberOfTilesBetwenScalableUnits` INTEGER NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `StorageUnitZone` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SuperSpineZone` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SpineLeafZone` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `RackType` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Rack` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,
    `zoneId` INTEGER NOT NULL,
    `superSpineZoneId` INTEGER NOT NULL,
    `rackTypeId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `RackUnit` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `NetworkSwitch` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,
    `networkCabinetId` INTEGER NOT NULL,
    `gpuComputeRackId` INTEGER NOT NULL,
    `cpuComputeRackId` INTEGER NOT NULL,
    `leafSwitchRackId` INTEGER NOT NULL,
    `spineLeafSwitchRackId` INTEGER NOT NULL,
    `superSpineSwitchRackId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `FiberTrunkCable` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `fiberCableType` VARCHAR(191) NOT NULL,
    `fiberTrunkCableCoreCount` VARCHAR(191) NOT NULL,
    `fiberTrunkCableSerialID` VARCHAR(191) NOT NULL,
    `fireRating` VARCHAR(191) NOT NULL,
    `numberOfFiberCoresPerConnector` INTEGER NOT NULL,
    `fibersPerSubUnit` INTEGER NOT NULL,
    `numberOfSubUnitsPerCable` INTEGER NOT NULL,
    `fiberTrunkCableDiameter` INTEGER NOT NULL,
    `numberOfLegsInTrunk` INTEGER NOT NULL,
    `lengthOfLegBreakout` INTEGER NOT NULL,
    `apcConnector` BOOLEAN NOT NULL,
    `legLabelnumber` VARCHAR(191) NOT NULL,
    `cableLength` INTEGER NOT NULL,
    `redundantFiberFeeds` BOOLEAN NOT NULL,
    `deliveredToProject` BOOLEAN NOT NULL,
    `cablePulled` BOOLEAN NOT NULL,
    `cablePlugged` BOOLEAN NOT NULL,
    `cableTested` BOOLEAN NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,
    `networkCabinetId` INTEGER NOT NULL,
    `patchPanelModulePortId` INTEGER NOT NULL,
    `zoneId` INTEGER NOT NULL,
    `gpuComputeRackId` INTEGER NOT NULL,
    `cpuComputeRackId` INTEGER NOT NULL,
    `leafSwitchRackId` INTEGER NOT NULL,
    `spineLeafSwitchRackId` INTEGER NOT NULL,
    `superSpineSwitchRackId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `FiberTrunkCableLeg` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nameAside` VARCHAR(191) NOT NULL,
    `nameBside` VARCHAR(191) NOT NULL,
    `sideAInstalledOnLeft` BOOLEAN NOT NULL,
    `sideBInstalledOnLeft` BOOLEAN NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,
    `fiberTrunkCableId` INTEGER NOT NULL,
    `patchPanelModulePortId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Gpu` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `numberFiberPortsPerGPU` INTEGER NOT NULL,
    `numberFiberPortsPerGPUFrontSide` INTEGER NOT NULL,
    `fiberPortsPerGPURearSide` INTEGER NOT NULL,
    `powerPerGPU` INTEGER NOT NULL,
    `gpuType` VARCHAR(191) NOT NULL,
    `gpuCost` INTEGER NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,
    `serverId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `FiberTransceiverType` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `transceiverType` VARCHAR(191) NOT NULL,
    `transceiverPowerDraw` INTEGER NOT NULL,
    `transceiverCost` DOUBLE NOT NULL,
    `location` VARCHAR(191) NOT NULL,
    `isInGpu` BOOLEAN NOT NULL,
    `isInCPU` BOOLEAN NOT NULL,
    `isInLeafSwitch` BOOLEAN NOT NULL,
    `isInSpineSwitch` BOOLEAN NOT NULL,
    `isInSuperSpineSwitch` BOOLEAN NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `GpuPort` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `location` VARCHAR(191) NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,
    `gpuFrontSideId` INTEGER NOT NULL,
    `gpuRearSideId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PatchPanel` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `patchPanelPresent` BOOLEAN NOT NULL,
    `patchPanelTypeFiberOrCopper` VARCHAR(191) NOT NULL,
    `numberofRusPerPatchPanelType` INTEGER NOT NULL,
    `numberofPatchPanelPorts` INTEGER NOT NULL,
    `locatedInRUNumber` INTEGER NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,
    `networkCabinetId` INTEGER NOT NULL,
    `zoneId` INTEGER NOT NULL,
    `gpuComputeRackId` INTEGER NOT NULL,
    `cpuComputeRackId` INTEGER NOT NULL,
    `leafSwitchRackId` INTEGER NOT NULL,
    `spineLeafSwitchRackId` INTEGER NOT NULL,
    `superSpineSwitchRackId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PatchPanelPort` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `locatedInRUNumber` INTEGER NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OcpRack` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `rackHeightInRackUnits` INTEGER NOT NULL,
    `rackWidthInMm` INTEGER NOT NULL,
    `containsFiberPatchPanel` BOOLEAN NOT NULL,
    `containsCopperPatchPanel` BOOLEAN NOT NULL,
    `numberOfFiberPatchPanels` INTEGER NOT NULL,
    `numberOfCopperPatchPanels` INTEGER NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Server` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `deviceModelName` VARCHAR(191) NOT NULL,
    `deviceHostName` VARCHAR(191) NOT NULL,
    `deviceHostNameNumberStart` INTEGER NOT NULL,
    `deviceHostNameNumberEnd` INTEGER NOT NULL,
    `numberOfGpusPerServer` INTEGER NOT NULL,
    `serverRackUnitSize` INTEGER NOT NULL,
    `serverWidth` VARCHAR(191) NOT NULL,
    `serverDepth` VARCHAR(191) NOT NULL,
    `serverCost` DOUBLE NOT NULL,
    `totalNumberOfFiberPortsPerServer` INTEGER NOT NULL,
    `totalNumberOfCopperPortsPerServer` INTEGER NOT NULL,
    `numberOfBackendPorts` INTEGER NOT NULL,
    `backendTransceiverType` VARCHAR(191) NOT NULL,
    `numberOfFrontendMgmtPorts` INTEGER NOT NULL,
    `frontendTransceiverType` VARCHAR(191) NOT NULL,
    `numberOfOutOfBandPorts` INTEGER NOT NULL,
    `outOfBandType` VARCHAR(191) NOT NULL,
    `numberOfStorageMgmtPorts` INTEGER NOT NULL,
    `storageTransceiverType` VARCHAR(191) NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,
    `gpuComputeRackId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CpuComputeRack` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `containsFiberPatchPanel` BOOLEAN NOT NULL,
    `containsCopperPatchPanel` BOOLEAN NOT NULL,
    `numberOfFiberPatchPanels` INTEGER NOT NULL,
    `numberOfCopperPatchPanels` INTEGER NOT NULL,
    `numberOfServersPerRack` INTEGER NOT NULL,
    `powerLimitPerRack` INTEGER NOT NULL,
    `powerFeedActive` BOOLEAN NOT NULL,
    `temperatureFeedActive` BOOLEAN NOT NULL,
    `waterLeakDetectionActive` BOOLEAN NOT NULL,
    `doorAccessSensorActive` BOOLEAN NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,
    `rackId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `GpuComputeRack` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `numberOfServersPerRack` INTEGER NOT NULL,
    `powerLimitPerGpuComputeRack` INTEGER NOT NULL,
    `containsFiberPatchPanel` BOOLEAN NOT NULL,
    `containsCopperPatchPanel` BOOLEAN NOT NULL,
    `numberOfFiberPatchPanels` INTEGER NOT NULL,
    `numberOfCopperPatchPanels` INTEGER NOT NULL,
    `powerFeedActive` BOOLEAN NOT NULL,
    `temperatureFeedActive` BOOLEAN NOT NULL,
    `waterLeakDetectionActive` BOOLEAN NOT NULL,
    `doorAccessSensorActive` BOOLEAN NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,
    `rackId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `LeafSwitch` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nameOfSwitch` VARCHAR(191) NOT NULL,
    `sizeInNumberOfRackUnits` INTEGER NOT NULL,
    `switchRuLocationStart` INTEGER NOT NULL,
    `widthInMm` INTEGER NOT NULL,
    `depthInMm` INTEGER NOT NULL,
    `totalNumberOfFiberGbicPorts` INTEGER NOT NULL,
    `numberOfFiberPortsPerGbic` INTEGER NOT NULL,
    `transceiverType` VARCHAR(191) NOT NULL,
    `numberOfFiberPortsToGpu` INTEGER NOT NULL,
    `numberOfFiberPortsToSpineSwitch` INTEGER NOT NULL,
    `powerConsumptionWatts` INTEGER NOT NULL,
    `cost` DOUBLE NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,
    `leafSwitchRackId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `LeafSwitchPort` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nameOfFiberPortsToGpu` VARCHAR(191) NOT NULL,
    `nameOfFiberPortsToSpine` VARCHAR(191) NOT NULL,
    `sideAInstalledOnLeft` BOOLEAN NOT NULL,
    `sideBInstalledOnLeft` BOOLEAN NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SpineLeafSwitch` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nameOfSwitch` VARCHAR(191) NOT NULL,
    `sizeInNumberOfRackUnits` INTEGER NOT NULL,
    `switchRuLocationStart` INTEGER NOT NULL,
    `widthInMm` INTEGER NOT NULL,
    `depthInMm` INTEGER NOT NULL,
    `totalNumberOfFiberGbicPorts` INTEGER NOT NULL,
    `numberOfFiberPortsPerGbic` INTEGER NOT NULL,
    `transceiverType` VARCHAR(191) NOT NULL,
    `numberOfFiberPortsToLeafSwitch` INTEGER NOT NULL,
    `numberOfFiberPortsToSuperSpineSwitch` INTEGER NOT NULL,
    `powerConsumptionWatts` INTEGER NOT NULL,
    `cost` DOUBLE NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SpineSwitchPort` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nameOfFiberPortsToLeaf` VARCHAR(191) NOT NULL,
    `nameOfFiberPortsToSuperSpine` VARCHAR(191) NOT NULL,
    `sideAInstalledOnLeft` BOOLEAN NOT NULL,
    `sideBInstalledOnLeft` BOOLEAN NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SuperSpineLeafSwitch` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nameOfSwitch` VARCHAR(191) NOT NULL,
    `sizeInNumberOfRackUnits` INTEGER NOT NULL,
    `switchRuLocationStart` INTEGER NOT NULL,
    `widthInMm` INTEGER NOT NULL,
    `depthInMm` INTEGER NOT NULL,
    `totalNumberOfFiberGbicPorts` INTEGER NOT NULL,
    `numberOfFiberPortsPerGbic` INTEGER NOT NULL,
    `transceiverType` VARCHAR(191) NOT NULL,
    `numberOfFiberPortsToSpineSwitch` INTEGER NOT NULL,
    `numberOfFiberPortsToNetworkRoom` INTEGER NOT NULL,
    `powerConsumptionWatts` INTEGER NOT NULL,
    `cost` DOUBLE NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SuperSpineSwitchPort` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nameOfFiberPortsToSpine` VARCHAR(191) NOT NULL,
    `nameOfFiberPortsToNetworkRoom` VARCHAR(191) NOT NULL,
    `sideAInstalledOnLeft` BOOLEAN NOT NULL,
    `sideBInstalledOnLeft` BOOLEAN NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `LeafSwitchRack` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `containsFiberPatchPanel` BOOLEAN NOT NULL,
    `containsCopperPatchPanel` BOOLEAN NOT NULL,
    `numberOfFiberPatchPanels` INTEGER NOT NULL,
    `numberOfCopperPatchPanels` INTEGER NOT NULL,
    `numberOfLeafSwitchesPerRack` INTEGER NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SpineLeafSwitchRack` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `containsFiberPatchPanel` BOOLEAN NOT NULL,
    `containsCopperPatchPanel` BOOLEAN NOT NULL,
    `numberOfFiberPatchPanels` INTEGER NOT NULL,
    `numberOfCopperPatchPanels` INTEGER NOT NULL,
    `numberOfSpineSwitchesPerRack` INTEGER NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SuperSpineSwitchRack` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `containsFiberPatchPanel` BOOLEAN NOT NULL,
    `containsCopperPatchPanel` BOOLEAN NOT NULL,
    `numberOfFiberPatchPanels` INTEGER NOT NULL,
    `numberOfCopperPatchPanels` INTEGER NOT NULL,
    `numberOfSpineSwitchesPerRack` INTEGER NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Containment` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `containmentType` VARCHAR(191) NOT NULL,
    `trayWidth` INTEGER NOT NULL,
    `trayLength` INTEGER NOT NULL,
    `trayHeight` INTEGER NOT NULL,
    `numberOfPathwayLanes` INTEGER NOT NULL,
    `distanceBetweenRackTypeAndFirstLane` INTEGER NOT NULL,
    `distanceBetweenEachLaneLevel` INTEGER NOT NULL,
    `startXCoordinate` INTEGER NOT NULL,
    `endXCoordinate` INTEGER NOT NULL,
    `startYCoordinate` INTEGER NOT NULL,
    `endYCoordinate` INTEGER NOT NULL,
    `costPerLength` DOUBLE NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Cooling` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `coolingType` VARCHAR(191) NOT NULL,
    `coolingAmountPerRack` INTEGER NOT NULL,
    `kwhConsumptionPerRack` INTEGER NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ConnectivityPath` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `pathName` VARCHAR(191) NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `NetworkCabinet` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `containsFiberPatchPanel` BOOLEAN NOT NULL,
    `containsCopperPatchPanel` BOOLEAN NOT NULL,
    `numberOfFiberPatchPanels` INTEGER NOT NULL,
    `numberOfCopperPatchPanels` INTEGER NOT NULL,
    `widthInMm` INTEGER NOT NULL,
    `heightInMm` INTEGER NOT NULL,
    `weightInKg` INTEGER NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,
    `networkRoomId` INTEGER NOT NULL,
    `meetMeRoomId` INTEGER NOT NULL,
    `zoneId` INTEGER NOT NULL,
    `leafSwitchRackId` INTEGER NOT NULL,
    `spineLeafSwitchRackId` INTEGER NOT NULL,
    `superSpineSwitchRackId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Cable` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `cableType` VARCHAR(191) NOT NULL,
    `length` VARCHAR(191) NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,
    `zoneId` INTEGER NOT NULL,
    `gpuComputeRackId` INTEGER NOT NULL,
    `cpuComputeRackId` INTEGER NOT NULL,
    `leafSwitchRackId` INTEGER NOT NULL,
    `spineLeafSwitchRackId` INTEGER NOT NULL,
    `superSpineSwitchRackId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PatchPanelModulePort` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `portLocationFrontOrBack` VARCHAR(191) NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `NetworkType` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,
    `gpuFrontSideId` INTEGER NOT NULL,
    `gpuRearSideId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `NetworkTopology` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,
    `gpuFrontSideId` INTEGER NOT NULL,
    `gpuRearSideId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `GpuFrontSide` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,
    `gpuId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `GpuRearSide` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,
    `gpuId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `NetworkTypeSouth` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `numberOfFiberGbicPorts` INTEGER NOT NULL,
    `numberOfFiberPortsPerGbic` INTEGER NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ScalableUnitGpuLeafSwitchRack` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `numberOfSwitchesPerRack` INTEGER NOT NULL,
    `powerLimitPerGpuSwitchRack` INTEGER NOT NULL,
    `containsFiberPatchPanel` BOOLEAN NOT NULL,
    `containsCopperPatchPanel` BOOLEAN NOT NULL,
    `numberOfFiberPatchPanels` INTEGER NOT NULL,
    `numberOfCopperPatchPanels` INTEGER NOT NULL,
    `powerFeedActive` BOOLEAN NOT NULL,
    `temperatureFeedActive` BOOLEAN NOT NULL,
    `waterLeakDetectionActive` BOOLEAN NOT NULL,
    `doorAccessSensorActive` BOOLEAN NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `LeafSwitchGbicPort` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nameOfFiberGbic` VARCHAR(191) NOT NULL,
    `numberOfFiberPortsPerGbic` INTEGER NOT NULL,
    `sideAInstalledOnLeft` BOOLEAN NOT NULL,
    `sideBInstalledOnLeft` BOOLEAN NOT NULL,
    `customerId` INTEGER NOT NULL,
    `dataHallId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `User_username_key`(`username`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Project` ADD CONSTRAINT `Project_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Site` ADD CONSTRAINT `Site_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Site` ADD CONSTRAINT `Site_projectId_fkey` FOREIGN KEY (`projectId`) REFERENCES `Project`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Building` ADD CONSTRAINT `Building_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Building` ADD CONSTRAINT `Building_siteId_fkey` FOREIGN KEY (`siteId`) REFERENCES `Site`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Floor` ADD CONSTRAINT `Floor_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Floor` ADD CONSTRAINT `Floor_buildingId_fkey` FOREIGN KEY (`buildingId`) REFERENCES `Building`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NetworkRoom` ADD CONSTRAINT `NetworkRoom_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NetworkRoom` ADD CONSTRAINT `NetworkRoom_floorId_fkey` FOREIGN KEY (`floorId`) REFERENCES `Floor`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MeetMeRoom` ADD CONSTRAINT `MeetMeRoom_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MeetMeRoom` ADD CONSTRAINT `MeetMeRoom_floorId_fkey` FOREIGN KEY (`floorId`) REFERENCES `Floor`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DataHall` ADD CONSTRAINT `DataHall_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DataHall` ADD CONSTRAINT `DataHall_floorId_fkey` FOREIGN KEY (`floorId`) REFERENCES `Floor`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Zone` ADD CONSTRAINT `Zone_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Zone` ADD CONSTRAINT `Zone_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Zone` ADD CONSTRAINT `Zone_zoneTypeId_fkey` FOREIGN KEY (`zoneTypeId`) REFERENCES `ZoneType`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ScalableUnitZone` ADD CONSTRAINT `ScalableUnitZone_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ScalableUnitZone` ADD CONSTRAINT `ScalableUnitZone_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `StorageUnitZone` ADD CONSTRAINT `StorageUnitZone_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `StorageUnitZone` ADD CONSTRAINT `StorageUnitZone_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SuperSpineZone` ADD CONSTRAINT `SuperSpineZone_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SuperSpineZone` ADD CONSTRAINT `SuperSpineZone_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SpineLeafZone` ADD CONSTRAINT `SpineLeafZone_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SpineLeafZone` ADD CONSTRAINT `SpineLeafZone_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Rack` ADD CONSTRAINT `Rack_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Rack` ADD CONSTRAINT `Rack_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Rack` ADD CONSTRAINT `Rack_zoneId_fkey` FOREIGN KEY (`zoneId`) REFERENCES `Zone`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Rack` ADD CONSTRAINT `Rack_superSpineZoneId_fkey` FOREIGN KEY (`superSpineZoneId`) REFERENCES `SuperSpineZone`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Rack` ADD CONSTRAINT `Rack_rackTypeId_fkey` FOREIGN KEY (`rackTypeId`) REFERENCES `RackType`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RackUnit` ADD CONSTRAINT `RackUnit_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RackUnit` ADD CONSTRAINT `RackUnit_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NetworkSwitch` ADD CONSTRAINT `NetworkSwitch_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NetworkSwitch` ADD CONSTRAINT `NetworkSwitch_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NetworkSwitch` ADD CONSTRAINT `NetworkSwitch_networkCabinetId_fkey` FOREIGN KEY (`networkCabinetId`) REFERENCES `NetworkCabinet`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NetworkSwitch` ADD CONSTRAINT `NetworkSwitch_gpuComputeRackId_fkey` FOREIGN KEY (`gpuComputeRackId`) REFERENCES `GpuComputeRack`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NetworkSwitch` ADD CONSTRAINT `NetworkSwitch_cpuComputeRackId_fkey` FOREIGN KEY (`cpuComputeRackId`) REFERENCES `CpuComputeRack`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NetworkSwitch` ADD CONSTRAINT `NetworkSwitch_leafSwitchRackId_fkey` FOREIGN KEY (`leafSwitchRackId`) REFERENCES `LeafSwitchRack`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NetworkSwitch` ADD CONSTRAINT `NetworkSwitch_spineLeafSwitchRackId_fkey` FOREIGN KEY (`spineLeafSwitchRackId`) REFERENCES `SpineLeafSwitchRack`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NetworkSwitch` ADD CONSTRAINT `NetworkSwitch_superSpineSwitchRackId_fkey` FOREIGN KEY (`superSpineSwitchRackId`) REFERENCES `SuperSpineSwitchRack`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `FiberTrunkCable` ADD CONSTRAINT `FiberTrunkCable_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `FiberTrunkCable` ADD CONSTRAINT `FiberTrunkCable_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `FiberTrunkCable` ADD CONSTRAINT `FiberTrunkCable_networkCabinetId_fkey` FOREIGN KEY (`networkCabinetId`) REFERENCES `NetworkCabinet`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `FiberTrunkCable` ADD CONSTRAINT `FiberTrunkCable_patchPanelModulePortId_fkey` FOREIGN KEY (`patchPanelModulePortId`) REFERENCES `PatchPanelModulePort`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `FiberTrunkCable` ADD CONSTRAINT `FiberTrunkCable_zoneId_fkey` FOREIGN KEY (`zoneId`) REFERENCES `Zone`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `FiberTrunkCable` ADD CONSTRAINT `FiberTrunkCable_gpuComputeRackId_fkey` FOREIGN KEY (`gpuComputeRackId`) REFERENCES `GpuComputeRack`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `FiberTrunkCable` ADD CONSTRAINT `FiberTrunkCable_cpuComputeRackId_fkey` FOREIGN KEY (`cpuComputeRackId`) REFERENCES `CpuComputeRack`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `FiberTrunkCable` ADD CONSTRAINT `FiberTrunkCable_leafSwitchRackId_fkey` FOREIGN KEY (`leafSwitchRackId`) REFERENCES `LeafSwitchRack`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `FiberTrunkCable` ADD CONSTRAINT `FiberTrunkCable_spineLeafSwitchRackId_fkey` FOREIGN KEY (`spineLeafSwitchRackId`) REFERENCES `SpineLeafSwitchRack`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `FiberTrunkCable` ADD CONSTRAINT `FiberTrunkCable_superSpineSwitchRackId_fkey` FOREIGN KEY (`superSpineSwitchRackId`) REFERENCES `SuperSpineSwitchRack`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `FiberTrunkCableLeg` ADD CONSTRAINT `FiberTrunkCableLeg_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `FiberTrunkCableLeg` ADD CONSTRAINT `FiberTrunkCableLeg_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `FiberTrunkCableLeg` ADD CONSTRAINT `FiberTrunkCableLeg_fiberTrunkCableId_fkey` FOREIGN KEY (`fiberTrunkCableId`) REFERENCES `FiberTrunkCable`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `FiberTrunkCableLeg` ADD CONSTRAINT `FiberTrunkCableLeg_patchPanelModulePortId_fkey` FOREIGN KEY (`patchPanelModulePortId`) REFERENCES `PatchPanelModulePort`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Gpu` ADD CONSTRAINT `Gpu_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Gpu` ADD CONSTRAINT `Gpu_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Gpu` ADD CONSTRAINT `Gpu_serverId_fkey` FOREIGN KEY (`serverId`) REFERENCES `Server`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `FiberTransceiverType` ADD CONSTRAINT `FiberTransceiverType_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `FiberTransceiverType` ADD CONSTRAINT `FiberTransceiverType_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `GpuPort` ADD CONSTRAINT `GpuPort_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `GpuPort` ADD CONSTRAINT `GpuPort_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `GpuPort` ADD CONSTRAINT `GpuPort_gpuFrontSideId_fkey` FOREIGN KEY (`gpuFrontSideId`) REFERENCES `GpuFrontSide`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `GpuPort` ADD CONSTRAINT `GpuPort_gpuRearSideId_fkey` FOREIGN KEY (`gpuRearSideId`) REFERENCES `GpuRearSide`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PatchPanel` ADD CONSTRAINT `PatchPanel_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PatchPanel` ADD CONSTRAINT `PatchPanel_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PatchPanel` ADD CONSTRAINT `PatchPanel_networkCabinetId_fkey` FOREIGN KEY (`networkCabinetId`) REFERENCES `NetworkCabinet`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PatchPanel` ADD CONSTRAINT `PatchPanel_zoneId_fkey` FOREIGN KEY (`zoneId`) REFERENCES `Zone`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PatchPanel` ADD CONSTRAINT `PatchPanel_gpuComputeRackId_fkey` FOREIGN KEY (`gpuComputeRackId`) REFERENCES `GpuComputeRack`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PatchPanel` ADD CONSTRAINT `PatchPanel_cpuComputeRackId_fkey` FOREIGN KEY (`cpuComputeRackId`) REFERENCES `CpuComputeRack`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PatchPanel` ADD CONSTRAINT `PatchPanel_leafSwitchRackId_fkey` FOREIGN KEY (`leafSwitchRackId`) REFERENCES `LeafSwitchRack`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PatchPanel` ADD CONSTRAINT `PatchPanel_spineLeafSwitchRackId_fkey` FOREIGN KEY (`spineLeafSwitchRackId`) REFERENCES `SpineLeafSwitchRack`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PatchPanel` ADD CONSTRAINT `PatchPanel_superSpineSwitchRackId_fkey` FOREIGN KEY (`superSpineSwitchRackId`) REFERENCES `SuperSpineSwitchRack`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PatchPanelPort` ADD CONSTRAINT `PatchPanelPort_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PatchPanelPort` ADD CONSTRAINT `PatchPanelPort_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OcpRack` ADD CONSTRAINT `OcpRack_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OcpRack` ADD CONSTRAINT `OcpRack_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Server` ADD CONSTRAINT `Server_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Server` ADD CONSTRAINT `Server_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Server` ADD CONSTRAINT `Server_gpuComputeRackId_fkey` FOREIGN KEY (`gpuComputeRackId`) REFERENCES `GpuComputeRack`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CpuComputeRack` ADD CONSTRAINT `CpuComputeRack_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CpuComputeRack` ADD CONSTRAINT `CpuComputeRack_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CpuComputeRack` ADD CONSTRAINT `CpuComputeRack_rackId_fkey` FOREIGN KEY (`rackId`) REFERENCES `Rack`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `GpuComputeRack` ADD CONSTRAINT `GpuComputeRack_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `GpuComputeRack` ADD CONSTRAINT `GpuComputeRack_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `GpuComputeRack` ADD CONSTRAINT `GpuComputeRack_rackId_fkey` FOREIGN KEY (`rackId`) REFERENCES `Rack`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `LeafSwitch` ADD CONSTRAINT `LeafSwitch_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `LeafSwitch` ADD CONSTRAINT `LeafSwitch_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `LeafSwitch` ADD CONSTRAINT `LeafSwitch_leafSwitchRackId_fkey` FOREIGN KEY (`leafSwitchRackId`) REFERENCES `LeafSwitchRack`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `LeafSwitchPort` ADD CONSTRAINT `LeafSwitchPort_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `LeafSwitchPort` ADD CONSTRAINT `LeafSwitchPort_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SpineLeafSwitch` ADD CONSTRAINT `SpineLeafSwitch_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SpineLeafSwitch` ADD CONSTRAINT `SpineLeafSwitch_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SpineSwitchPort` ADD CONSTRAINT `SpineSwitchPort_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SpineSwitchPort` ADD CONSTRAINT `SpineSwitchPort_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SuperSpineLeafSwitch` ADD CONSTRAINT `SuperSpineLeafSwitch_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SuperSpineLeafSwitch` ADD CONSTRAINT `SuperSpineLeafSwitch_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SuperSpineSwitchPort` ADD CONSTRAINT `SuperSpineSwitchPort_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SuperSpineSwitchPort` ADD CONSTRAINT `SuperSpineSwitchPort_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `LeafSwitchRack` ADD CONSTRAINT `LeafSwitchRack_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `LeafSwitchRack` ADD CONSTRAINT `LeafSwitchRack_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SpineLeafSwitchRack` ADD CONSTRAINT `SpineLeafSwitchRack_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SpineLeafSwitchRack` ADD CONSTRAINT `SpineLeafSwitchRack_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SuperSpineSwitchRack` ADD CONSTRAINT `SuperSpineSwitchRack_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SuperSpineSwitchRack` ADD CONSTRAINT `SuperSpineSwitchRack_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Containment` ADD CONSTRAINT `Containment_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Containment` ADD CONSTRAINT `Containment_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Cooling` ADD CONSTRAINT `Cooling_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Cooling` ADD CONSTRAINT `Cooling_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ConnectivityPath` ADD CONSTRAINT `ConnectivityPath_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ConnectivityPath` ADD CONSTRAINT `ConnectivityPath_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NetworkCabinet` ADD CONSTRAINT `NetworkCabinet_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NetworkCabinet` ADD CONSTRAINT `NetworkCabinet_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NetworkCabinet` ADD CONSTRAINT `NetworkCabinet_networkRoomId_fkey` FOREIGN KEY (`networkRoomId`) REFERENCES `NetworkRoom`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NetworkCabinet` ADD CONSTRAINT `NetworkCabinet_meetMeRoomId_fkey` FOREIGN KEY (`meetMeRoomId`) REFERENCES `MeetMeRoom`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NetworkCabinet` ADD CONSTRAINT `NetworkCabinet_zoneId_fkey` FOREIGN KEY (`zoneId`) REFERENCES `Zone`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NetworkCabinet` ADD CONSTRAINT `NetworkCabinet_leafSwitchRackId_fkey` FOREIGN KEY (`leafSwitchRackId`) REFERENCES `LeafSwitchRack`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NetworkCabinet` ADD CONSTRAINT `NetworkCabinet_spineLeafSwitchRackId_fkey` FOREIGN KEY (`spineLeafSwitchRackId`) REFERENCES `SpineLeafSwitchRack`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NetworkCabinet` ADD CONSTRAINT `NetworkCabinet_superSpineSwitchRackId_fkey` FOREIGN KEY (`superSpineSwitchRackId`) REFERENCES `SuperSpineSwitchRack`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Cable` ADD CONSTRAINT `Cable_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Cable` ADD CONSTRAINT `Cable_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Cable` ADD CONSTRAINT `Cable_zoneId_fkey` FOREIGN KEY (`zoneId`) REFERENCES `Zone`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Cable` ADD CONSTRAINT `Cable_gpuComputeRackId_fkey` FOREIGN KEY (`gpuComputeRackId`) REFERENCES `GpuComputeRack`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Cable` ADD CONSTRAINT `Cable_cpuComputeRackId_fkey` FOREIGN KEY (`cpuComputeRackId`) REFERENCES `CpuComputeRack`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Cable` ADD CONSTRAINT `Cable_leafSwitchRackId_fkey` FOREIGN KEY (`leafSwitchRackId`) REFERENCES `LeafSwitchRack`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Cable` ADD CONSTRAINT `Cable_spineLeafSwitchRackId_fkey` FOREIGN KEY (`spineLeafSwitchRackId`) REFERENCES `SpineLeafSwitchRack`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Cable` ADD CONSTRAINT `Cable_superSpineSwitchRackId_fkey` FOREIGN KEY (`superSpineSwitchRackId`) REFERENCES `SuperSpineSwitchRack`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PatchPanelModulePort` ADD CONSTRAINT `PatchPanelModulePort_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PatchPanelModulePort` ADD CONSTRAINT `PatchPanelModulePort_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NetworkType` ADD CONSTRAINT `NetworkType_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NetworkType` ADD CONSTRAINT `NetworkType_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NetworkType` ADD CONSTRAINT `NetworkType_gpuFrontSideId_fkey` FOREIGN KEY (`gpuFrontSideId`) REFERENCES `GpuFrontSide`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NetworkType` ADD CONSTRAINT `NetworkType_gpuRearSideId_fkey` FOREIGN KEY (`gpuRearSideId`) REFERENCES `GpuRearSide`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NetworkTopology` ADD CONSTRAINT `NetworkTopology_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NetworkTopology` ADD CONSTRAINT `NetworkTopology_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NetworkTopology` ADD CONSTRAINT `NetworkTopology_gpuFrontSideId_fkey` FOREIGN KEY (`gpuFrontSideId`) REFERENCES `GpuFrontSide`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NetworkTopology` ADD CONSTRAINT `NetworkTopology_gpuRearSideId_fkey` FOREIGN KEY (`gpuRearSideId`) REFERENCES `GpuRearSide`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `GpuFrontSide` ADD CONSTRAINT `GpuFrontSide_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `GpuFrontSide` ADD CONSTRAINT `GpuFrontSide_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `GpuFrontSide` ADD CONSTRAINT `GpuFrontSide_gpuId_fkey` FOREIGN KEY (`gpuId`) REFERENCES `Gpu`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `GpuRearSide` ADD CONSTRAINT `GpuRearSide_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `GpuRearSide` ADD CONSTRAINT `GpuRearSide_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `GpuRearSide` ADD CONSTRAINT `GpuRearSide_gpuId_fkey` FOREIGN KEY (`gpuId`) REFERENCES `Gpu`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NetworkTypeSouth` ADD CONSTRAINT `NetworkTypeSouth_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NetworkTypeSouth` ADD CONSTRAINT `NetworkTypeSouth_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ScalableUnitGpuLeafSwitchRack` ADD CONSTRAINT `ScalableUnitGpuLeafSwitchRack_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ScalableUnitGpuLeafSwitchRack` ADD CONSTRAINT `ScalableUnitGpuLeafSwitchRack_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `LeafSwitchGbicPort` ADD CONSTRAINT `LeafSwitchGbicPort_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `LeafSwitchGbicPort` ADD CONSTRAINT `LeafSwitchGbicPort_dataHallId_fkey` FOREIGN KEY (`dataHallId`) REFERENCES `DataHall`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
