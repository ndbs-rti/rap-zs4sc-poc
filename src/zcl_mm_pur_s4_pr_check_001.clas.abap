CLASS zcl_mm_pur_s4_pr_check_001 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_badi_interface .
    INTERFACES if_mm_pur_s4_pr_check .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_MM_PUR_S4_PR_CHECK_001 IMPLEMENTATION.


  METHOD if_mm_pur_s4_pr_check~check.

    DATA: ls_message TYPE mmpur_s_messages.

    READ TABLE purchaserequisitionitem_table INTO DATA(ls_preq_itm) INDEX 1.
    IF ls_preq_itm-orderedquantity > 10.
*      ls_message-messageid = 'DUMMY'.
*      ls_message-messagetype = 'E'.
*      ls_message-messagenumber = '001'.
*      ls_message-messagevariable1 = 'Quantity Limit is 10'.  "Place Holder
*      APPEND ls_message TO messages.
    ENDIF.

    IF  ls_preq_itm-deliverydate - (  cl_abap_context_info=>get_system_date( ) ) > 120.
*      ls_message-messageid = 'DUMMY'.
*      ls_message-messagetype = 'E'.
*      ls_message-messagenumber = '001'.
*      ls_message-messagevariable1 = 'Delivery Date Limit 120 Days'.  "Place Holder
*      APPEND ls_message TO messages.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
