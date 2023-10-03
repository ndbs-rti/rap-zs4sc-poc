@EndUserText.label: 'ZC_KITPOC013_FI_Head'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZC_KITPOC013_FI_Head as projection on ZI_KITPOC013_FI_Head
{   
    @UI: { lineItem: [{ position: 10 },
    { type: #FOR_ACTION, dataAction: 'ChangeBaselineDate', label: 'Change Baseline Date' }] }
    key CompanyCode,
    @UI: { lineItem: [{ position: 20 }] }
    key FiscalYear,
    @UI: { lineItem: [{ position: 30 }],
           selectionField: [{ position: 10 }] }
    key AccountingDocument,
    @UI: { lineItem: [{ position: 40 }],
           selectionField: [{ position: 20 }] }
    key AccountingDocumentItem,
    @UI: { lineItem: [{ position: 50 }] }
    DueCalculationBaseDate,
    @UI: { lineItem: [{ position: 60 }] }
    LastChangeDate
}
