@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo Read Mat'
define root view entity ZI_DEMO_Mat as select from I_MaterialDocumentHeader_2
{
    key MaterialDocumentYear,
    key MaterialDocument,
    DocumentDate,
    PostingDate,
    AccountingDocumentType,
    InventoryTransactionType,
    CreatedByUser
}
