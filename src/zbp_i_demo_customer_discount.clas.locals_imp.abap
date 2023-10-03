CLASS lhc_CustomerDiscount DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR CustomerDiscount RESULT result.
    METHODS at_create FOR DETERMINE ON MODIFY
      IMPORTING keys FOR customerdiscount~at_create.
    METHODS testaction FOR MODIFY
      IMPORTING keys
      FOR ACTION customerdiscount~testaction
      RESULT result.

ENDCLASS.

CLASS lhc_CustomerDiscount IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD at_create.
  ENDMETHOD.

  METHOD testaction.

    DATA(key) = keys[ 1 ].

    APPEND INITIAL LINE TO result ASSIGNING FIELD-SYMBOL(<lfs_result>).
    "<lfs_result>-%key = key-%key.
    <lfs_result>-%param = VALUE #( dnumb = '99999'
                                   _item = key-%param-_item[] ).

  ENDMETHOD.

ENDCLASS.
