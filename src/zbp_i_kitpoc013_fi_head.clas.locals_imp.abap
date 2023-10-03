CLASS lhc_ZI_KITPOC013_FI_Head DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ZI_KITPOC013_FI_Head RESULT result.

    METHODS ChangeBaselineDate FOR MODIFY
      IMPORTING keys FOR ACTION ZI_KITPOC013_FI_Head~ChangeBaselineDate.

ENDCLASS.

CLASS lhc_ZI_KITPOC013_FI_Head IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD ChangeBaselineDate.

    READ ENTITIES OF ZI_KITPOC013_FI_Head IN LOCAL MODE
    ENTITY ZI_KITPOC013_FI_Head
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_result).

    READ TABLE lt_result INDEX 1 INTO DATA(lw_result).

    DATA: lt_je TYPE TABLE FOR ACTION IMPORT i_journalentrytp~change,
          ls_je LIKE LINE OF lt_je.

    DATA lt_aparitem LIKE ls_je-%param-_aparitems.
    DATA ls_aparitem LIKE LINE OF lt_aparitem.

    ls_aparitem-GLAccountLineItem = lw_result-AccountingDocumentItem.
    ls_aparitem-DueCalculationBaseDate = keys[ 1 ]-%param-DueCalculationBaseDate.
    ls_aparitem-%control = VALUE #( DueCalculationBaseDate = if_abap_behv=>mk-on ).
    APPEND ls_aparitem TO lt_aparitem.

    APPEND VALUE #( CompanyCode = lw_result-CompanyCode
                    FiscalYear = lw_result-FiscalYear
                    AccountingDocument = lw_result-AccountingDocument
                    %param-_aparitems = lt_aparitem )
    TO lt_je.

    MODIFY ENTITIES OF I_JournalEntryTP
    ENTITY JournalEntry
    EXECUTE Change FROM lt_je
    FAILED DATA(ls_failed)
    REPORTED DATA(ls_reported)
    MAPPED DATA(ls_mapped).

    LOOP AT ls_reported-journalentry INTO DATA(lw_report_src).
        APPEND VALUE #( CompanyCode = lw_result-CompanyCode
                        FiscalYear = lw_result-FiscalYear
                        AccountingDocument = lw_result-AccountingDocument
                        %msg = lw_report_src-%msg ) TO reported-zi_kitpoc013_fi_head.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZI_KITPOC013_FI_HEAD DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS save_modified REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZI_KITPOC013_FI_HEAD IMPLEMENTATION.

  METHOD save_modified.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
