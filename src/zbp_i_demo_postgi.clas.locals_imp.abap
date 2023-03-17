CLASS lsc_ZI_Demo_PostGI DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.
    METHODS save_modified REDEFINITION.
ENDCLASS.

CLASS lsc_ZI_Demo_PostGI IMPLEMENTATION.
  METHOD save_modified.

    TRY.

        CONVERT KEY OF i_materialdocumenttp FROM
        zbp_i_demo_postgi=>cv_matdoc_mapped-materialdocument[ 1 ]-%pid
        TO DATA(lw_matdoc_key).

        UPDATE zdemopostgi_ta01 SET mblnr = @lw_matdoc_key-MaterialDocument,
                                    mjahr = @lw_matdoc_key-MaterialDocumentYear
                                WHERE uuid = @zbp_i_demo_postgi=>cv_postgi_uuid.

*        MODIFY ENTITIES OF ZI_Demo_PostGI IN LOCAL MODE
*        ENTITY ZI_Demo_PostGI
*        UPDATE
*        SET FIELDS WITH
*        VALUE #( ( uuid = zbp_i_demo_postgi=>cv_postgi_uuid
*                   mblnr = lw_matdoc_key-MaterialDocument
*                   mjahr = lw_matdoc_key-MaterialDocumentYear ) )
*        FAILED DATA(lw_failed)
*        REPORTED DATA(lw_reported).

    CATCH cx_root.

    ENDTRY.

  ENDMETHOD.
ENDCLASS.

CLASS lhc_ZI_Demo_PostGI DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR ZI_Demo_PostGI RESULT result.
    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ZI_Demo_PostGI RESULT result.
    METHODS postgi FOR MODIFY
      IMPORTING keys FOR ACTION zi_demo_postgi~postgi RESULT result.

ENDCLASS.

CLASS lhc_ZI_Demo_PostGI IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD postgi.


    TRY.

        DATA(lw_key) = keys[ 1 ].

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

          zbp_i_demo_postgi=>cv_matdoc_mapped = ls_create_mapped.
          zbp_i_demo_postgi=>cv_postgi_uuid = lw_key-uuid.

      CATCH cx_root INTO DATA(lo_exception).
    ENDTRY.

  ENDMETHOD.

ENDCLASS.
