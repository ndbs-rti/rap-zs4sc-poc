@EndUserText.label: 'ZDEMOEVENT_SalesOrder_Itm_7C99 generated'
define root abstract entity ZDEMOEVENT_SalesOrder_Itm_7C99
{
  @Event.element.externalName: 'DistributionChannel'
  DistributionChannel : abap.strg;
  @Event.element.externalName: 'EventRaisedDateTime'
  EventRaisedDateTime : TIMESTAMPL;
  @Event.element.externalName: 'OrganizationDivision'
  OrganizationDivision : abap.strg;
  @Event.element.externalName: 'PreviousSDProcessStatus'
  PreviousSDProcessStatus : abap.strg;
  @Event.element.externalName: 'Product'
  Product : abap.strg;
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
  @Event.element.externalName: 'SDProcessStatus'
  SDProcessStatus : abap.strg;
  @Event.element.externalName: 'SoldToParty'
  SoldToParty : abap.strg;
  
}
