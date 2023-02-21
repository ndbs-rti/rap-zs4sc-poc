@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo Mass PI Count'
@Metadata.allowExtensions: true
define root view entity ZC_Demo_Mass_PI_Count as projection on  ZI_Demo_Mass_PI_Count
{
    key FiscalYear,
    key PhysicalInventoryDocument,
    key PhysicalInventoryDocumentItem,
    @Consumption.valueHelpDefinition: [{ 
    entity: { name: 'I_ProductText', element: 'Product' } }]
    Material,
    Plant,
    StorageLocation,
    Batch,
    InventorySpecialStockType,
    QuantityInUnitOfEntry,
    UnitOfEntry,
    CountedByUser,
    PhysicalInventoryLastCountDate,
    _Stock.Stock,
    _Stock.MaterialBaseUnit
}
