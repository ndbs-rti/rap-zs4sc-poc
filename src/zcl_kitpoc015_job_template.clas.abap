CLASS zcl_kitpoc015_job_template DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES: BEGIN OF gty_gorest_user_body,
             name   TYPE string,
             gender TYPE string,
             email  TYPE string,
             status TYPE string,
           END OF gty_gorest_user_body.

    INTERFACES if_apj_dt_exec_object .
    INTERFACES if_apj_rt_exec_object .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_KITPOC015_JOB_TEMPLATE IMPLEMENTATION.


  METHOD if_apj_dt_exec_object~get_parameters.

    " Return the supported selection parameters here
    et_parameter_def = VALUE #(
      ( selname = 'S_VBELN' kind = if_apj_dt_exec_object=>select_option datatype = 'C' length = 10
      param_text = 'Sales Order' changeable_ind = abap_true )
      ( selname = 'S_ERDAT' kind = if_apj_dt_exec_object=>select_option datatype = 'D'
      param_text = 'Created Date' changeable_ind = abap_true )
    ).

    " Return the default parameters values here
    et_parameter_val = VALUE #(
      ( selname = 'S_ERDAT' kind = if_apj_dt_exec_object=>select_option sign = 'I' option = 'EQ'
      low = cl_abap_context_info=>get_system_date( ) )
      ).

  ENDMETHOD.


  METHOD if_apj_rt_exec_object~execute.

    DATA: lr_vbeln TYPE RANGE OF i_salesorder-SalesOrder,
          lr_erdat TYPE RANGE OF i_salesorder-CreationDate.

    SELECT SalesOrder FROM i_salesorder
    WHERE CreationDate IN @lr_erdat AND
          SalesOrder IN @lr_vbeln
    INTO TABLE @DATA(lt_SalesOrder).

    DATA(lo_log) = cl_bali_log=>create_with_header( cl_bali_header_setter=>create( object =
                     'ZJL_KITPOC015' subobject = 'ZSUBOBJECT1' ) ).

    LOOP AT lt_SalesOrder INTO DATA(lw_SalesOrder).

      DATA(lo_application_log_free_text) = cl_bali_free_text_setter=>create(
                                            severity = if_bali_constants=>c_severity_status
                                            text = CONV #(
                                            |Service order XXX has been created from { lw_SalesOrder-SalesOrder }| ) ).

      lo_application_log_free_text->set_detail_level( detail_level = '1' ).
      lo_log->add_item( item = lo_application_log_free_text ).

    ENDLOOP.
    cl_bali_log_db=>get_instance( )->save_log( log = lo_log assign_to_current_appl_job = abap_true ).

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

*        DATA(lv_msg) = |Service order XXX has been created from { lt_SalesOrder[ 1 ]-SalesOrder } ...|.
*        RAISE EXCEPTION TYPE CX_APJ_RT_CONTENT
*        MESSAGE ID 'ZMSGCLASS'
*        TYPE 'I' NUMBER '000'  WITH lv_msg.

      CATCH cx_root.

    ENDTRY.

  ENDMETHOD.
ENDCLASS.
