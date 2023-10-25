CLASS lhc_zi_demo_outbound_api DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    TYPES: BEGIN OF gty_gorest_user_body,
             name   TYPE string,
             gender TYPE string,
             email  TYPE string,
             status TYPE string,
           END OF gty_gorest_user_body.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_demo_outbound_api RESULT result.

    METHODS callgorestapi FOR MODIFY
      IMPORTING keys FOR ACTION zi_demo_outbound_api~callgorestapi.
    METHODS postmatdoc FOR MODIFY
      IMPORTING keys FOR ACTION zi_demo_outbound_api~postmatdoc.
    METHODS calladobeservice FOR MODIFY
      IMPORTING keys FOR ACTION zi_demo_outbound_api~calladobeservice.

ENDCLASS.

CLASS lhc_zi_demo_outbound_api IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD callgorestapi.
    DATA: "lo_instant_class TYPE REF TO /ui2/cl_json
          lw_body_abap     TYPE gty_gorest_user_body.

    READ ENTITIES OF zi_demo_outbound_api IN LOCAL MODE
    ENTITY zi_demo_outbound_api
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_user).

    READ TABLE lt_user INDEX 1 INTO DATA(lw_user).
    "DATA(lo_instant_class) = NEW /ui2/cl_json( ).
    lw_body_abap-name = lw_user-firstname.
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

        APPEND VALUE #( %msg = new_message_with_text(
                        severity = if_abap_behv_message=>severity-information
                        text = lv_reponse_body )
                         ) TO reported-zi_demo_outbound_api.

      CATCH cx_root.

    ENDTRY.

  ENDMETHOD.

  METHOD postmatdoc.

    DATA(lw_key) = keys[ 1 ].

    TRY.

        MODIFY ENTITIES OF i_materialdocumenttp
        ENTITY materialdocument
          CREATE FROM VALUE #( (
              %cid = 'CID_001'
              goodsmovementcode = '03'
              postingdate = cl_abap_context_info=>get_system_date( )
              documentdate = cl_abap_context_info=>get_system_date( )
              %control-goodsmovementcode = cl_abap_behv=>flag_changed
              %control-postingdate = cl_abap_behv=>flag_changed
              %control-documentdate = cl_abap_behv=>flag_changed
          ) )
          ENTITY materialdocument
          CREATE BY \_materialdocumentitem
          FROM VALUE #(
              (
                  %cid_ref = 'CID_001'
                  %target = VALUE #(
                     (
                          %cid = 'CID_ITM_001'
                          plant = lw_key-%param-plant
                          material = lw_key-%param-material
                          goodsmovementtype = '201'
                          storagelocation = lw_key-%param-storagelocation
                          quantityinentryunit = lw_key-%param-quantityinentryunit
                          entryunit = lw_key-%param-entryunit
                          batch = lw_key-%param-batch
                          inventoryspecialstocktype = lw_key-%param-inventoryspecialstocktype
                          costcenter = |{ lw_key-%param-costcenter ALPHA = IN }|
                          glaccount = |{ lw_key-%param-glaccount ALPHA = IN }|
                          %control-plant = cl_abap_behv=>flag_changed
                          %control-material = cl_abap_behv=>flag_changed
                          %control-goodsmovementtype = cl_abap_behv=>flag_changed
                          %control-storagelocation = cl_abap_behv=>flag_changed
                          %control-quantityinentryunit = cl_abap_behv=>flag_changed
                          %control-entryunit = cl_abap_behv=>flag_changed
                          %control-batch = cl_abap_behv=>flag_changed
                          %control-inventoryspecialstocktype = cl_abap_behv=>flag_changed
                          %control-costcenter = cl_abap_behv=>flag_changed
                          %control-glaccount = cl_abap_behv=>flag_changed
                        )
                    )
                )
            )

          MAPPED DATA(ls_create_mapped)
          FAILED DATA(ls_create_failed)
          REPORTED DATA(ls_create_reported).

          zbp_i_demo_outbound_api=>cv_matdoc_mapped = ls_create_mapped.

*          LOOP AT ls_create_reported-materialdocument INTO DATA(lw_report_src).
*          APPEND INITIAL LINE TO reported-zi_demo_outbound_api
*          ASSIGNING FIELD-SYMBOL(<lfs>).
*          <lfs>-%msg = lw_report_src-%msg.
*            APPEND VALUE #(  = lw_result-CompanyCode
*                            FiscalYear = lw_result-FiscalYear
*                            AccountingDocument = lw_result-AccountingDocument
*                            %msg = lw_report_src-%msg ) TO reported-zi_demo_outbound_api
*        ENDLOOP.

      CATCH cx_root INTO DATA(lo_exception).

    ENDTRY.

  ENDMETHOD.

  METHOD calladobeservice.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_zi_demo_outbound_api DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS save_modified REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_zi_demo_outbound_api IMPLEMENTATION.

  METHOD save_modified.
    LOOP AT zbp_i_demo_outbound_api=>cv_matdoc_mapped-materialdocument
      INTO DATA(lw_matdoc_mapped).
        CONVERT KEY OF i_materialdocumenttp FROM lw_matdoc_mapped-%pid TO DATA(lw_matdoc_key).
        APPEND VALUE #( %msg = new_message( id       = 'ZDEMO_MSGCLASS'
                                            number   = 002
                                            v1 = lw_matdoc_key-MaterialDocument
                                            v2 = lw_matdoc_key-MaterialDocumentYear
                                            severity = if_abap_behv_message=>severity-success ) )
                                            TO reported-zi_demo_outbound_api.
      ENDLOOP.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
