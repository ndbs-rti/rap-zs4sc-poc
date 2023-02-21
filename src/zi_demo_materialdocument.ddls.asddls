@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo MaterialDocument'
define root view entity ZI_Demo_MaterialDocument as select from I_MaterialDocumentHeader_2
composition [0..*] of ZI_Demo_MaterialDocumentItem as _MaterialDocumentItem
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
    _MaterialDocumentItem
}
