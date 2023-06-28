CLASS zcl_i_d_cal_amount DEFINITION
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



CLASS zcl_i_d_cal_amount IMPLEMENTATION.


  METHOD /bobf/if_frw_determination~execute.

    " Read data with the given keys (typed with combined type table)
    DATA lt_item TYPE  ztisalesorder_item.

    io_read->retrieve(
      EXPORTING
      iv_node                 =  is_ctx-node_key
      it_key                  =  it_key
      IMPORTING
      eo_message              =  eo_message
      et_data                 =  lt_item
      et_failed_key           =  et_failed_key
    ).

    " Read price-relevant product data from EPM product table SNWD_PD
    SELECT FROM snwd_pd
      FIELDS
        product_id AS product,
        price,
        currency_code,
        measure_unit
      FOR ALL ENTRIES IN @lt_item
      WHERE product_id = @lt_item-prod_id
      INTO TABLE @DATA(lt_prices).

    SORT lt_prices BY product.
    LOOP AT lt_item REFERENCE INTO DATA(lr_item).
      IF lr_item->prod_id IS NOT INITIAL AND lr_item->quantity > 0.
        READ TABLE lt_prices WITH KEY product = lr_item->prod_id ASSIGNING FIELD-SYMBOL(<ls_price>) BINARY SEARCH.
        IF sy-subrc = 0.
          DATA(lv_new_amount) = lr_item->quantity * <ls_price>-price.
          IF lv_new_amount <> lr_item->gross_amount.
            lr_item->gross_amount = lv_new_amount.
            lr_item->currency_code = <ls_price>-currency_code.
            lr_item->net_amount = <ls_price>-price.
            lr_item->unit_id = <ls_price>-measure_unit.
            io_modify->update(
              EXPORTING
                iv_node           =  is_ctx-node_key
                iv_key            =  lr_item->key
                is_data           =  lr_item
                it_changed_fields =  VALUE #( ( zif_i_salesorder_header_c=>sc_node_attribute-zi_salesorder_item-gross_amount )
                                              ( zif_i_salesorder_header_c=>sc_node_attribute-zi_salesorder_item-currency_code )
                                              ( zif_i_salesorder_header_c=>sc_node_attribute-zi_salesorder_item-net_amount )
                                              ( zif_i_salesorder_header_c=>sc_node_attribute-zi_salesorder_item-unit_id )
                                          ) ).
          ENDIF.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
