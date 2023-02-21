@EndUserText.label: 'Demo Customer Discount Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZC_Demo_Customer_Discount 
as projection on ZI_Demo_Customer_Discount {

    @Consumption.valueHelpDefinition: [{ 
    entity: { name: 'I_BusinessPartner', element: 'BusinessPartner' } }]
    @ObjectModel.text.element: ['BusinessPartnerName']
    key BusinessPartner,
    
    @Consumption.valueHelpDefinition: [{ 
    entity: { name: 'I_ProductText', element: 'Product' } }]
    @ObjectModel.text.element: ['ProductName']
    key Product,
    
    BusinessPartnerName,
    ProductName,
    PercentDiscount,
    
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    LocalLastChangedAt
}
