@EndUserText.label: 'DEMO read mat'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZC_DEMO_Mat as projection on ZI_DEMO_Mat
{
    key MaterialDocumentYear,
    key MaterialDocument,
    DocumentDate,
    PostingDate,
    AccountingDocumentType,
    InventoryTransactionType,
    CreatedByUser
}
