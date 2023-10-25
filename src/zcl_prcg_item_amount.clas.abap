CLASS zcl_prcg_item_amount DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_badi_interface .
    INTERFACES if_prcg_doc_itm_cndn_amount .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_prcg_item_amount IMPLEMENTATION.


  METHOD if_prcg_doc_itm_cndn_amount~change_condition_amount.

    MOVE-CORRESPONDING item_amounts TO item_result_amounts.
    MOVE-CORRESPONDING item_attributes TO item_result_attributes.
    MOVE-CORRESPONDING item_quantities TO item_result_quantities.
    MOVE-CORRESPONDING prcg_element_attributes TO prcg_element_result_amounts.

    prcg_element_result_amounts-conditionamount = '8888.88'.

  ENDMETHOD.
ENDCLASS.
