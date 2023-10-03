@EndUserText.label: 'ZDEMOEVENT_SalesOrder_Ovr_597F generated'
define root abstract entity ZDEMOEVENT_SalesOrder_Ovr_597F
{
  @Event.element.externalName: 'DistributionChannel'
  DistributionChannel : abap.strg;
  @Event.element.externalName: 'EventRaisedDateTime'
  EventRaisedDateTime : TIMESTAMPL;
  @Event.element.externalName: 'OrganizationDivision'
  OrganizationDivision : abap.strg;
  @Event.element.externalName: 'OverallDeliveryBlockStatus'
  OverallDeliveryBlockStatus : abap.strg;
  @Event.element.externalName: 'PreviousOvrlDelivBlkSts'
  PreviousOvrlDelivBlkSts : abap.strg;
  @Event.element.externalName: 'SalesOrder'
  SalesOrder : abap.strg;
  @Event.element.externalName: 'SalesOrderType'
  SalesOrderType : abap.strg;
  @Event.element.externalName: 'SalesOrganization'
  SalesOrganization : abap.strg;
  @Event.element.externalName: 'SoldToParty'
  SoldToParty : abap.strg;
  
}
