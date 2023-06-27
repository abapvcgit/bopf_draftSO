CLASS zcl_i_d_set_salesorderid DEFINITION
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



CLASS zcl_i_d_set_salesorderid IMPLEMENTATION.

  METHOD /bobf/if_frw_determination~execute.


    DATA lv_timestamp TYPE timestampl.
    GET TIME STAMP FIELD lv_timestamp.
    "Find the highest used sales order number in both active and draft data

    WITH +both AS ( SELECT soid FROM zso_heder   "active data
      UNION ALL
      SELECT soid FROM zso_headerd )          "draft data
    SELECT SINGLE
      FROM +both
      FIELDS MAX( soid ) AS salesorder
      INTO @DATA(lv_max_salesorder).

    "If there are no entries, set a start value
    IF lv_max_salesorder IS INITIAL.
      lv_max_salesorder = '0700000000'.
    ENDIF.

    "Read data with the given keys
    DATA lt_data TYPE ztisalesorder_header.

    io_read->retrieve(
      EXPORTING
        iv_node                 = is_ctx-node_key   " uuid of node name
        it_key                  = it_key            " keys given to the determination
      IMPORTING
        eo_message              = eo_message        " pass message object
        et_data                 = lt_data           " itab with node data
        et_failed_key           = et_failed_key     " pass failures
    ).

    "Assign numbers to each newly created line and tell BOPF about the modification
    LOOP AT lt_data REFERENCE INTO DATA(lr_data).
      IF lr_data->soid IS INITIAL.
        ADD 1 TO lv_max_salesorder.
        lr_data->soid = lv_max_salesorder.
        lr_data->status = 'N'.
        lr_data->crea_uname = sy-uname.
        lr_data->lchg_date_time = lv_timestamp.
        lr_data->crea_date_time = lv_timestamp.
        lr_data->lchg_uname = sy-uname.
        " Fill leading zeros for ALPHANUM field on database
        lr_data->soid = |{ lr_data->soid ALPHA = IN }|.

        io_modify->update(
          EXPORTING
          iv_node           = is_ctx-node_key    " uuid of node
          iv_key            = lr_data->key       " key of line
          is_data           = lr_data            " ref to modified data
          it_changed_fields = VALUE #( ( zif_i_salesorder_header_c=>sc_node_attribute-zi_salesorder_header-soid )
                                       ( zif_i_salesorder_header_c=>sc_node_attribute-zi_salesorder_header-status )
                                       ( zif_i_salesorder_header_c=>sc_node_attribute-zi_salesorder_header-crea_uname )
                                       ( zif_i_salesorder_header_c=>sc_node_attribute-zi_salesorder_header-crea_date_time )
                                       ( zif_i_salesorder_header_c=>sc_node_attribute-zi_salesorder_header-lchg_uname )
                                       ( zif_i_salesorder_header_c=>sc_node_attribute-zi_salesorder_header-lchg_date_time ) )
        ).
      ENDIF.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
