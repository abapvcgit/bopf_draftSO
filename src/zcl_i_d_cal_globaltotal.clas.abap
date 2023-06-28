CLASS zcl_i_d_cal_globaltotal DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_d_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS /bobf/if_frw_determination~execute
        REDEFINITION .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_i_d_cal_globaltotal IMPLEMENTATION.


  METHOD /bobf/if_frw_determination~execute.
    "Read data with the given keys
    DATA :lt_data TYPE ztisalesorder_header,
          lt_item TYPE ztisalesorder_item.

    io_read->retrieve(
     EXPORTING
       iv_node                 = is_ctx-node_key   " uuid of node name
       it_key                  = it_key            " keys given to the determination
     IMPORTING
       eo_message              = eo_message        " pass message object
       et_data                 = lt_data           " itab with node data
       et_failed_key           = et_failed_key     " pass failures
   ).

    io_read->retrieve_by_association(
      EXPORTING
        iv_node                 = is_ctx-node_key  " Node Name
        it_key                  = it_key           " Key Table
        iv_association          = zif_i_salesorder_header_c=>sc_association-zi_salesorder_header-_items" Name of Association
        iv_fill_data            = abap_true        " Data Element for Domain BOOLE: TRUE (="X") and FALSE (=" ")
       IMPORTING
        eo_message              = eo_message        " pass message object
        et_data                 = lt_item           " itab with node data
        et_failed_key           = et_failed_key     " pass failures
      ).
    LOOP AT lt_data REFERENCE INTO DATA(lr_data).
      CLEAR : lr_data->net_amount , lr_data->gross_amount.
      LOOP AT lt_item REFERENCE INTO DATA(lr_item) WHERE parent_key = lr_data->key .
        lr_data->net_amount    = lr_data->net_amount + lr_item->net_amount.
        lr_data->gross_amount  = lr_data->gross_amount + lr_item->gross_amount.
        lr_data->currency_code = lr_item->currency_code.
      ENDLOOP.

      io_modify->update(
          EXPORTING
          iv_node           = is_ctx-node_key    " uuid of node
          iv_key            = lr_data->key       " key of line
          is_data           = lr_data            " ref to modified data
          it_changed_fields = VALUE #( ( zif_i_salesorder_header_c=>sc_node_attribute-zi_salesorder_header-net_amount )
                                       ( zif_i_salesorder_header_c=>sc_node_attribute-zi_salesorder_header-gross_amount )
                                       ( zif_i_salesorder_header_c=>sc_node_attribute-zi_salesorder_header-currency_code ) )
        ).

    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
