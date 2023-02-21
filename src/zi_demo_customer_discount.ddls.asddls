@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo Customer Discount View'
define root view entity ZI_Demo_Customer_Discount 
as select from zdemoe0001_ta01
association [1..1] to I_Product as _Product
on _Product.Product = $projection.Product
association [1..1] to I_BusinessPartner as _BusinessPartner
on _BusinessPartner.BusinessPartner = $projection.BusinessPartner
{
    key partner as BusinessPartner,
    key matnr as Product,
    _BusinessPartner.BusinessPartnerName,
    _Product._Text[1: Language=$session.system_language].ProductName,
    percent_discount as PercentDiscount,
      
    @Semantics.user.createdBy: true
    created_by            as CreatedBy,
      
    @Semantics.systemDateTime.createdAt: true
    created_at            as CreatedAt,
      
    @Semantics.user.lastChangedBy: true
    last_changed_by       as LastChangedBy,
      
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at       as LastChangedAt,
      
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    local_last_changed_at as LocalLastChangedAt,
    
    _Product
}
