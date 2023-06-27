@AbapCatalog.sqlViewName: 'ZVN_CSOI'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order items - Consumption View'

@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel:{
      semanticKey: ['so_item'],
      createEnabled: true,
      deleteEnabled: true,
      updateEnabled: true
}
define view zc_salesorder_item
  as select from zi_salesorder_item
  association [1] to zc_salesorder_header as _Header on $projection.so_uuid = _Header.souuid
{
  key so_itemuuid,
      so_uuid,
      @Search.defaultSearchElement: true
      so_item,
      prod_id,
      quantity,
      unit_id,
      deliverydate,
      currency_code,
      gross_amount,
      net_amount,
      tax_amount,
      available,
      /* Associations */
      @ObjectModel.association.type: [#TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT]
      _Header,
      _Product
}
