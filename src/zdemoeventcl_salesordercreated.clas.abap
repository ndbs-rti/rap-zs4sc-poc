class ZDEMOEVENTCL_SALESORDERCREATED definition
  public
  inheriting from ZDEMOEVENTCL_SALESOR_CE05_BASE
  final
  create public .

public section.

    TYPES: BEGIN OF gty_gorest_user_body,
             name   TYPE string,
             gender TYPE string,
             email  TYPE string,
             status TYPE string,
           END OF gty_gorest_user_body.

  methods ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_APPROVA_3DF8
    redefinition .
  methods ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_CHANGED_V1
    redefinition .
  methods ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_CREATED_V1
    redefinition .
  methods ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_DELETED_V1
    redefinition .
  methods ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_ITEMCHA_6C6C
    redefinition .
  methods ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_ITEMCRE_0B97
    redefinition .
  methods ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_ITEMDEL_8D3B
    redefinition .
  methods ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_ITMBILL_503F
    redefinition .
  methods ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_ITMDELI_9517
    redefinition .
  methods ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_ITMDELI_25D2
    redefinition .
  methods ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_ITMDLVC_36FA
    redefinition .
  methods ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_ITMGENI_B285
    redefinition .
  methods ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_ITMPRFT_BEA9
    redefinition .
  methods ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_ITMRJCN_ECAE
    redefinition .
  methods ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_ITMSDPR_5652
    redefinition .
  methods ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_ITMWBSE_E0D0
    redefinition .
  methods ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_OVRLBLG_0F8E
    redefinition .
  methods ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_OVRLDEL_FD03
    redefinition .
  methods ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_OVRLDLV_D1E1
    redefinition .
  methods ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_OVRLDLV_F42C
    redefinition .
  methods ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_OVRLRJC_DA42
    redefinition .
  methods ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_OVRLSDP_1791
    redefinition .
  methods ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_TOTCRDT_2C30
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS ZDEMOEVENTCL_SALESORDERCREATED IMPLEMENTATION.


METHOD ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_APPROVA_3DF8.

  " Event Type: sap.s4.beh.salesorder.v1.SalesOrder.ApprovalStsChanged.v1
*   DATA ls_business_data TYPE STRUCTURE FOR HIERARCHY ZDEMOEVENT_SalesOrder_App_CCB8.
*
*
*   ls_business_data = io_event->get_business_data( ).


ENDMETHOD.


METHOD ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_CHANGED_V1.

  " Event Type: sap.s4.beh.salesorder.v1.SalesOrder.Changed.v1
*   DATA ls_business_data TYPE STRUCTURE FOR HIERARCHY ZDEMOEVENT_SalesOrder_Cha_4E00.
*
*
*   ls_business_data = io_event->get_business_data( ).


ENDMETHOD.


METHOD ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_CREATED_V1.

  " Event Type: sap.s4.beh.salesorder.v1.SalesOrder.Created.v1
