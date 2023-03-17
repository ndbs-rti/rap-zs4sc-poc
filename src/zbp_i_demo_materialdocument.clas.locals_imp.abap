CLASS lhc_ZI_Demo_MaterialDocument DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ZI_Demo_MaterialDocument RESULT result.

    METHODS read FOR READ
      IMPORTING keys FOR READ ZI_Demo_MaterialDocument RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK ZI_Demo_MaterialDocument.

    METHODS rba_Materialdocumentitem FOR READ
      IMPORTING keys_rba FOR READ ZI_Demo_MaterialDocument\_Materialdocumentitem FULL result_requested RESULT result LINK association_links.

    METHODS cba_Materialdocumentitem FOR MODIFY
      IMPORTING entities_cba FOR CREATE ZI_Demo_MaterialDocument\_Materialdocumentitem.

    METHODS postgi FOR MODIFY
      IMPORTING keys FOR ACTION ZI_Demo_MaterialDocument~postgi RESULT result.

ENDCLASS.

CLASS lhc_ZI_Demo_MaterialDocument IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD read.
    DATA(lv_x) = 'X'.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD rba_Materialdocumentitem.
  ENDMETHOD.

  METHOD cba_Materialdocumentitem.
  ENDMETHOD.

  METHOD postgi.

    DATA(lw_key) = keys[ 1 ].

*    zcl_demo_postgi=>post_gi(
*        EXPORTING
*            im_Material = lw_key-%param-Material
*            im_Plant = lw_key-%param-Plant
*            im_StorageLocation = lw_key-%param-StorageLocation
*            im_Batch = lw_key-%param-Batch
*            im_InventorySpecialStockType = lw_key-%param-InventorySpecialStockType
*            im_CostCenter = lw_key-%param-CostCenter
*            im_GLAccount = lw_key-%param-GLAccount
*            im_EntryUnit = lw_key-%param-EntryUnit
*            im_QuantityInEntryUnit = lw_key-%param-QuantityInEntryUnit
*        IMPORTING
*            ex_materialdocument = DATA(lv_materialdocument)
*            ex_materialdocumentyear = DATA(lv_materialdocumentyear) ).
*
*    APPEND VALUE #( %msg = new_message( id = 'ZDEMO_MSGCLASS'
*                                        number = 002
*                                        v1 = lv_materialdocument
*                                        v2 = lv_materialdocumentyear
*                                        severity = if_abap_behv_message=>severity-success ) )
*                                        TO reported-zi_demo_materialdocument.

    TRY.
        MODIFY ENTITIES OF i_materialdocumenttp

          ENTITY MaterialDocument
          CREATE FROM VALUE #( ( %cid = 'CID_001'
          goodsmovementcode = '03'
          postingdate = cl_abap_context_info=>get_system_date( )
          documentdate = cl_abap_context_info=>get_system_date( )
          %control-goodsmovementcode = cl_abap_behv=>flag_changed
          %control-postingdate = cl_abap_behv=>flag_changed
          %control-documentdate = cl_abap_behv=>flag_changed
          ) )
          ENTITY MaterialDocument
          CREATE BY \_MaterialDocumentItem
          FROM VALUE #( (
          %cid_ref = 'CID_001'
          %target = VALUE #( ( %cid = 'CID_ITM_001'
          plant = lw_key-%param-Plant
          material = lw_key-%param-Material
          GoodsMovementType = '201'
          storagelocation = lw_key-%param-StorageLocation
          QuantityInEntryUnit = lw_key-%param-QuantityInEntryUnit
          entryunit = lw_key-%param-EntryUnit
          Batch = lw_key-%param-Batch
          InventorySpecialStockType = lw_key-%param-InventorySpecialStockType
          CostCenter = |{ lw_key-%param-CostCenter ALPHA = IN }|
          GLAccount = |{ lw_key-%param-GLAccount ALPHA = IN }|
          %control-plant = cl_abap_behv=>flag_changed
          %control-material = cl_abap_behv=>flag_changed
          %control-GoodsMovementType = cl_abap_behv=>flag_changed
          %control-storagelocation = cl_abap_behv=>flag_changed
          %control-QuantityInEntryUnit = cl_abap_behv=>flag_changed
          %control-entryunit = cl_abap_behv=>flag_changed
          %control-Batch = cl_abap_behv=>flag_changed
          %control-InventorySpecialStockType = cl_abap_behv=>flag_changed
          %control-CostCenter = cl_abap_behv=>flag_changed
          %control-GLAccount = cl_abap_behv=>flag_changed
          ) )
          ) )
          MAPPED DATA(ls_create_mapped)
          FAILED DATA(ls_create_failed)
          REPORTED DATA(ls_create_reported).

          zbp_i_demo_materialdocument=>cv_matdoc_mapped = ls_create_mapped.

      CATCH cx_root INTO DATA(lo_exception).
    ENDTRY.

  ENDMETHOD.

ENDCLASS.

CLASS lhc_ZI_Demo_MaterialDocumentIt DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS read FOR READ
      IMPORTING keys FOR READ ZI_Demo_MaterialDocumentItem RESULT result.

    METHODS rba_Materialdocument FOR READ
      IMPORTING keys_rba FOR READ ZI_Demo_MaterialDocumentItem\_Materialdocument FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_ZI_Demo_MaterialDocumentIt IMPLEMENTATION.

  METHOD read.
  ENDMETHOD.

  METHOD rba_Materialdocument.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZI_DEMO_MATERIALDOCUMENT DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZI_DEMO_MATERIALDOCUMENT IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
*      LOOP AT zbp_i_demo_materialdocument=>cv_matdoc_mapped-materialdocument
*      INTO DATA(lw_matdoc_mapped).
*        CONVERT KEY OF i_materialdocumenttp FROM lw_matdoc_mapped-%pid TO DATA(lw_matdoc_key).
*        APPEND VALUE #( MaterialDocument = '0000000000'
*                        MaterialDocumentYear = '0000'
*                        %msg = new_message( id       = 'ZDEMO_MSGCLASS'
*                                            number   = 002
*                                            v1 = lw_matdoc_key-MaterialDocument
*                                            v2 = lw_matdoc_key-MaterialDocumentYear
*                                            severity = if_abap_behv_message=>severity-success ) )
*                                            TO reported-zi_demo_materialdocument.
*      ENDLOOP.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
