CLASS zcl_pph_mrp_purreq_cfl_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_badi_interface .
    INTERFACES if_pph_mrp_purreq_cfl .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_PPH_MRP_PURREQ_CFL_01 IMPLEMENTATION.


  METHOD if_pph_mrp_purreq_cfl~modify_purreq.


    "purchaserequisition_changed-purchaserequisitionitemtext = 'From BAdI Enhancement Spot: ES_PPH_MRP_BADI_CFL'.

    "Activate changes by providing internal key
    purchaserequisition_changed-purchaserequisition     = purchaserequisition-purchaserequisition.
    purchaserequisition_changed-purchaserequisitionitem = purchaserequisition-purchaserequisitionitem.

    SELECT SINGLE b~salesdocumentitemtext FROM I_PurReqnAcctAssgmtAPI01 WITH PRIVILEGED ACCESS AS a
    INNER JOIN i_salesdocumentitem WITH PRIVILEGED ACCESS AS b
    ON b~salesdocument = a~SalesOrder AND b~salesdocumentitem = a~SalesOrderitem
    WHERE a~purchaserequisition = @purchaserequisition_changed-purchaserequisition AND
    a~purchaserequisitionitem = @purchaserequisition_changed-purchaserequisitionitem
    INTO @purchaserequisition_changed-purchaserequisitionitemtext.

*    SELECT SINGLE SalesDocument, SalesDocumentItem FROM I_SalesDocumentScheduleLine
*    WHERE PurchaseRequisition = @purchaserequisition_changed-purchaserequisition AND PurchaseRequisitionItem = @purchaserequisition_changed-purchaserequisitionitem
*    INTO @DATA(ls_so).
*
*    SELECT SINGLE SalesDocumentItemText FROM I_SalesDocumentItem
*    WHERE SalesDocument = @ls_so-SalesDocument AND SalesDocumentItem = @ls_so-SalesDocumentItem
*    INTO @DATA(lv_soItemText).

*    purchaserequisition_changed-purchaserequisitionitemtext = lv_soitemtext.

  ENDMETHOD.
ENDCLASS.