*   DATA ls_business_data TYPE STRUCTURE FOR HIERARCHY ZDEMOEVENT_SalesOrder_Cre_EA46.
*
*
*   ls_business_data = io_event->get_business_data( ).

    DATA: lw_body_abap     TYPE gty_gorest_user_body.

    lw_body_abap-name = '12345'.
    lw_body_abap-gender = 'male'.
    lw_body_abap-email = |{ cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( ) }@hmail.com|.
    lw_body_abap-status = 'active'.

    DATA(lv_body_json) = /ui2/cl_json=>serialize( data = lw_body_abap
                                                  pretty_name = /ui2/cl_json=>pretty_mode-camel_case ).

    DATA(lv_url) = 'https://gorest.co.in/public/v2/users'.
    DATA(lv_token) = '810bcabb44e31a13b754d853d6cb3cf798d73dbc1aa5b6b35027365511ab8ad4'.

    TRY.

        DATA(lo_http_destination) = cl_http_destination_provider=>create_by_url( CONV #( lv_url ) ).
        DATA(lo_http_client)  = cl_web_http_client_manager=>create_by_http_destination( lo_http_destination ).
        DATA(lo_http_request) = lo_http_client->get_http_request( ).

        lo_http_request->set_authorization_bearer( i_bearer = CONV #( lv_token ) ).

        lo_http_request->set_content_type( content_type = 'application/json' ).
        lo_http_request->set_text( i_text = lv_body_json
                                   i_length = strlen( lv_body_json ) ).

        DATA(lo_http_response) = lo_http_client->execute( i_method  = if_web_http_client=>post ).

        DATA(lv_reponse_body) = lo_http_response->get_text( ).

      CATCH cx_root.

    ENDTRY.

ENDMETHOD.


METHOD ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_DELETED_V1.

  " Event Type: sap.s4.beh.salesorder.v1.SalesOrder.Deleted.v1
*   DATA ls_business_data TYPE STRUCTURE FOR HIERARCHY ZDEMOEVENT_SalesOrder_Del_9A2D.
*
*
*   ls_business_data = io_event->get_business_data( ).


ENDMETHOD.


METHOD ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_ITEMCHA_6C6C.

  " Event Type: sap.s4.beh.salesorder.v1.SalesOrder.ItemChanged.v1
*   DATA ls_business_data TYPE STRUCTURE FOR HIERARCHY ZDEMOEVENT_SalesOrder_Ite_F515.
*
*
*   ls_business_data = io_event->get_business_data( ).


ENDMETHOD.


METHOD ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_ITEMCRE_0B97.

  " Event Type: sap.s4.beh.salesorder.v1.SalesOrder.ItemCreated.v1
*   DATA ls_business_data TYPE STRUCTURE FOR HIERARCHY ZDEMOEVENT_SalesOrder_Ite_C962.
*
*
*   ls_business_data = io_event->get_business_data( ).


ENDMETHOD.


METHOD ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_ITEMDEL_8D3B.

  " Event Type: sap.s4.beh.salesorder.v1.SalesOrder.ItemDeleted.v1
*   DATA ls_business_data TYPE STRUCTURE FOR HIERARCHY ZDEMOEVENT_SalesOrder_Ite_6C16.
*
*
*   ls_business_data = io_event->get_business_data( ).


ENDMETHOD.


METHOD ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_ITMBILL_503F.

  " Event Type: sap.s4.beh.salesorder.v1.SalesOrder.ItmBillgBlkStsChgd.v1
*   DATA ls_business_data TYPE STRUCTURE FOR HIERARCHY ZDEMOEVENT_SalesOrder_Itm_37B7.
*
*
*   ls_business_data = io_event->get_business_data( ).


ENDMETHOD.


METHOD ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_ITMDELI_25D2.

  " Event Type: sap.s4.beh.salesorder.v1.SalesOrder.ItmDelivStsChgd.v1
*   DATA ls_business_data TYPE STRUCTURE FOR HIERARCHY ZDEMOEVENT_SalesOrder_Itm_EB77.
*
*
*   ls_business_data = io_event->get_business_data( ).


ENDMETHOD.


METHOD ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_ITMDELI_9517.

  " Event Type: sap.s4.beh.salesorder.v1.SalesOrder.ItmDelivBlkStsChgd.v1
*   DATA ls_business_data TYPE STRUCTURE FOR HIERARCHY ZDEMOEVENT_SalesOrder_Itm_18A6.
*
*
*   ls_business_data = io_event->get_business_data( ).


ENDMETHOD.


METHOD ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_ITMDLVC_36FA.

  " Event Type: sap.s4.beh.salesorder.v1.SalesOrder.ItmDlvConfStsChgd.v1
*   DATA ls_business_data TYPE STRUCTURE FOR HIERARCHY ZDEMOEVENT_SalesOrder_Itm_BC91.
*
*
*   ls_business_data = io_event->get_business_data( ).


ENDMETHOD.


METHOD ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_ITMGENI_B285.

  " Event Type: sap.s4.beh.salesorder.v1.SalesOrder.ItmGenIncplStsChgd.v1
*   DATA ls_business_data TYPE STRUCTURE FOR HIERARCHY ZDEMOEVENT_SalesOrder_Itm_A0DA.
*
*
*   ls_business_data = io_event->get_business_data( ).


ENDMETHOD.


METHOD ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_ITMPRFT_BEA9.

  " Event Type: sap.s4.beh.salesorder.v1.SalesOrder.ItmPrftCtrChanged.v1
*   DATA ls_business_data TYPE STRUCTURE FOR HIERARCHY ZDEMOEVENT_SalesOrder_Itm_81BD.
*
*
*   ls_business_data = io_event->get_business_data( ).


ENDMETHOD.


METHOD ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_ITMRJCN_ECAE.

  " Event Type: sap.s4.beh.salesorder.v1.SalesOrder.ItmRjcnStsChgd.v1
*   DATA ls_business_data TYPE STRUCTURE FOR HIERARCHY ZDEMOEVENT_SalesOrder_Itm_A3C5.
*
*
*   ls_business_data = io_event->get_business_data( ).


ENDMETHOD.


METHOD ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_ITMSDPR_5652.

  " Event Type: sap.s4.beh.salesorder.v1.SalesOrder.ItmSDProcStsChgd.v1
*   DATA ls_business_data TYPE STRUCTURE FOR HIERARCHY ZDEMOEVENT_SalesOrder_Itm_7C99.
*
*
*   ls_business_data = io_event->get_business_data( ).


ENDMETHOD.


METHOD ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_ITMWBSE_E0D0.

  " Event Type: sap.s4.beh.salesorder.v1.SalesOrder.ItmWBSElmntChanged.v1
*   DATA ls_business_data TYPE STRUCTURE FOR HIERARCHY ZDEMOEVENT_SalesOrder_Itm_BC28.
*
*
*   ls_business_data = io_event->get_business_data( ).


ENDMETHOD.


METHOD ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_OVRLBLG_0F8E.

  " Event Type: sap.s4.beh.salesorder.v1.SalesOrder.OvrlBlgBlkStsChgd.v1
*   DATA ls_business_data TYPE STRUCTURE FOR HIERARCHY ZDEMOEVENT_SalesOrder_Ovr_1CD3.
*
*
*   ls_business_data = io_event->get_business_data( ).


ENDMETHOD.


METHOD ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_OVRLDEL_FD03.

  " Event Type: sap.s4.beh.salesorder.v1.SalesOrder.OvrlDelivStsChgd.v1
*   DATA ls_business_data TYPE STRUCTURE FOR HIERARCHY ZDEMOEVENT_SalesOrder_Ovr_B0BF.
*
*
*   ls_business_data = io_event->get_business_data( ).


ENDMETHOD.


METHOD ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_OVRLDLV_D1E1.

  " Event Type: sap.s4.beh.salesorder.v1.SalesOrder.OvrlDlvBlkStsChgd.v1
*   DATA ls_business_data TYPE STRUCTURE FOR HIERARCHY ZDEMOEVENT_SalesOrder_Ovr_597F.
*
*
*   ls_business_data = io_event->get_business_data( ).


ENDMETHOD.


METHOD ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_OVRLDLV_F42C.

  " Event Type: sap.s4.beh.salesorder.v1.SalesOrder.OvrlDlvConfStsChgd.v1
*   DATA ls_business_data TYPE STRUCTURE FOR HIERARCHY ZDEMOEVENT_SalesOrder_Ovr_ADE7.
*
*
*   ls_business_data = io_event->get_business_data( ).


ENDMETHOD.


METHOD ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_OVRLRJC_DA42.

  " Event Type: sap.s4.beh.salesorder.v1.SalesOrder.OvrlRjcnStsChgd.v1
*   DATA ls_business_data TYPE STRUCTURE FOR HIERARCHY ZDEMOEVENT_SalesOrder_Ovr_FFE6.
*
*
*   ls_business_data = io_event->get_business_data( ).


ENDMETHOD.


METHOD ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_OVRLSDP_1791.

  " Event Type: sap.s4.beh.salesorder.v1.SalesOrder.OvrlSDProcStsChgd.v1
*   DATA ls_business_data TYPE STRUCTURE FOR HIERARCHY ZDEMOEVENT_SalesOrder_Ovr_601F.
*
*
*   ls_business_data = io_event->get_business_data( ).


ENDMETHOD.


METHOD ZDEMOEVENTIF_SALE_456A_HANDLER~HANDLE_SALESORDER_TOTCRDT_2C30.

  " Event Type: sap.s4.beh.salesorder.v1.SalesOrder.TotCrdtChkStsChgd.v1
*   DATA ls_business_data TYPE STRUCTURE FOR HIERARCHY ZDEMOEVENT_SalesOrder_Tot_E45D.
*
*
*   ls_business_data = io_event->get_business_data( ).


ENDMETHOD.
ENDCLASS.
