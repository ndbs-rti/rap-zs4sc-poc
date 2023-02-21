CLASS lhc_ZI_Demo_Mass_PI_Count DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR ZI_Demo_Mass_PI_Count RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ZI_Demo_Mass_PI_Count RESULT result.

    METHODS read FOR READ
      IMPORTING keys FOR READ ZI_Demo_Mass_PI_Count RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK ZI_Demo_Mass_PI_Count.

    METHODS Count FOR MODIFY
      IMPORTING
        keys FOR ACTION ZI_Demo_Mass_PI_Count~Count RESULT result.

ENDCLASS.

CLASS lhc_ZI_Demo_Mass_PI_Count IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD Count.

    DATA(key) = keys[ 1 ].
    SELECT SINGLE * FROM ZI_Demo_Mass_PI_Count
    WHERE FiscalYear = @key-FiscalYear and
          PhysicalInventoryDocument = @key-PhysicalInventoryDocument and
          PhysicalInventoryDocumentItem = @key-PhysicalInventoryDocumentItem
    INTO @DATA(lw_data).

    DATA(lv_actvt) = '02'.
    AUTHORITY-CHECK OBJECT 'ZDEMOAUOBJ'
    ID 'ACTVT' FIELD lv_actvt.
    if sy-subrc <> 0.
        APPEND VALUE #( FiscalYear = lw_data-FiscalYear
                        PhysicalInventoryDocument = lw_data-PhysicalInventoryDocument
                        PhysicalInventoryDocumentItem = lw_data-PhysicalInventoryDocumentItem
                        %msg = new_message( id       = 'ZDEMO_MSGCLASS'
                                            number   = 001
                                            severity = if_abap_behv_message=>severity-error ) )
                                            TO reported-zi_demo_mass_pi_count.
        RETURN.
    ENDIF.

    TRY.

        MODIFY ENTITIES OF I_PhysicalInventoryDocumentTP
        ENTITY PhysicalInventoryDocument
        UPDATE FIELDS ( PhysicalInventoryLastCountDate )
        WITH VALUE #(
        ( FiscalYear = lw_data-FiscalYear
        PhysicalInventoryDocument = lw_data-PhysicalInventoryDocument ) )
        ENTITY PhysicalInventoryDocumentItem
        UPDATE FIELDS ( QuantityInUnitOfEntry PhysicalInventoryItemIsZero UnitOfEntry )
        WITH VALUE #(
        ( FiscalYear = lw_data-FiscalYear
        PhysicalInventoryDocument = lw_data-PhysicalInventoryDocument
        PhysicalInventoryDocumentItem = lw_data-PhysicalInventoryDocumentItem
        QuantityInUnitOfEntry = key-%param-QtyCount
        UnitOfEntry = COND #( WHEN key-%param-Unit IS INITIAL THEN lw_data-UnitOfEntry ELSE key-%param-Unit ) ) )
        FAILED DATA(lw_failed)
        REPORTED DATA(lw_reported).

        LOOP AT lw_reported-physicalinventorydocumentitem INTO DATA(lw_report_src).
            APPEND VALUE #( FiscalYear = lw_data-FiscalYear
                            PhysicalInventoryDocument = lw_data-PhysicalInventoryDocument
                            PhysicalInventoryDocumentItem = lw_data-PhysicalInventoryDocumentItem
                            %msg = lw_report_src-%msg ) TO reported-zi_demo_mass_pi_count.
        ENDLOOP.

      CATCH cx_root INTO DATA(lo_exception).
    ENDTRY.

  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZI_DEMO_MASS_PI_COUNT DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZI_DEMO_MASS_PI_COUNT IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
