@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_AddressEmailAddress_2'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_AddressEmailAddress_2 as select from I_AddressEmailAddress_2
{
    key AddressID,
    key AddressPersonID,
    key CommMediumSequenceNumber,
    EmailAddress,
    EmailAddressIsCurrentDefault,
    CommLineNotForUnsolicitedCntct,
    ValidityStartDate,
    ValidityEndDate,
    /* Associations */
    _AddressCommunicationRemark,
    _AddressCommunicationUsage
}
