@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZC_Demo_PostGI'
@Metadata.allowExtensions: true
define root view entity ZC_Demo_PostGI as projection on ZI_Demo_PostGI
{
    key uuid,
    mblnr,
    mjahr
}
