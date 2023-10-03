@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI Demo Outbound API Interface'
define root view entity ZI_DEMO_OUTBOUND_API 
    as select from I_BusinessUser
//composition of target_data_source_name as _association_name
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
    UserID,
    BusinessPartnerIsBlocked,
    CreatedByUser,
    CreationDateTime,
    LastChangedByUser,
    LastChangeDateTime,
    // _association_name // Make association public
    _WorkplaceAddress.DefaultEmailAddress,
    _WorkplaceAddress.AddressID,
    _WorkplaceAddress.AddressPersonID
}
