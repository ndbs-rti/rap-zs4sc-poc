@AbapCatalog.sqlViewName: 'ZCDEMOSOANAL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo Sales Order Analytic View'
@Metadata.allowExtensions: true
define view ZC_Demo_SalesOrderAnalytic 
as select from ZI_Demo_SalesOrderCube {

    key SalesOrder,
    key SalesOrderItem,
    
    @AnalyticsDetails.query.display: #KEY_TEXT
    @AnalyticsDetails.query.axis: #FREE
    SoldToParty,
    @AnalyticsDetails.query.display: #KEY_TEXT
    @AnalyticsDetails.query.axis: #FREE
    Product,
    
    @DefaultAggregation: #SUM
    NetAmount,
    
    @DefaultAggregation: #SUM
    PriceAfterDiscount,
    
    @DefaultAggregation: #SUM
    CustomerDiscountAmount,
    
    TransactionCurrency,

    _Product,
    _SoldToParty
}
