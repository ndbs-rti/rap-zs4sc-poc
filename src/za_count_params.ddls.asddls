@EndUserText.label: 'Abstract entity to extend the validity'
@Metadata.allowExtensions: true
define abstract entity ZA_Count_Params
{   
    @Semantics.quantity.unitOfMeasure : 'Unit'
    QtyCount : zqty_count;
    Unit : abap.unit(3);
}
