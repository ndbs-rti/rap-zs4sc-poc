CLASS LCL_SALESORDER_APPROVALST_D377 DEFINITION FINAL.
  PUBLIC SECTION.
    INTERFACES:
      ZDEMOEVENTIF_SALESORDER_A_210B.

    METHODS:
      CONSTRUCTOR
        IMPORTING
          IO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.
  PRIVATE SECTION.
    DATA:
      MO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.

ENDCLASS.

CLASS LCL_SALESORDER_APPROVALST_D377 IMPLEMENTATION.
  METHOD CONSTRUCTOR.
      mo_event = io_event.
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_ARRIVAL_TIMESTAMP.
      rv_timestamp = mo_event->get_arrival_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = es_business_data ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_ID.
      rv_id = mo_event->get_cloud_event_id( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_SOURCE.
      rv_source = mo_event->get_cloud_event_source( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TIMESTAMP.
      rv_timestamp = mo_event->get_cloud_event_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TYPE.
      rv_type = mo_event->get_cloud_event_type( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CUSTOM_EXT_ATTR_VALUE.
        mo_event->get_custom_ext_attr_value(
          EXPORTING
            iv_name = iv_name
          IMPORTING
            ev_custom_extension_attr = ev_custom_extension_attr ).
  ENDMETHOD.
  METHOD ZDEMOEVENTIF_SALESORDER_A_210B~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = rs_business_data ).
  ENDMETHOD.
ENDCLASS.
CLASS LCL_SALESORDER_CHANGED_V1 DEFINITION FINAL.
  PUBLIC SECTION.
    INTERFACES:
      ZDEMOEVENTIF_SALESORDER_C_A85B.

    METHODS:
      CONSTRUCTOR
        IMPORTING
          IO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.
  PRIVATE SECTION.
    DATA:
      MO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.

ENDCLASS.

CLASS LCL_SALESORDER_CHANGED_V1 IMPLEMENTATION.
  METHOD CONSTRUCTOR.
      mo_event = io_event.
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_ARRIVAL_TIMESTAMP.
      rv_timestamp = mo_event->get_arrival_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = es_business_data ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_ID.
      rv_id = mo_event->get_cloud_event_id( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_SOURCE.
      rv_source = mo_event->get_cloud_event_source( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TIMESTAMP.
      rv_timestamp = mo_event->get_cloud_event_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TYPE.
      rv_type = mo_event->get_cloud_event_type( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CUSTOM_EXT_ATTR_VALUE.
        mo_event->get_custom_ext_attr_value(
          EXPORTING
            iv_name = iv_name
          IMPORTING
            ev_custom_extension_attr = ev_custom_extension_attr ).
  ENDMETHOD.
  METHOD ZDEMOEVENTIF_SALESORDER_C_A85B~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = rs_business_data ).
  ENDMETHOD.
ENDCLASS.
CLASS LCL_SALESORDER_CREATED_V1 DEFINITION FINAL.
  PUBLIC SECTION.
    INTERFACES:
      ZDEMOEVENTIF_SALESORDER_C_8F41.

    METHODS:
      CONSTRUCTOR
        IMPORTING
          IO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.
  PRIVATE SECTION.
    DATA:
      MO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.

ENDCLASS.

CLASS LCL_SALESORDER_CREATED_V1 IMPLEMENTATION.
  METHOD CONSTRUCTOR.
      mo_event = io_event.
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_ARRIVAL_TIMESTAMP.
      rv_timestamp = mo_event->get_arrival_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = es_business_data ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_ID.
      rv_id = mo_event->get_cloud_event_id( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_SOURCE.
      rv_source = mo_event->get_cloud_event_source( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TIMESTAMP.
      rv_timestamp = mo_event->get_cloud_event_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TYPE.
      rv_type = mo_event->get_cloud_event_type( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CUSTOM_EXT_ATTR_VALUE.
        mo_event->get_custom_ext_attr_value(
          EXPORTING
            iv_name = iv_name
          IMPORTING
            ev_custom_extension_attr = ev_custom_extension_attr ).
  ENDMETHOD.
  METHOD ZDEMOEVENTIF_SALESORDER_C_8F41~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = rs_business_data ).
  ENDMETHOD.
ENDCLASS.
CLASS LCL_SALESORDER_DELETED_V1 DEFINITION FINAL.
  PUBLIC SECTION.
    INTERFACES:
      ZDEMOEVENTIF_SALESORDER_D_A4A9.

    METHODS:
      CONSTRUCTOR
        IMPORTING
          IO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.
  PRIVATE SECTION.
    DATA:
      MO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.

ENDCLASS.

CLASS LCL_SALESORDER_DELETED_V1 IMPLEMENTATION.
  METHOD CONSTRUCTOR.
      mo_event = io_event.
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_ARRIVAL_TIMESTAMP.
      rv_timestamp = mo_event->get_arrival_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = es_business_data ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_ID.
      rv_id = mo_event->get_cloud_event_id( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_SOURCE.
      rv_source = mo_event->get_cloud_event_source( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TIMESTAMP.
      rv_timestamp = mo_event->get_cloud_event_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TYPE.
      rv_type = mo_event->get_cloud_event_type( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CUSTOM_EXT_ATTR_VALUE.
        mo_event->get_custom_ext_attr_value(
          EXPORTING
            iv_name = iv_name
          IMPORTING
            ev_custom_extension_attr = ev_custom_extension_attr ).
  ENDMETHOD.
  METHOD ZDEMOEVENTIF_SALESORDER_D_A4A9~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = rs_business_data ).
  ENDMETHOD.
ENDCLASS.
CLASS LCL_SALESORDER_ITEMCHANGED_V1 DEFINITION FINAL.
  PUBLIC SECTION.
    INTERFACES:
      ZDEMOEVENTIF_SALESORDER_I_21E6.

    METHODS:
      CONSTRUCTOR
        IMPORTING
          IO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.
  PRIVATE SECTION.
    DATA:
      MO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.

ENDCLASS.

CLASS LCL_SALESORDER_ITEMCHANGED_V1 IMPLEMENTATION.
  METHOD CONSTRUCTOR.
      mo_event = io_event.
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_ARRIVAL_TIMESTAMP.
      rv_timestamp = mo_event->get_arrival_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = es_business_data ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_ID.
      rv_id = mo_event->get_cloud_event_id( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_SOURCE.
      rv_source = mo_event->get_cloud_event_source( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TIMESTAMP.
      rv_timestamp = mo_event->get_cloud_event_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TYPE.
      rv_type = mo_event->get_cloud_event_type( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CUSTOM_EXT_ATTR_VALUE.
        mo_event->get_custom_ext_attr_value(
          EXPORTING
            iv_name = iv_name
          IMPORTING
            ev_custom_extension_attr = ev_custom_extension_attr ).
  ENDMETHOD.
  METHOD ZDEMOEVENTIF_SALESORDER_I_21E6~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = rs_business_data ).
  ENDMETHOD.
ENDCLASS.
CLASS LCL_SALESORDER_ITEMCREATED_V1 DEFINITION FINAL.
  PUBLIC SECTION.
    INTERFACES:
      ZDEMOEVENTIF_SALESORDER_I_E5AB.

    METHODS:
      CONSTRUCTOR
        IMPORTING
          IO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.
  PRIVATE SECTION.
    DATA:
      MO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.

ENDCLASS.

CLASS LCL_SALESORDER_ITEMCREATED_V1 IMPLEMENTATION.
  METHOD CONSTRUCTOR.
      mo_event = io_event.
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_ARRIVAL_TIMESTAMP.
      rv_timestamp = mo_event->get_arrival_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = es_business_data ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_ID.
      rv_id = mo_event->get_cloud_event_id( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_SOURCE.
      rv_source = mo_event->get_cloud_event_source( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TIMESTAMP.
      rv_timestamp = mo_event->get_cloud_event_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TYPE.
      rv_type = mo_event->get_cloud_event_type( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CUSTOM_EXT_ATTR_VALUE.
        mo_event->get_custom_ext_attr_value(
          EXPORTING
            iv_name = iv_name
          IMPORTING
            ev_custom_extension_attr = ev_custom_extension_attr ).
  ENDMETHOD.
  METHOD ZDEMOEVENTIF_SALESORDER_I_E5AB~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = rs_business_data ).
  ENDMETHOD.
ENDCLASS.
CLASS LCL_SALESORDER_ITEMDELETED_V1 DEFINITION FINAL.
  PUBLIC SECTION.
    INTERFACES:
      ZDEMOEVENTIF_SALESORDER_I_DE6E.

    METHODS:
      CONSTRUCTOR
        IMPORTING
          IO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.
  PRIVATE SECTION.
    DATA:
      MO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.

ENDCLASS.

CLASS LCL_SALESORDER_ITEMDELETED_V1 IMPLEMENTATION.
  METHOD CONSTRUCTOR.
      mo_event = io_event.
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_ARRIVAL_TIMESTAMP.
      rv_timestamp = mo_event->get_arrival_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = es_business_data ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_ID.
      rv_id = mo_event->get_cloud_event_id( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_SOURCE.
      rv_source = mo_event->get_cloud_event_source( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TIMESTAMP.
      rv_timestamp = mo_event->get_cloud_event_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TYPE.
      rv_type = mo_event->get_cloud_event_type( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CUSTOM_EXT_ATTR_VALUE.
        mo_event->get_custom_ext_attr_value(
          EXPORTING
            iv_name = iv_name
          IMPORTING
            ev_custom_extension_attr = ev_custom_extension_attr ).
  ENDMETHOD.
  METHOD ZDEMOEVENTIF_SALESORDER_I_DE6E~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = rs_business_data ).
  ENDMETHOD.
ENDCLASS.
CLASS LCL_SALESORDER_ITMBILLGBL_FC47 DEFINITION FINAL.
  PUBLIC SECTION.
    INTERFACES:
      ZDEMOEVENTIF_SALESORDER_I_4254.

    METHODS:
      CONSTRUCTOR
        IMPORTING
          IO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.
  PRIVATE SECTION.
    DATA:
      MO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.

ENDCLASS.

CLASS LCL_SALESORDER_ITMBILLGBL_FC47 IMPLEMENTATION.
  METHOD CONSTRUCTOR.
      mo_event = io_event.
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_ARRIVAL_TIMESTAMP.
      rv_timestamp = mo_event->get_arrival_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = es_business_data ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_ID.
      rv_id = mo_event->get_cloud_event_id( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_SOURCE.
      rv_source = mo_event->get_cloud_event_source( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TIMESTAMP.
      rv_timestamp = mo_event->get_cloud_event_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TYPE.
      rv_type = mo_event->get_cloud_event_type( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CUSTOM_EXT_ATTR_VALUE.
        mo_event->get_custom_ext_attr_value(
          EXPORTING
            iv_name = iv_name
          IMPORTING
            ev_custom_extension_attr = ev_custom_extension_attr ).
  ENDMETHOD.
  METHOD ZDEMOEVENTIF_SALESORDER_I_4254~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = rs_business_data ).
  ENDMETHOD.
ENDCLASS.
CLASS LCL_SALESORDER_ITMDELIVBL_6BB6 DEFINITION FINAL.
  PUBLIC SECTION.
    INTERFACES:
      ZDEMOEVENTIF_SALESORDER_I_6ED4.

    METHODS:
      CONSTRUCTOR
        IMPORTING
          IO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.
  PRIVATE SECTION.
    DATA:
      MO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.

ENDCLASS.

CLASS LCL_SALESORDER_ITMDELIVBL_6BB6 IMPLEMENTATION.
  METHOD CONSTRUCTOR.
      mo_event = io_event.
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_ARRIVAL_TIMESTAMP.
      rv_timestamp = mo_event->get_arrival_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = es_business_data ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_ID.
      rv_id = mo_event->get_cloud_event_id( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_SOURCE.
      rv_source = mo_event->get_cloud_event_source( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TIMESTAMP.
      rv_timestamp = mo_event->get_cloud_event_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TYPE.
      rv_type = mo_event->get_cloud_event_type( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CUSTOM_EXT_ATTR_VALUE.
        mo_event->get_custom_ext_attr_value(
          EXPORTING
            iv_name = iv_name
          IMPORTING
            ev_custom_extension_attr = ev_custom_extension_attr ).
  ENDMETHOD.
  METHOD ZDEMOEVENTIF_SALESORDER_I_6ED4~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = rs_business_data ).
  ENDMETHOD.
ENDCLASS.
CLASS LCL_SALESORDER_ITMDELIVST_BC5C DEFINITION FINAL.
  PUBLIC SECTION.
    INTERFACES:
      ZDEMOEVENTIF_SALESORDER_I_84CE.

    METHODS:
      CONSTRUCTOR
        IMPORTING
          IO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.
  PRIVATE SECTION.
    DATA:
      MO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.

ENDCLASS.

CLASS LCL_SALESORDER_ITMDELIVST_BC5C IMPLEMENTATION.
  METHOD CONSTRUCTOR.
      mo_event = io_event.
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_ARRIVAL_TIMESTAMP.
      rv_timestamp = mo_event->get_arrival_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = es_business_data ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_ID.
      rv_id = mo_event->get_cloud_event_id( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_SOURCE.
      rv_source = mo_event->get_cloud_event_source( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TIMESTAMP.
      rv_timestamp = mo_event->get_cloud_event_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TYPE.
      rv_type = mo_event->get_cloud_event_type( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CUSTOM_EXT_ATTR_VALUE.
        mo_event->get_custom_ext_attr_value(
          EXPORTING
            iv_name = iv_name
          IMPORTING
            ev_custom_extension_attr = ev_custom_extension_attr ).
  ENDMETHOD.
  METHOD ZDEMOEVENTIF_SALESORDER_I_84CE~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = rs_business_data ).
  ENDMETHOD.
ENDCLASS.
CLASS LCL_SALESORDER_ITMDLVCONF_4DA1 DEFINITION FINAL.
  PUBLIC SECTION.
    INTERFACES:
      ZDEMOEVENTIF_SALESORDER_I_5E5B.

    METHODS:
      CONSTRUCTOR
        IMPORTING
          IO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.
  PRIVATE SECTION.
    DATA:
      MO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.

ENDCLASS.

CLASS LCL_SALESORDER_ITMDLVCONF_4DA1 IMPLEMENTATION.
  METHOD CONSTRUCTOR.
      mo_event = io_event.
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_ARRIVAL_TIMESTAMP.
      rv_timestamp = mo_event->get_arrival_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = es_business_data ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_ID.
      rv_id = mo_event->get_cloud_event_id( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_SOURCE.
      rv_source = mo_event->get_cloud_event_source( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TIMESTAMP.
      rv_timestamp = mo_event->get_cloud_event_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TYPE.
      rv_type = mo_event->get_cloud_event_type( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CUSTOM_EXT_ATTR_VALUE.
        mo_event->get_custom_ext_attr_value(
          EXPORTING
            iv_name = iv_name
          IMPORTING
            ev_custom_extension_attr = ev_custom_extension_attr ).
  ENDMETHOD.
  METHOD ZDEMOEVENTIF_SALESORDER_I_5E5B~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = rs_business_data ).
  ENDMETHOD.
ENDCLASS.
CLASS LCL_SALESORDER_ITMGENINCP_4404 DEFINITION FINAL.
  PUBLIC SECTION.
    INTERFACES:
      ZDEMOEVENTIF_SALESORDER_I_5509.

    METHODS:
      CONSTRUCTOR
        IMPORTING
          IO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.
  PRIVATE SECTION.
    DATA:
      MO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.

ENDCLASS.

CLASS LCL_SALESORDER_ITMGENINCP_4404 IMPLEMENTATION.
  METHOD CONSTRUCTOR.
      mo_event = io_event.
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_ARRIVAL_TIMESTAMP.
      rv_timestamp = mo_event->get_arrival_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = es_business_data ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_ID.
      rv_id = mo_event->get_cloud_event_id( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_SOURCE.
      rv_source = mo_event->get_cloud_event_source( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TIMESTAMP.
      rv_timestamp = mo_event->get_cloud_event_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TYPE.
      rv_type = mo_event->get_cloud_event_type( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CUSTOM_EXT_ATTR_VALUE.
        mo_event->get_custom_ext_attr_value(
          EXPORTING
            iv_name = iv_name
          IMPORTING
            ev_custom_extension_attr = ev_custom_extension_attr ).
  ENDMETHOD.
  METHOD ZDEMOEVENTIF_SALESORDER_I_5509~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = rs_business_data ).
  ENDMETHOD.
ENDCLASS.
CLASS LCL_SALESORDER_ITMPRFTCTR_6C70 DEFINITION FINAL.
  PUBLIC SECTION.
    INTERFACES:
      ZDEMOEVENTIF_SALESORDER_I_F1B2.

    METHODS:
      CONSTRUCTOR
        IMPORTING
          IO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.
  PRIVATE SECTION.
    DATA:
      MO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.

ENDCLASS.

CLASS LCL_SALESORDER_ITMPRFTCTR_6C70 IMPLEMENTATION.
  METHOD CONSTRUCTOR.
      mo_event = io_event.
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_ARRIVAL_TIMESTAMP.
      rv_timestamp = mo_event->get_arrival_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = es_business_data ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_ID.
      rv_id = mo_event->get_cloud_event_id( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_SOURCE.
      rv_source = mo_event->get_cloud_event_source( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TIMESTAMP.
      rv_timestamp = mo_event->get_cloud_event_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TYPE.
      rv_type = mo_event->get_cloud_event_type( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CUSTOM_EXT_ATTR_VALUE.
        mo_event->get_custom_ext_attr_value(
          EXPORTING
            iv_name = iv_name
          IMPORTING
            ev_custom_extension_attr = ev_custom_extension_attr ).
  ENDMETHOD.
  METHOD ZDEMOEVENTIF_SALESORDER_I_F1B2~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = rs_business_data ).
  ENDMETHOD.
ENDCLASS.
CLASS LCL_SALESORDER_ITMRJCNSTS_B527 DEFINITION FINAL.
  PUBLIC SECTION.
    INTERFACES:
      ZDEMOEVENTIF_SALESORDER_I_72DD.

    METHODS:
      CONSTRUCTOR
        IMPORTING
          IO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.
  PRIVATE SECTION.
    DATA:
      MO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.

ENDCLASS.

CLASS LCL_SALESORDER_ITMRJCNSTS_B527 IMPLEMENTATION.
  METHOD CONSTRUCTOR.
      mo_event = io_event.
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_ARRIVAL_TIMESTAMP.
      rv_timestamp = mo_event->get_arrival_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = es_business_data ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_ID.
      rv_id = mo_event->get_cloud_event_id( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_SOURCE.
      rv_source = mo_event->get_cloud_event_source( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TIMESTAMP.
      rv_timestamp = mo_event->get_cloud_event_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TYPE.
      rv_type = mo_event->get_cloud_event_type( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CUSTOM_EXT_ATTR_VALUE.
        mo_event->get_custom_ext_attr_value(
          EXPORTING
            iv_name = iv_name
          IMPORTING
            ev_custom_extension_attr = ev_custom_extension_attr ).
  ENDMETHOD.
  METHOD ZDEMOEVENTIF_SALESORDER_I_72DD~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = rs_business_data ).
  ENDMETHOD.
ENDCLASS.
CLASS LCL_SALESORDER_ITMSDPROCS_F23D DEFINITION FINAL.
  PUBLIC SECTION.
    INTERFACES:
      ZDEMOEVENTIF_SALESORDER_I_A8DF.

    METHODS:
      CONSTRUCTOR
        IMPORTING
          IO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.
  PRIVATE SECTION.
    DATA:
      MO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.

ENDCLASS.

CLASS LCL_SALESORDER_ITMSDPROCS_F23D IMPLEMENTATION.
  METHOD CONSTRUCTOR.
      mo_event = io_event.
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_ARRIVAL_TIMESTAMP.
      rv_timestamp = mo_event->get_arrival_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = es_business_data ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_ID.
      rv_id = mo_event->get_cloud_event_id( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_SOURCE.
      rv_source = mo_event->get_cloud_event_source( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TIMESTAMP.
      rv_timestamp = mo_event->get_cloud_event_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TYPE.
      rv_type = mo_event->get_cloud_event_type( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CUSTOM_EXT_ATTR_VALUE.
        mo_event->get_custom_ext_attr_value(
          EXPORTING
            iv_name = iv_name
          IMPORTING
            ev_custom_extension_attr = ev_custom_extension_attr ).
  ENDMETHOD.
  METHOD ZDEMOEVENTIF_SALESORDER_I_A8DF~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = rs_business_data ).
  ENDMETHOD.
ENDCLASS.
CLASS LCL_SALESORDER_ITMWBSELMN_61B4 DEFINITION FINAL.
  PUBLIC SECTION.
    INTERFACES:
      ZDEMOEVENTIF_SALESORDER_I_73E2.

    METHODS:
      CONSTRUCTOR
        IMPORTING
          IO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.
  PRIVATE SECTION.
    DATA:
      MO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.

ENDCLASS.

CLASS LCL_SALESORDER_ITMWBSELMN_61B4 IMPLEMENTATION.
  METHOD CONSTRUCTOR.
      mo_event = io_event.
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_ARRIVAL_TIMESTAMP.
      rv_timestamp = mo_event->get_arrival_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = es_business_data ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_ID.
      rv_id = mo_event->get_cloud_event_id( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_SOURCE.
      rv_source = mo_event->get_cloud_event_source( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TIMESTAMP.
      rv_timestamp = mo_event->get_cloud_event_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TYPE.
      rv_type = mo_event->get_cloud_event_type( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CUSTOM_EXT_ATTR_VALUE.
        mo_event->get_custom_ext_attr_value(
          EXPORTING
            iv_name = iv_name
          IMPORTING
            ev_custom_extension_attr = ev_custom_extension_attr ).
  ENDMETHOD.
  METHOD ZDEMOEVENTIF_SALESORDER_I_73E2~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = rs_business_data ).
  ENDMETHOD.
ENDCLASS.
CLASS LCL_SALESORDER_OVRLBLGBLK_9E56 DEFINITION FINAL.
  PUBLIC SECTION.
    INTERFACES:
      ZDEMOEVENTIF_SALESORDER_O_FB60.

    METHODS:
      CONSTRUCTOR
        IMPORTING
          IO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.
  PRIVATE SECTION.
    DATA:
      MO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.

ENDCLASS.

CLASS LCL_SALESORDER_OVRLBLGBLK_9E56 IMPLEMENTATION.
  METHOD CONSTRUCTOR.
      mo_event = io_event.
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_ARRIVAL_TIMESTAMP.
      rv_timestamp = mo_event->get_arrival_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = es_business_data ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_ID.
      rv_id = mo_event->get_cloud_event_id( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_SOURCE.
      rv_source = mo_event->get_cloud_event_source( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TIMESTAMP.
      rv_timestamp = mo_event->get_cloud_event_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TYPE.
      rv_type = mo_event->get_cloud_event_type( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CUSTOM_EXT_ATTR_VALUE.
        mo_event->get_custom_ext_attr_value(
          EXPORTING
            iv_name = iv_name
          IMPORTING
            ev_custom_extension_attr = ev_custom_extension_attr ).
  ENDMETHOD.
  METHOD ZDEMOEVENTIF_SALESORDER_O_FB60~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = rs_business_data ).
  ENDMETHOD.
ENDCLASS.
CLASS LCL_SALESORDER_OVRLDELIVS_5295 DEFINITION FINAL.
  PUBLIC SECTION.
    INTERFACES:
      ZDEMOEVENTIF_SALESORDER_O_0472.

    METHODS:
      CONSTRUCTOR
        IMPORTING
          IO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.
  PRIVATE SECTION.
    DATA:
      MO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.

ENDCLASS.

CLASS LCL_SALESORDER_OVRLDELIVS_5295 IMPLEMENTATION.
  METHOD CONSTRUCTOR.
      mo_event = io_event.
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_ARRIVAL_TIMESTAMP.
      rv_timestamp = mo_event->get_arrival_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = es_business_data ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_ID.
      rv_id = mo_event->get_cloud_event_id( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_SOURCE.
      rv_source = mo_event->get_cloud_event_source( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TIMESTAMP.
      rv_timestamp = mo_event->get_cloud_event_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TYPE.
      rv_type = mo_event->get_cloud_event_type( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CUSTOM_EXT_ATTR_VALUE.
        mo_event->get_custom_ext_attr_value(
          EXPORTING
            iv_name = iv_name
          IMPORTING
            ev_custom_extension_attr = ev_custom_extension_attr ).
  ENDMETHOD.
  METHOD ZDEMOEVENTIF_SALESORDER_O_0472~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = rs_business_data ).
  ENDMETHOD.
ENDCLASS.
CLASS LCL_SALESORDER_OVRLDLVBLK_C678 DEFINITION FINAL.
  PUBLIC SECTION.
    INTERFACES:
      ZDEMOEVENTIF_SALESORDER_O_4430.

    METHODS:
      CONSTRUCTOR
        IMPORTING
          IO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.
  PRIVATE SECTION.
    DATA:
      MO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.

ENDCLASS.

CLASS LCL_SALESORDER_OVRLDLVBLK_C678 IMPLEMENTATION.
  METHOD CONSTRUCTOR.
      mo_event = io_event.
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_ARRIVAL_TIMESTAMP.
      rv_timestamp = mo_event->get_arrival_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = es_business_data ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_ID.
      rv_id = mo_event->get_cloud_event_id( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_SOURCE.
      rv_source = mo_event->get_cloud_event_source( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TIMESTAMP.
      rv_timestamp = mo_event->get_cloud_event_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TYPE.
      rv_type = mo_event->get_cloud_event_type( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CUSTOM_EXT_ATTR_VALUE.
        mo_event->get_custom_ext_attr_value(
          EXPORTING
            iv_name = iv_name
          IMPORTING
            ev_custom_extension_attr = ev_custom_extension_attr ).
  ENDMETHOD.
  METHOD ZDEMOEVENTIF_SALESORDER_O_4430~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = rs_business_data ).
  ENDMETHOD.
ENDCLASS.
CLASS LCL_SALESORDER_OVRLDLVCON_312E DEFINITION FINAL.
  PUBLIC SECTION.
    INTERFACES:
      ZDEMOEVENTIF_SALESORDER_O_9CF0.

    METHODS:
      CONSTRUCTOR
        IMPORTING
          IO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.
  PRIVATE SECTION.
    DATA:
      MO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.

ENDCLASS.

CLASS LCL_SALESORDER_OVRLDLVCON_312E IMPLEMENTATION.
  METHOD CONSTRUCTOR.
      mo_event = io_event.
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_ARRIVAL_TIMESTAMP.
      rv_timestamp = mo_event->get_arrival_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = es_business_data ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_ID.
      rv_id = mo_event->get_cloud_event_id( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_SOURCE.
      rv_source = mo_event->get_cloud_event_source( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TIMESTAMP.
      rv_timestamp = mo_event->get_cloud_event_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TYPE.
      rv_type = mo_event->get_cloud_event_type( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CUSTOM_EXT_ATTR_VALUE.
        mo_event->get_custom_ext_attr_value(
          EXPORTING
            iv_name = iv_name
          IMPORTING
            ev_custom_extension_attr = ev_custom_extension_attr ).
  ENDMETHOD.
  METHOD ZDEMOEVENTIF_SALESORDER_O_9CF0~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = rs_business_data ).
  ENDMETHOD.
ENDCLASS.
CLASS LCL_SALESORDER_OVRLRJCNST_ABF8 DEFINITION FINAL.
  PUBLIC SECTION.
    INTERFACES:
      ZDEMOEVENTIF_SALESORDER_O_4FA0.

    METHODS:
      CONSTRUCTOR
        IMPORTING
          IO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.
  PRIVATE SECTION.
    DATA:
      MO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.

ENDCLASS.

CLASS LCL_SALESORDER_OVRLRJCNST_ABF8 IMPLEMENTATION.
  METHOD CONSTRUCTOR.
      mo_event = io_event.
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_ARRIVAL_TIMESTAMP.
      rv_timestamp = mo_event->get_arrival_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = es_business_data ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_ID.
      rv_id = mo_event->get_cloud_event_id( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_SOURCE.
      rv_source = mo_event->get_cloud_event_source( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TIMESTAMP.
      rv_timestamp = mo_event->get_cloud_event_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TYPE.
      rv_type = mo_event->get_cloud_event_type( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CUSTOM_EXT_ATTR_VALUE.
        mo_event->get_custom_ext_attr_value(
          EXPORTING
            iv_name = iv_name
          IMPORTING
            ev_custom_extension_attr = ev_custom_extension_attr ).
  ENDMETHOD.
  METHOD ZDEMOEVENTIF_SALESORDER_O_4FA0~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = rs_business_data ).
  ENDMETHOD.
ENDCLASS.
CLASS LCL_SALESORDER_OVRLSDPROC_3426 DEFINITION FINAL.
  PUBLIC SECTION.
    INTERFACES:
      ZDEMOEVENTIF_SALESORDER_O_04B5.

    METHODS:
      CONSTRUCTOR
        IMPORTING
          IO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.
  PRIVATE SECTION.
    DATA:
      MO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.

ENDCLASS.

CLASS LCL_SALESORDER_OVRLSDPROC_3426 IMPLEMENTATION.
  METHOD CONSTRUCTOR.
      mo_event = io_event.
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_ARRIVAL_TIMESTAMP.
      rv_timestamp = mo_event->get_arrival_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = es_business_data ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_ID.
      rv_id = mo_event->get_cloud_event_id( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_SOURCE.
      rv_source = mo_event->get_cloud_event_source( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TIMESTAMP.
      rv_timestamp = mo_event->get_cloud_event_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TYPE.
      rv_type = mo_event->get_cloud_event_type( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CUSTOM_EXT_ATTR_VALUE.
        mo_event->get_custom_ext_attr_value(
          EXPORTING
            iv_name = iv_name
          IMPORTING
            ev_custom_extension_attr = ev_custom_extension_attr ).
  ENDMETHOD.
  METHOD ZDEMOEVENTIF_SALESORDER_O_04B5~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = rs_business_data ).
  ENDMETHOD.
ENDCLASS.
CLASS LCL_SALESORDER_TOTCRDTCHK_D149 DEFINITION FINAL.
  PUBLIC SECTION.
    INTERFACES:
      ZDEMOEVENTIF_SALESORDER_T_9D41.

    METHODS:
      CONSTRUCTOR
        IMPORTING
          IO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.
  PRIVATE SECTION.
    DATA:
      MO_EVENT TYPE REF TO /IWXBE/IF_CONSUMER_EVENT.

ENDCLASS.

CLASS LCL_SALESORDER_TOTCRDTCHK_D149 IMPLEMENTATION.
  METHOD CONSTRUCTOR.
      mo_event = io_event.
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_ARRIVAL_TIMESTAMP.
      rv_timestamp = mo_event->get_arrival_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = es_business_data ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_ID.
      rv_id = mo_event->get_cloud_event_id( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_SOURCE.
      rv_source = mo_event->get_cloud_event_source( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TIMESTAMP.
      rv_timestamp = mo_event->get_cloud_event_timestamp( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CLOUD_EVENT_TYPE.
      rv_type = mo_event->get_cloud_event_type( ).
  ENDMETHOD.
  METHOD /IWXBE/IF_CONSUMER_EVENT~GET_CUSTOM_EXT_ATTR_VALUE.
        mo_event->get_custom_ext_attr_value(
          EXPORTING
            iv_name = iv_name
          IMPORTING
            ev_custom_extension_attr = ev_custom_extension_attr ).
  ENDMETHOD.
  METHOD ZDEMOEVENTIF_SALESORDER_T_9D41~GET_BUSINESS_DATA.
      mo_event->get_business_data( IMPORTING es_business_data = rs_business_data ).
  ENDMETHOD.
ENDCLASS.
