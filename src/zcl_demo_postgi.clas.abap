CLASS zcl_demo_postgi DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS post_gi
      IMPORTING
        VALUE(im_Material)                  TYPE matnr
        VALUE(im_Plant)                     TYPE werks_d
        VALUE(im_StorageLocation)           TYPE char4
        VALUE(im_Batch)                     TYPE charg_d
        VALUE(im_InventorySpecialStockType) TYPE c DEFAULT ''
        VALUE(im_CostCenter)                TYPE kostl
        VALUE(im_GLAccount)                 TYPE char10
        VALUE(im_EntryUnit)                 TYPE meins
        VALUE(im_QuantityInEntryUnit)       TYPE menge_d
      EXPORTING
        VALUE(ex_MaterialDocument)          TYPE mblnr
        VALUE(ex_MaterialDocumentYear)      TYPE mjahr.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_DEMO_POSTGI IMPLEMENTATION.


  METHOD post_gi.

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
          plant = im_Plant
          material = im_Material
          GoodsMovementType = '201'
          storagelocation = im_StorageLocation
          QuantityInEntryUnit = im_QuantityInEntryUnit
          entryunit = im_EntryUnit
          Batch = im_Batch
          InventorySpecialStockType = im_InventorySpecialStockType
          CostCenter = |{ im_CostCenter ALPHA = IN }|
          GLAccount = |{ im_GLAccount ALPHA = IN }|
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
          MAPPED DATA(lw_create_mapped)
          FAILED DATA(lw_create_failed)
          REPORTED DATA(lw_create_reported).

*        COMMIT ENTITIES BEGIN
*           RESPONSE OF i_materialdocumenttp
*            FAILED DATA(lw_commit_failed)
*            REPORTED DATA(lw_commit_reported).

        LOOP AT lw_create_mapped-materialdocument INTO DATA(lw_materialdocument).
          CONVERT KEY OF i_materialdocumentTp
          FROM lw_materialdocument-%pid
          TO DATA(lw_key).
        ENDLOOP.

*        COMMIT ENTITIES END.

        ex_MaterialDocument = lw_key-MaterialDocument.
        ex_materialdocumentyear = lw_key-MaterialDocumentYear.

      CATCH cx_root INTO DATA(lo_exception).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
