@AbapCatalog.sqlViewName: 'ZIDMPISTOCK'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo PI Stock'
define view ZI_Demo_PI_Stock as select from I_MaterialStock
{
    key Material,
    key Plant,
    key StorageLocation,
    key Batch,
    key InventorySpecialStockType,
    @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
    sum(MatlWrhsStkQtyInMatlBaseUnit) as Stock,
    MaterialBaseUnit
}
group by Material, Plant, StorageLocation, Batch, InventorySpecialStockType, MaterialBaseUnit
