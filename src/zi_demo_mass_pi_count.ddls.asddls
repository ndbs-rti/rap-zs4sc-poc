@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo Mass PI Count'
define root view entity ZI_Demo_Mass_PI_Count 
as select from I_PhysInvtryDocItem
association [1..1] to ZI_Demo_PI_Stock as _Stock
on _Stock.Material = $projection.Material and
_Stock.Plant = $projection.Plant and
_Stock.StorageLocation = $projection.StorageLocation and
_Stock.Batch = $projection.Batch and
_Stock.InventorySpecialStockType = $projection.InventorySpecialStockType
{
    key FiscalYear,
    key PhysicalInventoryDocument,
    key PhysicalInventoryDocumentItem,
    Material,
    Plant,
    StorageLocation,
    Batch,
    InventorySpecialStockType,
    PhysicalInventoryStockType,
    SalesOrder,
    SalesOrderItem,
    ScheduleLine,
    Supplier,
    Customer,
    StockOwner,
    LastChangeUser,
    LastChangeDate,
    CountedByUser,
    PhysicalInventoryLastCountDate,
    AdjustmentPostingMadeByUser,
    PostingDate,
    PhysInventoryReferenceNumber,
    PhysicalInventoryItemIsCounted,
    PhysInvtryDifferenceIsPosted,
    PhysInvtryItemIsRecounted,
    PhysInvtryItemIsDeleted,
    IsHandledInAltvUnitOfMsr,
    BookQtyBfrCountInMatlBaseUnit,
    PhysicalInventoryItemIsZero,
    Quantity,
    MaterialBaseUnit,
    QuantityInUnitOfEntry,
    UnitOfEntry,
    MaterialDocumentYear,
    MaterialDocument,
    MaterialDocumentItem,
    PhysInvtryRecountDocument,
    DifferenceAmountInCoCodeCrcy,
    Currency,
    CycleCountType,
    WBSElementInternalID,
    SlsPrcAmtInclVATInCoCodeCrcy,
    SlsPrcAmtExclVATInCoCodeCrcy,
    DiffAmountOnCountEntryInCCCrcy,
    EnteredSlsAmtInCoCodeCrcy,
    SlsPriceAmountInCoCodeCrcy,
    IsValueOnlyMaterial,
    PhysInvtryCtAmtInCoCodeCrcy,
    BookQtyAmountInCoCodeCrcy,
    ProductCategory,
    ReasonForPhysInvtryDifference,
    CrossPlantConfigurableMaterial,
    PhysInvtryDiffIsDistributed,
    _Stock
}
