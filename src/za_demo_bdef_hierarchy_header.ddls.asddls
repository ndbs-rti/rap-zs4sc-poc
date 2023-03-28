@EndUserText.label: 'ZA_DEMO_BDEF_HIERARCHY_HEADER'
define root abstract entity ZA_DEMO_BDEF_HIERARCHY_HEADER
{
  key dnumb : abap.numc(10);
  dtype : abap.char(3);
  crdat : abap.dats;
  crnam : syuname;
  _item : composition [0..*] of ZA_DEMO_BDEF_HIERARCHY_ITEM;  
}
