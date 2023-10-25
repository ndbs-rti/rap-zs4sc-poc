CLASS zcl_abap_utilities DEFINITION
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

    METHODS getinboundtextfile
      IMPORTING VALUE(iv_ftp_dir) TYPE string
      RETURNING VALUE(rw_inb_files) TYPE gty_inb_files.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_ABAP_UTILITIES IMPLEMENTATION.


  METHOD getinboundtextfile.

    DATA: lw_inb_files TYPE gty_inb_files.

    DATA(lv_url) = |https://demonodejsapp-mediating-shark-lk.cfapps.eu10-004.hana.ondemand.com| &&
    |/znodejsapi/ftpapi/getfile?ftpdir={ iv_ftp_dir }|.

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
