CLASS lhc_demomassphydoc DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS CreatePhyDoc FOR MODIFY
      IMPORTING keys FOR ACTION DemoMassPhyDoc~CreatePhyDoc RESULT result.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR DemoMassPhyDoc RESULT result.

ENDCLASS.

CLASS lhc_demomassphydoc IMPLEMENTATION.

  METHOD CreatePhyDoc.

*    DATA(key) = keys[ 1 ].
*    SELECT SINGLE * FROM ZC_Demo_Mass_Phy_Doc
*    WHERE uuid = @key-uuid
*    INTO @DATA(lw_data).

    READ ENTITIES OF ZI_Demo_Mass_Phy_Doc IN LOCAL MODE
    ENTITY DemoMassPhyDoc
    ALL FIELDS
    WITH CORRESPONDING #( keys )
    RESULT DATA(lt_result_self).

    TRY.

        DATA(lw_result_self) = lt_result_self[ 1 ].

        MODIFY ENTITIES OF I_PhysicalInventoryDocumentTP
        ENTITY PhysicalInventoryDocument
        CREATE
        FROM VALUE #( (
            %cid = 'CID_DOCUMENT'
            DocumentDate = sy-datum
            PhysInventoryPlannedCountDate = sy-datum
            Plant = lw_result_self-Plant
            StorageLocation = lw_result_self-StorageLocation
            %control-DocumentDate = if_abap_behv=>mk-on
            %control-PhysInventoryPlannedCountDate = if_abap_behv=>mk-on
            %control-Plant = if_abap_behv=>mk-on
            %control-StorageLocation = if_abap_behv=>mk-on ) )

        CREATE BY \_PhysicalInventoryDocumentItem
        FROM VALUE #( (
            %cid_ref = 'CID_DOCUMENT'
            %target = VALUE #(
            (
                %cid = 'CID_ITEM_1'
                Material = lw_result_self-MaterialNumber
                PhysicalInventoryStockType = '1'
                QuantityInUnitOfEntry = lw_result_self-Quantity
                UnitOfEntry = lw_result_self-Unit
                Batch = lw_result_self-Batch
                %control-Material = if_abap_behv=>mk-on
                %control-PhysicalInventoryStockType = if_abap_behv=>mk-on
                %control-QuantityInUnitOfEntry = if_abap_behv=>mk-on
                %control-UnitOfEntry = if_abap_behv=>mk-on
                %control-Batch = if_abap_behv=>mk-on )
            ) ) )
        FAILED DATA(lw_failed)
        MAPPED DATA(lw_mapped)
        REPORTED DATA(lw_reported).

        LOOP AT lw_reported-physicalinventorydocument INTO DATA(lw_report_src).
            APPEND VALUE #( uuid = lw_result_self-uuid
                            %msg = lw_report_src-%msg ) TO reported-demomassphydoc.
        ENDLOOP.

      CATCH cx_root INTO DATA(lo_exception).
    ENDTRY.

  ENDMETHOD.

  METHOD get_instance_features.
  ENDMETHOD.

ENDCLASS.

*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
