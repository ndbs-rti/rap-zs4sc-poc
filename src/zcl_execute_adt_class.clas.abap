CLASS zcl_execute_adt_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: BEGIN OF gty_file,
             filename TYPE string,
             filedata TYPE string,
           END OF gty_file,
           gtty_file TYPE TABLE OF gty_file WITH DEFAULT KEY,
           BEGIN OF gty_inb_files,
             files TYPE gtty_file,
           END OF gty_inb_files.

    INTERFACES if_oo_adt_classrun .

    METHODS getInboundTextFile
      RETURNING VALUE(rw_inb_files) TYPE gty_inb_files.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_execute_adt_class IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    DATA(lo_apj_create) = cl_apj_dt_create_content=>get_instance( ).
*
*    " Create job catalog
*    lo_apj_create->create_job_cat_entry(
*      iv_catalog_name = 'Z_KITPOC015_CATALOG'
*      iv_class_name = 'zcl_kitpoc015_job_template'
*      iv_text = 'Job KITPOC015 Catalog'
*      iv_catalog_entry_type = cl_apj_dt_create_content=>class_based
*      iv_transport_request = 'YYNK900059'
*      iv_package = 'ZS4SC'
*      ).
*
*    out->write( |Job catalog entry created successfully| ).
*
*    " Create job template
*    DATA lt_parameters TYPE if_apj_dt_exec_object=>tt_templ_val.
*
*    NEW zcl_kitpoc015_job_template( )->if_apj_dt_exec_object~get_parameters(
*      IMPORTING
*      et_parameter_val = lt_parameters
*      ).
*
*    lo_apj_create->create_job_template_entry(
*      iv_template_name = 'Z_KITPOC015_TEMPLATE'
*      iv_catalog_name = 'Z_KITPOC015_CATALOG'
*      iv_text = 'Job KITPOC015 Template'
*      it_parameters = lt_parameters
*      iv_transport_request = 'YYNK900059'
*      iv_package = 'ZS4SC'
*      ).
*
*    out->write( |Job template created successfully| ).

    DATA(lw_inb_files) = getinboundtextfile( ).
    LOOP AT lw_inb_files-files INTO DATA(lw_file).

      DATA(lv_decoded) = cl_web_http_utility=>decode_base64( encoded = lw_file-filedata ).

    ENDLOOP.

  ENDMETHOD.

  METHOD getinboundtextfile.

    DATA: lw_inb_files TYPE gty_inb_files.

    DATA(lv_url) = |https://demonodejsapp-mediating-shark-lk.cfapps.eu10-004.hana.ondemand.com| &&
    |/znodejsapi/ftpapi/getfile?ftpdir=testinb|.

    TRY.

        DATA(lo_http_destination) = cl_http_destination_provider=>create_by_url( CONV #( lv_url ) ).
        DATA(lo_http_client)  = cl_web_http_client_manager=>create_by_http_destination( lo_http_destination ).
        DATA(lo_http_request) = lo_http_client->get_http_request( ).

        lo_http_request->set_authorization_basic( i_username = 'ndbsabap01'
                                                  i_password = 'Thailand@123' ).

        DATA(lo_http_response) = lo_http_client->execute( i_method  = if_web_http_client=>get ).

        DATA(lv_reponse_status) = lo_http_response->get_status( ).
        DATA(lv_reponse_body) = lo_http_response->get_text( ).

        IF lv_reponse_status-code = 200.

          /ui2/cl_json=>deserialize(
              EXPORTING
                  json = lv_reponse_body
              CHANGING
                  data = rw_inb_files ).

        ENDIF.

      CATCH cx_root.

    ENDTRY.

  ENDMETHOD.

ENDCLASS.
