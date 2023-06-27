@AbapCatalog.sqlViewName: 'ZVN_ISOH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Header  - BO view'

@Search.searchable: true
@ObjectModel: {
  -- Annotations for transactional processing
  semanticKey: 'soid',
  compositionRoot: true,
  transactionalProcessingEnabled: true,
  createEnabled: true,
  deleteEnabled: true,
  updateEnabled: true,
  writeActivePersistence: 'zso_heder',
  -- Additional annotations for draft enablement
  draftEnabled: true,
  writeDraftPersistence: 'zso_headerd',

  -- Additional ETag annotation (time stamp)
  entityChangeStateId: 'lchg_date_time'
}
/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK", "KEY_CHECK" ]  } */
define view zi_salesorder_header
  as select from zso_heder as Header
  association [0..*] to zi_salesorder_item     as _Items      on $projection.souuid = _Items.so_uuid
  association [1]    to SEPM_I_BusinessPartner as _Partner    on $projection.business_partner = _Partner.BusinessPartner
  association [1]    to zvh_so_status          as _Status     on $projection.status = _Status.StatusID
  association [1]    to zvh_so_billstatus      as _BillStatus on $projection.billing_status = _BillStatus.BillStatusID
  association [1]    to zvh_so_delstatus       as _DelStatus  on $projection.delivery_status = _DelStatus.DeliveryStatusID
  association [1]    to SEPM_I_Currency        as _Currency   on $projection.currency_code = _Currency.Currency
{
       @ObjectModel.readOnly: true
  key  souuid,
       @ObjectModel.readOnly: true
       @Search.defaultSearchElement: true
       soid,
       @Consumption.valueHelpDefinition: [{ association: '_Partner' }]
       @ObjectModel.text.element: ['PartnerName']
       @ObjectModel.mandatory: true
       business_partner,
       _Partner.CompanyName      as PartnerName,
       @Consumption.valueHelpDefinition: [{ association: '_Currency' }]
       currency_code,
       @Semantics.amount.currencyCode: 'currency_code'
       @ObjectModel.readOnly: true
       gross_amount,
       @Semantics.amount.currencyCode: 'currency_code'
       @ObjectModel.readOnly: true
       net_amount,
       @Semantics.amount.currencyCode: 'currency_code'
       @ObjectModel.readOnly: true
       tax_amount,
       @Consumption.valueHelpDefinition: [{ association: '_Status' }]
       @ObjectModel.text.element: ['StatusTxt']
       @ObjectModel.readOnly: true
       status,
       _Status.Status            as StatusTxt,
       @ObjectModel.text.element: ['BillStatus']
       @Consumption.valueHelpDefinition: [{ association: '_BillStatus' }]
       @ObjectModel.readOnly: true
       billing_status,
       _BillStatus.BillStatus    as BillStatus,
       @Consumption.valueHelpDefinition: [{ association: '_DelStatus' }]
       @ObjectModel.text.element: ['DelivetyStatus']
       @ObjectModel.readOnly: true
       delivery_status,
       _DelStatus.DeliveryStatus as DelivetyStatus,
       crea_date_time,
       crea_uname,
       @ObjectModel.readOnly: true
       lchg_date_time,
       @ObjectModel.readOnly: true
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
