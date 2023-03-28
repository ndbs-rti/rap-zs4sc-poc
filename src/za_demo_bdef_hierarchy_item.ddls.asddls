@EndUserText.label: 'ZA_DEMO_BDEF_HIERARCHY_ITEM'
define abstract entity ZA_DEMO_BDEF_HIERARCHY_ITEM
{
  key dnumb : abap.numc(10);
  key itmno : abap.numc(5);
  matnr : matnr;
  @Semantics.quantity.unitOfMeasure : 'meins'
  menge : abap.quan(13,3);
  meins : abap.unit(3);
  _header  : association to parent ZA_DEMO_BDEF_HIERARCHY_HEADER
             on _header.dnumb = $projection.dnumb;
}
