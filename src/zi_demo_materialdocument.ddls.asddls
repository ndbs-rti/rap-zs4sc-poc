@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo MaterialDocument'
define root view entity ZI_Demo_MaterialDocument as select from I_MaterialDocumentHeader_2
inner join ZI_Demo_MaterialDoc_201 as _Doc201
on I_MaterialDocumentHeader_2.MaterialDocument = _Doc201.MaterialDocument and
I_MaterialDocumentHeader_2.MaterialDocumentYear = _Doc201.MaterialDocumentYear
composition [0..*] of ZI_Demo_MaterialDocumentItem as _MaterialDocumentItem
{
    key I_MaterialDocumentHeader_2.MaterialDocumentYear,
    key I_MaterialDocumentHeader_2.MaterialDocument,
    I_MaterialDocumentHeader_2.DocumentDate,
    I_MaterialDocumentHeader_2.PostingDate,
    I_MaterialDocumentHeader_2.AccountingDocumentType,
    I_MaterialDocumentHeader_2.InventoryTransactionType,
    I_MaterialDocumentHeader_2.CreatedByUser,
    I_MaterialDocumentHeader_2.CreationDate,
    I_MaterialDocumentHeader_2.CreationTime,
    I_MaterialDocumentHeader_2.MaterialDocumentHeaderText,
    I_MaterialDocumentHeader_2.DeliveryDocument,
    I_MaterialDocumentHeader_2.ReferenceDocument,
    I_MaterialDocumentHeader_2.BillOfLading,
    I_MaterialDocumentHeader_2.Plant,
    I_MaterialDocumentHeader_2.StorageLocation,
    I_MaterialDocumentHeader_2.IssuingOrReceivingPlant,
    I_MaterialDocumentHeader_2.IssuingOrReceivingStorageLoc,
    /* Associations */
    _MaterialDocumentItem
}
