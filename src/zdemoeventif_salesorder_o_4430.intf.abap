interface ZDEMOEVENTIF_SALESORDER_O_4430
  public .


  interfaces /IWXBE/IF_CONSUMER_EVENT .

  aliases GET_ARRIVAL_TIMESTAMP
    for /IWXBE/IF_CONSUMER_EVENT~get_arrival_timestamp .
  aliases GET_CLOUD_EVENT_ID
    for /IWXBE/IF_CONSUMER_EVENT~get_cloud_event_id .
  aliases GET_CLOUD_EVENT_SOURCE
    for /IWXBE/IF_CONSUMER_EVENT~get_cloud_event_source .
  aliases GET_CLOUD_EVENT_TIMESTAMP
    for /IWXBE/IF_CONSUMER_EVENT~get_cloud_event_timestamp .
  aliases GET_CLOUD_EVENT_TYPE
    for /IWXBE/IF_CONSUMER_EVENT~get_cloud_event_type .
  aliases GET_CUSTOM_EXT_ATTR_VALUE
    for /IWXBE/IF_CONSUMER_EVENT~get_custom_ext_attr_value .

  types:
    TY_S_SALESORDER_OVRLDLVBL_B515 TYPE STRUCTURE FOR HIERARCHY ZDEMOEVENT_SalesOrder_Ovr_597F .

  methods GET_BUSINESS_DATA
    returning
      value(RS_BUSINESS_DATA) type ty_s_salesorder_ovrldlvbl_B515
    raising
      /IWXBE/CX_EXCEPTION .
endinterface.
