@EndUserText.label: 'ZDEMOEVENT_SalesOrder_Itm_81BD generated'
define root abstract entity ZDEMOEVENT_SalesOrder_Itm_81BD
{
  @Event.element.externalName: 'DistributionChannel'
  DistributionChannel : abap.strg;
  @Event.element.externalName: 'EventRaisedDateTime'
  EventRaisedDateTime : TIMESTAMPL;
  @Event.element.externalName: 'OrganizationDivision'
  OrganizationDivision : abap.strg;
  @Event.element.externalName: 'PreviousProfitCenter'
  PreviousProfitCenter : abap.strg;
  @Event.element.externalName: 'Product'
  Product : abap.strg;
  @Event.element.externalName: 'ProfitCenter'
  ProfitCenter : abap.strg;
  @Event.element.externalName: 'SalesOrder'
  SalesOrder : abap.strg;
  @Event.element.externalName: 'SalesOrderItem'
  SalesOrderItem : abap.strg;
  @Event.element.externalName: 'SalesOrderItemCategory'
  SalesOrderItemCategory : abap.strg;
  @Event.element.externalName: 'SalesOrderType'
  SalesOrderType : abap.strg;
  @Event.element.externalName: 'SalesOrganization'
  SalesOrganization : abap.strg;
  @Event.element.externalName: 'SoldToParty'
  SoldToParty : abap.strg;
  
}
