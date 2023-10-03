@EndUserText.label: 'ZC_KITPOC019'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZC_KITPOC019 as projection on ZI_KITPOC019
{
    key Businesspartner,
    Firstname,
    Lastname,
    Nickname,
    Emailaddress
}
