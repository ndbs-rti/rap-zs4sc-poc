@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo Mass Phy.Doc.'
define root view entity ZI_Demo_Mass_Phy_Doc
as select from zdemoe0003_ta01
association [0..1] to I_PhysInvtryDocItem as _PhysInvtryDocItem
on _PhysInvtryDocItem.Material = $projection.MaterialNumber and
_PhysInvtryDocItem.Plant = $projection.Plant and
_PhysInvtryDocItem.StorageLocation = $projection.StorageLocation and
_PhysInvtryDocItem.Batch = $projection.Batch
{   
    key uuid as UUID,
    matnr as MaterialNumber,
    werks as Plant,
    @EndUserText.label : 'Storage Location'
    lgort as StorageLocation,
    charg as Batch,
    @EndUserText.label : 'Quantity'
    erfmg as Quantity,
    @EndUserText.label : 'Unit'
    erfme as Unit,
    @Semantics.user.createdBy: true
    usnam as UserName,
    @Semantics.systemDateTime.lastChangedAt: true
    chtim as LastChangeTime,
    
    _PhysInvtryDocItem
}
