@AbapCatalog.sqlViewName: 'ZVN_CSOH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order - Consumption View'

@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel:{
      compositionRoot: true,
      transactionalProcessingDelegated: true,
      createEnabled: true,
      deleteEnabled: true,
      updateEnabled: true,
      semanticKey: ['soid'],
      draftEnabled: true
}
@OData.publish: true
define view zc_salesorder_header
  as select from zi_salesorder_header
  association [0..*] to zc_salesorder_item as _Items on $projection.souuid = _Items.so_uuid
{
  key souuid,
      @Search.defaultSearchElement: true
      soid,
      business_partner,
      PartnerName,
      currency_code,
      gross_amount,
      net_amount,
      tax_amount,
      status,
      StatusTxt,
      billing_status,
      BillStatus,
      delivery_status,
      DelivetyStatus,
      crea_date_time,
      crea_uname,
      lchg_date_time,
      lchg_uname,
      /* Associations */
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _Items,
      _Partner,
      _Status,
      _BillStatus,
      _DelStatus,
      _Currency
}
