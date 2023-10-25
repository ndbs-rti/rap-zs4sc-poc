CLASS zcl_kitpoc015_job_template DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES: BEGIN OF gty_file,
             filepath TYPE string,
             filename TYPE string,
             filedata TYPE string,
           END OF gty_file,
           gtty_file TYPE TABLE OF gty_file WITH DEFAULT KEY,
           BEGIN OF gty_inb_files,
             files TYPE gtty_file,
           END OF gty_inb_files.

    INTERFACES if_apj_dt_exec_object .
    INTERFACES if_apj_rt_exec_object .
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS getinboundtextfile
      IMPORTING VALUE(iv_ftp_dir) TYPE string
      RETURNING VALUE(rw_inb_files) TYPE gty_inb_files.
ENDCLASS.



CLASS ZCL_KITPOC015_JOB_TEMPLATE IMPLEMENTATION.


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


  METHOD if_apj_dt_exec_object~get_parameters.

    " Return the supported selection parameters here
*    et_parameter_def = VALUE #(
*      ( selname = 'S_VBELN' kind = if_apj_dt_exec_object=>select_option datatype = 'C' length = 10
*      param_text = 'Sales Orderrr' changeable_ind = abap_true )
*      ( selname = 'S_ERDAT' kind = if_apj_dt_exec_object=>select_option datatype = 'D'
*      param_text = 'Created Date' changeable_ind = abap_true )
*    ).
*
*    " Return the default parameters values here
*    et_parameter_val = VALUE #(
*      ( selname = 'S_ERDAT' kind = if_apj_dt_exec_object=>select_option sign = 'I' option = 'EQ'
*      low = cl_abap_context_info=>get_system_date( ) )
*      ).

    et_parameter_def = VALUE #(
      ( selname = 'P_FTPDIR' kind = if_apj_dt_exec_object=>parameter datatype = 'C' length = 100
      param_text = 'FTP Directory' changeable_ind = abap_true ) ).

    et_parameter_val = VALUE #(
      ( selname = 'P_FTPDIR' kind = if_apj_dt_exec_object=>parameter sign = 'I' option = 'EQ'
      low = 'testinb' ) ).

  ENDMETHOD.


  METHOD if_apj_rt_exec_object~execute.

    LOOP AT it_parameters INTO DATA(lw_parameter).
      CASE lw_parameter-selname.
        WHEN 'P_FTPDIR'.
            DATA(lv_ftpdir) = lw_parameter-low.
      ENDCASE.
    ENDLOOP.

    DATA(lw_inb_files) = getinboundtextfile( iv_ftp_dir = conv #( lv_ftpdir ) ).

    DATA(lo_log) = cl_bali_log=>create_with_header( cl_bali_header_setter=>create( object =
                     'ZJL_KITPOC015' subobject = 'ZSUBOBJECT1' ) ).

    LOOP AT lw_inb_files-files INTO DATA(lw_file).

      DATA(lv_decoded_data) = cl_web_http_utility=>decode_base64( encoded = lw_file-filedata ).

      DATA(lo_application_log_free_text) = cl_bali_free_text_setter=>create(
                                            severity = if_bali_constants=>c_severity_status
                                            text = CONV #(
                                            |{ lw_file-filename } has been downloaded.| ) ).
      lo_application_log_free_text->set_detail_level( detail_level = '1' ).
      lo_log->add_item( item = lo_application_log_free_text ).

      DATA(lo_application_log_detail_2) = cl_bali_free_text_setter=>create(
                                            severity = if_bali_constants=>c_severity_status
                                            text = CONV #( lv_decoded_data ) ).
      lo_application_log_detail_2->set_detail_level( detail_level = '2' ).
      lo_log->add_item( item = lo_application_log_detail_2 ).

    ENDLOOP.
    cl_bali_log_db=>get_instance( )->save_log( log = lo_log assign_to_current_appl_job = abap_true ).

  ENDMETHOD.
ENDCLASS.
