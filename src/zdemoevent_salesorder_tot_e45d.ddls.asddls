@EndUserText.label: 'ZDEMOEVENT_SalesOrder_Tot_E45D generated'
define root abstract entity ZDEMOEVENT_SalesOrder_Tot_E45D
{
  @Event.element.externalName: 'DistributionChannel'
  DistributionChannel : abap.strg;
  @Event.element.externalName: 'EventRaisedDateTime'
  EventRaisedDateTime : TIMESTAMPL;
  @Event.element.externalName: 'OrganizationDivision'
  OrganizationDivision : abap.strg;
  @Event.element.externalName: 'PreviousTotalCreditCheckStatus'
  PreviousTotalCreditCheckStatus : abap.strg;
  @Event.element.externalName: 'SalesOrder'
  SalesOrder : abap.strg;
  @Event.element.externalName: 'SalesOrderType'
  SalesOrderType : abap.strg;
  @Event.element.externalName: 'SalesOrganization'
  SalesOrganization : abap.strg;
  @Event.element.externalName: 'SoldToParty'
  SoldToParty : abap.strg;
  @Event.element.externalName: 'TotalCreditCheckStatus'
  TotalCreditCheckStatus : abap.strg;
  
}
