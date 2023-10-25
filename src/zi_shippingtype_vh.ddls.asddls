@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Shipping Type'
@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.usageType.dataClass: #ORGANIZATIONAL
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S

@ObjectModel.supportedCapabilities: [ #VALUE_HELP_PROVIDER ]
@ObjectModel.modelingPattern: #VALUE_HELP_PROVIDER
@ObjectModel.dataCategory: #VALUE_HELP
@ObjectModel.representativeKey: 'ShippingType'

@Search.searchable: true
@Consumption.ranked: true

define view entity ZI_ShippingType_VH as select from I_ShippingType
{

    @ObjectModel.text.association: '_Text'
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8
    @Search.ranking: #HIGH
    key ShippingType,
    
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8
    @Search.ranking: #LOW
    @UI.hidden: true
    _Text[1: Language=$session.system_language].ShippingTypeName,
    
    /* Associations */
    _Text
}
