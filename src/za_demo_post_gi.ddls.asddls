@EndUserText.label: 'Demo Post GI'
define abstract entity ZA_Demo_Post_GI
{
    Material : matnr;
    Plant : werks_d;
    StorageLocation : abap.char( 4 );
    Batch : charg_d;
    InventorySpecialStockType : abap.char( 1 );
    CostCenter : kostl;
    GLAccount : abap.char( 10 );
    EntryUnit : abap.unit(3);
    @Semantics.quantity.unitOfMeasure : 'EntryUnit'
    QuantityInEntryUnit : abap.quan( 13, 3 );
}
