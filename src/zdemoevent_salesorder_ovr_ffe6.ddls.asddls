@EndUserText.label: 'ZDEMOEVENT_SalesOrder_Ovr_FFE6 generated'
define root abstract entity ZDEMOEVENT_SalesOrder_Ovr_FFE6
{
  @Event.element.externalName: 'DistributionChannel'
  DistributionChannel : abap.strg;
  @Event.element.externalName: 'EventRaisedDateTime'
  EventRaisedDateTime : TIMESTAMPL;
  @Event.element.externalName: 'OrganizationDivision'
  OrganizationDivision : abap.strg;
  @Event.element.externalName: 'OverallSDDocumentRejectionSts'
  OverallSDDocumentRejectionSts : abap.strg;
  @Event.element.externalName: 'PreviousOvrlSDDocRejectionSts'
  PreviousOvrlSDDocRejectionSts : abap.strg;
  @Event.element.externalName: 'SalesOrder'
  SalesOrder : abap.strg;
  @Event.element.externalName: 'SalesOrderType'
  SalesOrderType : abap.strg;
  @Event.element.externalName: 'SalesOrganization'
  SalesOrganization : abap.strg;
  @Event.element.externalName: 'SoldToParty'
  SoldToParty : abap.strg;
  
}
