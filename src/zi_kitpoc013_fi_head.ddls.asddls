@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_KITPOC013_FI_Head'
define root view entity ZI_KITPOC013_FI_Head as select from I_OperationalAcctgDocItem
{
    key CompanyCode,
    key FiscalYear,
    key AccountingDocument,
    key AccountingDocumentItem,
    DueCalculationBaseDate,
    _JournalEntry.LastChangeDate
}
where FinancialAccountType = 'D' and
ClearingDate is initial
