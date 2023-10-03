@EndUserText.label: 'ZC Demo Outbound API Interface'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZC_DEMO_OUTBOUND_API 
    as projection on ZI_DEMO_OUTBOUND_API
{
    key BusinessPartner,
    BusinessPartnerUUID,
    BPIdentificationNumber,
    FirstName,
    LastName,
    PersonFullName,
    PersonFullNameMaintStatus,
    FormOfAddress,
    NickName,
    DefaultEmailAddress,
    AddressID,
    AddressPersonID,
    UserID,
    BusinessPartnerIsBlocked,
    CreatedByUser,
    CreationDateTime,
    LastChangedByUser,
    LastChangeDateTime
}
