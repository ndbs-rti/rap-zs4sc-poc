@EndUserText.label: 'Demo Mass Phy.Doc.'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZC_Demo_Mass_Phy_Doc as projection on ZI_Demo_Mass_Phy_Doc
{
    key UUID,
    
    @Consumption.valueHelpDefinition: [{ 
    entity: { name: 'I_ProductText', element: 'Product' } }]
    MaterialNumber,
    Plant,
    StorageLocation,
    Batch,
    Quantity,
    Unit,
    UserName,
    LastChangeTime,
    
    _PhysInvtryDocItem.PhysicalInventoryDocument,
    _PhysInvtryDocItem.FiscalYear
}
