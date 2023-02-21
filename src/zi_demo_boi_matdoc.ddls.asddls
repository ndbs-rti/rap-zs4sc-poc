@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo Create Material Document'
define root view entity ZI_DEMO_BOI_MATDOC as select from zdemoe0002_ta01
{
    key sap_uuid as SapUuid,
    materialdocumentheadertext as Materialdocumentheadertext,
    postingdate as Postingdate,
    goodsmovementcode as Goodsmovementcode,
    material as Material,
    plant as Plant,
    storagelocation as Storagelocation,
    batch as Batch,
    goodsmovementtype as Goodsmovementtype,
    inventoryspecialstocktype as Inventoryspecialstocktype,
    costcenter as Costcenter,
    glaccount as Glaccount,
    entryunit as Entryunit,
    quantityinentryunit as Quantityinentryunit,
    
    @Semantics.user.createdBy: true
    created_by            as CreatedBy,
      
    @Semantics.systemDateTime.createdAt: true
    created_at            as CreatedAt,
      
    @Semantics.user.lastChangedBy: true
    last_changed_by       as LastChangedBy,
      
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at       as LastChangedAt,
      
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    local_last_changed_at as LocalLastChangedAt
}
