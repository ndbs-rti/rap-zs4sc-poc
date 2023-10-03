CLASS zcl_sd_sls_check_before_save DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_badi_interface .
    INTERFACES if_sd_sls_check_before_save .
  PROTECTED SECTION.
  PRIVATE SECTION.
    TYPES: BEGIN OF gty_gorest_user_body,
             name   TYPE string,
             gender TYPE string,
             email  TYPE string,
             status TYPE string,
           END OF gty_gorest_user_body.

ENDCLASS.



CLASS ZCL_SD_SLS_CHECK_BEFORE_SAVE IMPLEMENTATION.


  METHOD if_sd_sls_check_before_save~check_document.

    DATA: lw_body_abap     TYPE gty_gorest_user_body.

    lw_body_abap-name = '12345test'.
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
ENDCLASS.
