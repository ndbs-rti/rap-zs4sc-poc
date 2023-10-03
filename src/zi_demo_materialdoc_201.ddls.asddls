@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_Demo_MaterialDoc_201'
define view entity ZI_Demo_MaterialDoc_201 as select distinct from ZI_Demo_MaterialDocumentItem
{
    key MaterialDocumentYear,
    key MaterialDocument
}
where GoodsMovementType = '201'
