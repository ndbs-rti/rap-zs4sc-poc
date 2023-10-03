@EndUserText.label: 'ZC_DEMO_BP'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZC_DEMO_BP as projection on ZI_DEMO_BP
{
    key BusinessPartner,
    BusinessPartnerUUID,
    BPIdentificationNumber,
    LastName,
    FirstName,
    PersonFullName,
    PersonFullNameMaintStatus,
    FormOfAddress,
    NickName,
    UserID,
    BusinessPartnerIsBlocked,
    CreatedByUser,
    CreationDateTime,
    LastChangedByUser,
    LastChangeDateTime
}
