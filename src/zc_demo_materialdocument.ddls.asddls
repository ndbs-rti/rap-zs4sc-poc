@EndUserText.label: 'Demo MaterialDocument'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZC_Demo_MaterialDocument as projection on ZI_Demo_MaterialDocument
{
    key MaterialDocumentYear,
    key MaterialDocument,
    DocumentDate,
    PostingDate,
    AccountingDocumentType,
    InventoryTransactionType,
    CreatedByUser,
    CreationDate,
    CreationTime,
    MaterialDocumentHeaderText,
    DeliveryDocument,
    ReferenceDocument,
    BillOfLading,
    Plant,
    StorageLocation,
    IssuingOrReceivingPlant,
    IssuingOrReceivingStorageLoc,
    /* Associations */
    _MaterialDocumentItem : redirected to composition child ZC_Demo_MaterialDocumentItem
}
