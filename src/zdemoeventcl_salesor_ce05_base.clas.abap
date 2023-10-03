class ZDEMOEVENTCL_SALESOR_CE05_BASE definition
  public
  abstract
  create public .

public section.

  interfaces /IWXBE/IF_CONSUMER .
  interfaces ZDEMOEVENTIF_SALE_456A_HANDLER
      all methods abstract .
protected section.
private section.

  constants:
    GENERATED_AT TYPE STRING VALUE `20230927070704` .
  constants:
    GENERATION_VERSION TYPE I VALUE 1 .
ENDCLASS.



CLASS ZDEMOEVENTCL_SALESOR_CE05_BASE IMPLEMENTATION.


METHOD /IWXBE/IF_CONSUMER~HANDLE_EVENT.

  " This is a generated class, which might be overwritten in the future.
  " Go to ZDEMOEVENTCL_SALESORDERCREATED to add custom code.

  CASE io_event->get_cloud_event_type( ).
    WHEN 'sap.s4.beh.salesorder.v1.SalesOrder.ApprovalStsChanged.v1'.
      me->ZDEMOEVENTIF_SALE_456A_HANDLER~handle_salesorder_approva_3DF8( NEW LCL_SALESORDER_APPROVALST_D377( io_event ) ).
    WHEN 'sap.s4.beh.salesorder.v1.SalesOrder.Changed.v1'.
      me->ZDEMOEVENTIF_SALE_456A_HANDLER~handle_salesorder_changed_v1( NEW LCL_SALESORDER_CHANGED_V1( io_event ) ).
    WHEN 'sap.s4.beh.salesorder.v1.SalesOrder.Created.v1'.
      me->ZDEMOEVENTIF_SALE_456A_HANDLER~handle_salesorder_created_v1( NEW LCL_SALESORDER_CREATED_V1( io_event ) ).
    WHEN 'sap.s4.beh.salesorder.v1.SalesOrder.Deleted.v1'.
      me->ZDEMOEVENTIF_SALE_456A_HANDLER~handle_salesorder_deleted_v1( NEW LCL_SALESORDER_DELETED_V1( io_event ) ).
    WHEN 'sap.s4.beh.salesorder.v1.SalesOrder.ItemChanged.v1'.
      me->ZDEMOEVENTIF_SALE_456A_HANDLER~handle_salesorder_itemcha_6C6C( NEW LCL_SALESORDER_ITEMCHANGED_V1( io_event ) ).
    WHEN 'sap.s4.beh.salesorder.v1.SalesOrder.ItemCreated.v1'.
      me->ZDEMOEVENTIF_SALE_456A_HANDLER~handle_salesorder_itemcre_0B97( NEW LCL_SALESORDER_ITEMCREATED_V1( io_event ) ).
    WHEN 'sap.s4.beh.salesorder.v1.SalesOrder.ItemDeleted.v1'.
      me->ZDEMOEVENTIF_SALE_456A_HANDLER~handle_salesorder_itemdel_8D3B( NEW LCL_SALESORDER_ITEMDELETED_V1( io_event ) ).
    WHEN 'sap.s4.beh.salesorder.v1.SalesOrder.ItmBillgBlkStsChgd.v1'.
      me->ZDEMOEVENTIF_SALE_456A_HANDLER~handle_salesorder_itmbill_503F( NEW LCL_SALESORDER_ITMBILLGBL_FC47( io_event ) ).
    WHEN 'sap.s4.beh.salesorder.v1.SalesOrder.ItmDelivBlkStsChgd.v1'.
      me->ZDEMOEVENTIF_SALE_456A_HANDLER~handle_salesorder_itmdeli_9517( NEW LCL_SALESORDER_ITMDELIVBL_6BB6( io_event ) ).
    WHEN 'sap.s4.beh.salesorder.v1.SalesOrder.ItmDelivStsChgd.v1'.
      me->ZDEMOEVENTIF_SALE_456A_HANDLER~handle_salesorder_itmdeli_25D2( NEW LCL_SALESORDER_ITMDELIVST_BC5C( io_event ) ).
    WHEN 'sap.s4.beh.salesorder.v1.SalesOrder.ItmDlvConfStsChgd.v1'.
      me->ZDEMOEVENTIF_SALE_456A_HANDLER~handle_salesorder_itmdlvc_36FA( NEW LCL_SALESORDER_ITMDLVCONF_4DA1( io_event ) ).
    WHEN 'sap.s4.beh.salesorder.v1.SalesOrder.ItmGenIncplStsChgd.v1'.
      me->ZDEMOEVENTIF_SALE_456A_HANDLER~handle_salesorder_itmgeni_B285( NEW LCL_SALESORDER_ITMGENINCP_4404( io_event ) ).
    WHEN 'sap.s4.beh.salesorder.v1.SalesOrder.ItmPrftCtrChanged.v1'.
      me->ZDEMOEVENTIF_SALE_456A_HANDLER~handle_salesorder_itmprft_BEA9( NEW LCL_SALESORDER_ITMPRFTCTR_6C70( io_event ) ).
    WHEN 'sap.s4.beh.salesorder.v1.SalesOrder.ItmRjcnStsChgd.v1'.
      me->ZDEMOEVENTIF_SALE_456A_HANDLER~handle_salesorder_itmrjcn_ECAE( NEW LCL_SALESORDER_ITMRJCNSTS_B527( io_event ) ).
    WHEN 'sap.s4.beh.salesorder.v1.SalesOrder.ItmSDProcStsChgd.v1'.
      me->ZDEMOEVENTIF_SALE_456A_HANDLER~handle_salesorder_itmsdpr_5652( NEW LCL_SALESORDER_ITMSDPROCS_F23D( io_event ) ).
    WHEN 'sap.s4.beh.salesorder.v1.SalesOrder.ItmWBSElmntChanged.v1'.
      me->ZDEMOEVENTIF_SALE_456A_HANDLER~handle_salesorder_itmwbse_E0D0( NEW LCL_SALESORDER_ITMWBSELMN_61B4( io_event ) ).
    WHEN 'sap.s4.beh.salesorder.v1.SalesOrder.OvrlBlgBlkStsChgd.v1'.
      me->ZDEMOEVENTIF_SALE_456A_HANDLER~handle_salesorder_ovrlblg_0F8E( NEW LCL_SALESORDER_OVRLBLGBLK_9E56( io_event ) ).
    WHEN 'sap.s4.beh.salesorder.v1.SalesOrder.OvrlDelivStsChgd.v1'.
      me->ZDEMOEVENTIF_SALE_456A_HANDLER~handle_salesorder_ovrldel_FD03( NEW LCL_SALESORDER_OVRLDELIVS_5295( io_event ) ).
    WHEN 'sap.s4.beh.salesorder.v1.SalesOrder.OvrlDlvBlkStsChgd.v1'.
      me->ZDEMOEVENTIF_SALE_456A_HANDLER~handle_salesorder_ovrldlv_D1E1( NEW LCL_SALESORDER_OVRLDLVBLK_C678( io_event ) ).
    WHEN 'sap.s4.beh.salesorder.v1.SalesOrder.OvrlDlvConfStsChgd.v1'.
      me->ZDEMOEVENTIF_SALE_456A_HANDLER~handle_salesorder_ovrldlv_F42C( NEW LCL_SALESORDER_OVRLDLVCON_312E( io_event ) ).
    WHEN 'sap.s4.beh.salesorder.v1.SalesOrder.OvrlRjcnStsChgd.v1'.
      me->ZDEMOEVENTIF_SALE_456A_HANDLER~handle_salesorder_ovrlrjc_DA42( NEW LCL_SALESORDER_OVRLRJCNST_ABF8( io_event ) ).
    WHEN 'sap.s4.beh.salesorder.v1.SalesOrder.OvrlSDProcStsChgd.v1'.
      me->ZDEMOEVENTIF_SALE_456A_HANDLER~handle_salesorder_ovrlsdp_1791( NEW LCL_SALESORDER_OVRLSDPROC_3426( io_event ) ).
    WHEN 'sap.s4.beh.salesorder.v1.SalesOrder.TotCrdtChkStsChgd.v1'.
      me->ZDEMOEVENTIF_SALE_456A_HANDLER~handle_salesorder_totcrdt_2C30( NEW LCL_SALESORDER_TOTCRDTCHK_D149( io_event ) ).
    WHEN OTHERS.
      RAISE EXCEPTION TYPE /iwxbe/cx_exception
        EXPORTING
          textid = /iwxbe/cx_exception=>not_supported.
  ENDCASE.

ENDMETHOD.
ENDCLASS.
