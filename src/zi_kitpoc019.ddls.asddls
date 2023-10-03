@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_KITPOC019'
define root view entity ZI_KITPOC019 as select from zkitpoc019_ta01
{
    key businesspartner as Businesspartner,
    firstname as Firstname,
    lastname as Lastname,
    nickname as Nickname,
    emailaddress as Emailaddress
}
