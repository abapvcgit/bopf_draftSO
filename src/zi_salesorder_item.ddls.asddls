@AbapCatalog.sqlViewName: 'ZVN_ISOI'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Items - subnode BO view'

@Search.searchable:true
@ObjectModel: {
  semanticKey:  [ 'so_item' ],
  writeActivePersistence: 'zso_item',
  createEnabled: true,
  deleteEnabled: true,
  updateEnabled: true,
  writeDraftPersistence: 'zso_itemd'      -- Draft persistence
}
/*+[hideWarning] { "IDS" : [ "KEY_CHECK" ]  } */
define view zi_salesorder_item
  as select from zso_item as Items
  association [1] to zi_salesorder_header as _Header on $projection.so_uuid = _Header.souuid
  association [1] to SEPM_I_Product_E as _Product on $projection.prod_id = _Product.Product
{

  key so_itemuuid,
      so_uuid,
      @Search.defaultSearchElement: true
      so_item,
      @Consumption.valueHelpDefinition: [{ association: '_Product' }]
      prod_id,
      @Semantics.quantity.unitOfMeasure: 'unit_id'
      quantity,
      unit_id,
      deliverydate,
      currency_code,
      @Semantics.amount.currencyCode: 'currency_code'
      gross_amount,
      @Semantics.amount.currencyCode: 'currency_code'
      net_amount,
      @Semantics.amount.currencyCode: 'currency_code'
      tax_amount,
      available,
      /*  Exposed associations  */
      @ObjectModel.association.type: [#TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT]
      _Header,
      _Product
}
