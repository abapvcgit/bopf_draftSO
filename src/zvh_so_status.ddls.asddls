@AbapCatalog.sqlViewName: 'ZHVN_SOSTATUS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales order Value Help'

@Search.searchable: true
@ObjectModel:{

  resultSet.sizeCategory: #XS // smal size for dropdow helpvalue
}
define view zvh_so_status
  as select from    dd07l as FixedValue
    left outer join dd07t as ValueText on  FixedValue.domname    = ValueText.domname
                                       and FixedValue.domvalue_l = ValueText.domvalue_l
                                       and FixedValue.as4local   = ValueText.as4local
{

       @Search.defaultSearchElement: true
       @Search.fuzzinessThreshold: 0.8
       @ObjectModel.text.element: ['Status']
  key  FixedValue.domvalue_l as StatusID,
       @Semantics.text: true -- identifies the text field
       ValueText.ddtext      as Status
}

where
      FixedValue.domname   = 'D_SO_LC'
  and FixedValue.as4local  = 'A' --Active
  and ValueText.ddlanguage = $session.system_language
