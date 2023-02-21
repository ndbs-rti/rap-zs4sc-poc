@EndUserText.label: 'Demo Create Material Document Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZC_DEMO_BOI_MATDOC as projection on ZI_DEMO_BOI_MATDOC {
    key SapUuid,
    Materialdocumentheadertext,
    Postingdate,
    Goodsmovementcode,
    Material,
    Plant,
    Storagelocation,
    Batch,
    Goodsmovementtype,
    Inventoryspecialstocktype,
    Costcenter,
    Glaccount,
    Entryunit,
    Quantityinentryunit,
    
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    LocalLastChangedAt
}
