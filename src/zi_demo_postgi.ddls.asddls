@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_Demo_PostGI'
define root view entity ZI_Demo_PostGI as select from zdemopostgi_ta01
{
    key uuid,
    mblnr,
    mjahr
}
