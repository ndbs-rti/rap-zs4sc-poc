@AbapCatalog.sqlViewName: 'ZIDEMOSOCUBE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo Sales Order Cube View'
@Analytics.dataCategory: #CUBE
define view ZI_Demo_SalesOrderCube as 
select from I_SalesOrder as _SalesOrder
inner join I_SalesOrderItem as _SalesOrderItem
on _SalesOrderItem.SalesOrder = _SalesOrder.SalesOrder
left outer join ZI_Demo_Customer_Discount as _CustomerDiscount
on _CustomerDiscount.BusinessPartner = _SalesOrder.SoldToParty and
_CustomerDiscount.Product = _SalesOrderItem.Product
{
   key _SalesOrder.SalesOrder,
   key _SalesOrderItem.SalesOrderItem,
   _SalesOrder.SoldToParty,
   _SalesOrderItem.Product,
   
   @Semantics.amount.currencyCode: 'TransactionCurrency'
   @DefaultAggregation: #SUM
   _SalesOrderItem.NetAmount,
   
   @Semantics.amount.currencyCode: 'TransactionCurrency'
   @DefaultAggregation: #SUM
   cast(
    _SalesOrderItem.NetAmount - 
    division(_SalesOrderItem.NetAmount * _CustomerDiscount.PercentDiscount,100 ,2 ) 
   as abap.dec(15, 2)) as PriceAfterDiscount,
   
   @Semantics.amount.currencyCode: 'TransactionCurrency'
   @DefaultAggregation: #SUM
   cast(
    division(_SalesOrderItem.NetAmount * _CustomerDiscount.PercentDiscount,100 ,2 ) 
   as abap.dec(15, 2)) as CustomerDiscountAmount,
   
   @Semantics.currencyCode: true
   _SalesOrderItem.TransactionCurrency,
   
   _SalesOrder._SoldToParty,
   _SalesOrderItem._Product

}
