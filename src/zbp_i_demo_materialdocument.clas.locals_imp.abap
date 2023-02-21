CLASS lhc_ZI_Demo_MaterialDocument DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR ZI_Demo_MaterialDocument RESULT result.

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
    METHODS testaction FOR MODIFY
      IMPORTING keys FOR ACTION ZI_Demo_MaterialDocument~testaction.
    METHODS acceptTravel FOR MODIFY
      IMPORTING keys FOR ACTION ZI_Demo_MaterialDocument~acceptTravel RESULT result.

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
    DATA(lv_x) = 'X'.
  ENDMETHOD.

  METHOD testaction.
  ENDMETHOD.

  METHOD acceptTravel.
  ENDMETHOD.

  METHOD get_instance_features.

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
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
