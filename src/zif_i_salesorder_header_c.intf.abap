interface ZIF_I_SALESORDER_HEADER_C
  public .


  interfaces /BOBF/IF_LIB_CONSTANTS .

  constants:
    BEGIN OF SC_ACTION,
      BEGIN OF ZI_SALESORDER_HEADER,
 ACTIVATION                     TYPE /BOBF/ACT_KEY VALUE '000C299E71CA1EEE85A5B97726C5226A',
 CREATE_ZI_SALESORDER_HEADER    TYPE /BOBF/ACT_KEY VALUE '000C299E71CA1EEE85A5B97726C1E26A',
 DELETE_ZI_SALESORDER_HEADER    TYPE /BOBF/ACT_KEY VALUE '000C299E71CA1EEE85A5B97726C2626A',
 EDIT                           TYPE /BOBF/ACT_KEY VALUE '000C299E71CA1EEE85A5B97726C5026A',
 LOCK_ZI_SALESORDER_HEADER      TYPE /BOBF/ACT_KEY VALUE '000C299E71CA1EEE85A5B97726C1226A',
 PREPARATION                    TYPE /BOBF/ACT_KEY VALUE '000C299E71CA1EEE85A5B97726C5626A',
 SAVE_ZI_SALESORDER_HEADER      TYPE /BOBF/ACT_KEY VALUE '000C299E71CA1EEE85A5B97726C2E26A',
 SET_TO_DEL                     TYPE /BOBF/ACT_KEY VALUE '000C299E71CA1EEE85BFD3EB6826C528',
 SET_TO_PAID                    TYPE /BOBF/ACT_KEY VALUE '000C299E71CA1EEE85BFC519BA5CE520',
 UNLOCK_ZI_SALESORDER_HEADER    TYPE /BOBF/ACT_KEY VALUE '000C299E71CA1EEE85A5B97726C1626A',
 UPDATE_ZI_SALESORDER_HEADER    TYPE /BOBF/ACT_KEY VALUE '000C299E71CA1EEE85A5B97726C2226A',
 VALIDATE_ZI_SALESORDER_HEADER  TYPE /BOBF/ACT_KEY VALUE '000C299E71CA1EEE85A5B97726C2A26A',
 VALIDATION                     TYPE /BOBF/ACT_KEY VALUE '000C299E71CA1EEE85A5B97726C5426A',
      END OF ZI_SALESORDER_HEADER,
      BEGIN OF ZI_SALESORDER_ITEM,
 CREATE_ZI_SALESORDER_ITEM      TYPE /BOBF/ACT_KEY VALUE '000C299E71CA1EEE85A5B97726DA026A',
 DELETE_ZI_SALESORDER_ITEM      TYPE /BOBF/ACT_KEY VALUE '000C299E71CA1EEE85A5B97726DA826A',
 PREPARATION                    TYPE /BOBF/ACT_KEY VALUE '000C299E71CA1EEE85A5B97726C7026A',
 SAVE_ZI_SALESORDER_ITEM        TYPE /BOBF/ACT_KEY VALUE '000C299E71CA1EEE85A5B97726DB026A',
 UPDATE_ZI_SALESORDER_ITEM      TYPE /BOBF/ACT_KEY VALUE '000C299E71CA1EEE85A5B97726DA426A',
 VALIDATE_ZI_SALESORDER_ITEM    TYPE /BOBF/ACT_KEY VALUE '000C299E71CA1EEE85A5B97726DAC26A',
 VALIDATION                     TYPE /BOBF/ACT_KEY VALUE '000C299E71CA1EEE85A5B97726C6E26A',
      END OF ZI_SALESORDER_ITEM,
    END OF SC_ACTION .
  constants:
    BEGIN OF SC_ACTION_ATTRIBUTE,
        BEGIN OF ZI_SALESORDER_HEADER,
        BEGIN OF EDIT,
 PRESERVE_CHANGES               TYPE STRING VALUE 'PRESERVE_CHANGES',
        END OF EDIT,
        BEGIN OF LOCK_ZI_SALESORDER_HEADER,
 GENERIC                        TYPE STRING VALUE 'GENERIC',
 EDIT_MODE                      TYPE STRING VALUE 'EDIT_MODE',
 ALL_NONE                       TYPE STRING VALUE 'ALL_NONE',
 SCOPE                          TYPE STRING VALUE 'SCOPE',
 FORCE_INVALIDATION             TYPE STRING VALUE 'FORCE_INVALIDATION',
 LOCK_PARAMETER_BUFFER          TYPE STRING VALUE 'LOCK_PARAMETER_BUFFER',
        END OF LOCK_ZI_SALESORDER_HEADER,
        BEGIN OF PREPARATION,
 SIDEEFFECTSQUALIFIER           TYPE STRING VALUE 'SIDEEFFECTSQUALIFIER',
        END OF PREPARATION,
        BEGIN OF UNLOCK_ZI_SALESORDER_HEADER,
 GENERIC                        TYPE STRING VALUE 'GENERIC',
 EDIT_MODE                      TYPE STRING VALUE 'EDIT_MODE',
 ALL_NONE                       TYPE STRING VALUE 'ALL_NONE',
 SCOPE                          TYPE STRING VALUE 'SCOPE',
 FORCE_INVALIDATION             TYPE STRING VALUE 'FORCE_INVALIDATION',
 LOCK_PARAMETER_BUFFER          TYPE STRING VALUE 'LOCK_PARAMETER_BUFFER',
        END OF UNLOCK_ZI_SALESORDER_HEADER,
        BEGIN OF VALIDATION,
 SIDEEFFECTSQUALIFIER           TYPE STRING VALUE 'SIDEEFFECTSQUALIFIER',
        END OF VALIDATION,
      END OF ZI_SALESORDER_HEADER,
        BEGIN OF ZI_SALESORDER_ITEM,
        BEGIN OF PREPARATION,
 SIDEEFFECTSQUALIFIER           TYPE STRING VALUE 'SIDEEFFECTSQUALIFIER',
        END OF PREPARATION,
        BEGIN OF VALIDATION,
 SIDEEFFECTSQUALIFIER           TYPE STRING VALUE 'SIDEEFFECTSQUALIFIER',
        END OF VALIDATION,
      END OF ZI_SALESORDER_ITEM,
    END OF SC_ACTION_ATTRIBUTE .
  constants:
    BEGIN OF SC_ALTERNATIVE_KEY,
      BEGIN OF ZI_SALESORDER_HEADER,
 ACTIVE_ENTITY_KEY              TYPE /BOBF/OBM_ALTKEY_KEY VALUE '000C299E71CA1EEE85A5B97726C4E26A',
      END OF ZI_SALESORDER_HEADER,
      BEGIN OF ZI_SALESORDER_ITEM,
 ACTIVE_ENTITY_KEY              TYPE /BOBF/OBM_ALTKEY_KEY VALUE '000C299E71CA1EEE85A5B97726C6C26A',
      END OF ZI_SALESORDER_ITEM,
    END OF SC_ALTERNATIVE_KEY .
  constants:
    BEGIN OF SC_ASSOCIATION,
      BEGIN OF ZI_SALESORDER_HEADER,
 LOCK                           TYPE /BOBF/OBM_ASSOC_KEY VALUE '000C299E71CA1EEE85A5B97726C1026A',
 MESSAGE                        TYPE /BOBF/OBM_ASSOC_KEY VALUE '000C299E71CA1EEE85A5B97726C0C26A',
 PROPERTY                       TYPE /BOBF/OBM_ASSOC_KEY VALUE '000C299E71CA1EEE85A5B97726C1C26A',
 _ITEMS                         TYPE /BOBF/OBM_ASSOC_KEY VALUE '000C299E71CA1EEE85A5B97726D8826A',
      END OF ZI_SALESORDER_HEADER,
      BEGIN OF ZI_SALESORDER_HEADER_LOCK,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '000C299E71CA1EEE85A5B97726C3426A',
      END OF ZI_SALESORDER_HEADER_LOCK,
      BEGIN OF ZI_SALESORDER_HEADER_MESSAGE,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '000C299E71CA1EEE85A5B97726C3226A',
      END OF ZI_SALESORDER_HEADER_MESSAGE,
      BEGIN OF ZI_SALESORDER_HEADER_PROPERTY,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '000C299E71CA1EEE85A5B97726C3626A',
      END OF ZI_SALESORDER_HEADER_PROPERTY,
      BEGIN OF ZI_SALESORDER_ITEM,
 MESSAGE                        TYPE /BOBF/OBM_ASSOC_KEY VALUE '000C299E71CA1EEE85A5B97726D9A26A',
 PROPERTY                       TYPE /BOBF/OBM_ASSOC_KEY VALUE '000C299E71CA1EEE85A5B97726D9E26A',
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '000C299E71CA1EEE85A5B97726DB426A',
 TO_ROOT                        TYPE /BOBF/OBM_ASSOC_KEY VALUE '000C299E71CA1EEE85A5B97726DB626A',
      END OF ZI_SALESORDER_ITEM,
      BEGIN OF ZI_SALESORDER_ITEM_MESSAGE,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '000C299E71CA1EEE85A5B97726DB826A',
      END OF ZI_SALESORDER_ITEM_MESSAGE,
      BEGIN OF ZI_SALESORDER_ITEM_PROPERTY,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '000C299E71CA1EEE85A5B97726DBA26A',
      END OF ZI_SALESORDER_ITEM_PROPERTY,
    END OF SC_ASSOCIATION .
  constants:
    BEGIN OF SC_ASSOCIATION_ATTRIBUTE,
      BEGIN OF ZI_SALESORDER_HEADER,
        BEGIN OF PROPERTY,
 ALL_NODE_PROPERTY              TYPE STRING VALUE 'ALL_NODE_PROPERTY',
 ALL_NODE_ATTRIBUTE_PROPERTY    TYPE STRING VALUE 'ALL_NODE_ATTRIBUTE_PROPERTY',
 ALL_ASSOCIATION_PROPERTY       TYPE STRING VALUE 'ALL_ASSOCIATION_PROPERTY',
 ALL_ASSOCIATION_ATTRIBUTE_PROP TYPE STRING VALUE 'ALL_ASSOCIATION_ATTRIBUTE_PROP',
 ALL_ACTION_PROPERTY            TYPE STRING VALUE 'ALL_ACTION_PROPERTY',
 ALL_ACTION_ATTRIBUTE_PROPERTY  TYPE STRING VALUE 'ALL_ACTION_ATTRIBUTE_PROPERTY',
 ALL_QUERY_PROPERTY             TYPE STRING VALUE 'ALL_QUERY_PROPERTY',
 ALL_QUERY_ATTRIBUTE_PROPERTY   TYPE STRING VALUE 'ALL_QUERY_ATTRIBUTE_PROPERTY',
 ALL_SUBTREE_PROPERTY           TYPE STRING VALUE 'ALL_SUBTREE_PROPERTY',
        END OF PROPERTY,
      END OF ZI_SALESORDER_HEADER,
      BEGIN OF ZI_SALESORDER_ITEM,
        BEGIN OF PROPERTY,
 ALL_NODE_PROPERTY              TYPE STRING VALUE 'ALL_NODE_PROPERTY',
 ALL_NODE_ATTRIBUTE_PROPERTY    TYPE STRING VALUE 'ALL_NODE_ATTRIBUTE_PROPERTY',
 ALL_ASSOCIATION_PROPERTY       TYPE STRING VALUE 'ALL_ASSOCIATION_PROPERTY',
 ALL_ASSOCIATION_ATTRIBUTE_PROP TYPE STRING VALUE 'ALL_ASSOCIATION_ATTRIBUTE_PROP',
 ALL_ACTION_PROPERTY            TYPE STRING VALUE 'ALL_ACTION_PROPERTY',
 ALL_ACTION_ATTRIBUTE_PROPERTY  TYPE STRING VALUE 'ALL_ACTION_ATTRIBUTE_PROPERTY',
 ALL_QUERY_PROPERTY             TYPE STRING VALUE 'ALL_QUERY_PROPERTY',
 ALL_QUERY_ATTRIBUTE_PROPERTY   TYPE STRING VALUE 'ALL_QUERY_ATTRIBUTE_PROPERTY',
 ALL_SUBTREE_PROPERTY           TYPE STRING VALUE 'ALL_SUBTREE_PROPERTY',
        END OF PROPERTY,
      END OF ZI_SALESORDER_ITEM,
    END OF SC_ASSOCIATION_ATTRIBUTE .
  constants:
    SC_BO_KEY  TYPE /BOBF/OBM_BO_KEY VALUE '000C299E71CA1EEE85A5B97726C0226A' .
  constants:
    SC_BO_NAME TYPE /BOBF/OBM_NAME VALUE 'ZI_SALESORDER_HEADER' .
  constants:
    BEGIN OF SC_DETERMINATION,
      BEGIN OF ZI_SALESORDER_HEADER,
 ACTION_AND_FIELD_CONTROL       TYPE /BOBF/DET_KEY VALUE '000C299E71CA1EEE85A5B97726C5826A',
 ADMINISTRATIVE_DATA            TYPE /BOBF/DET_KEY VALUE '000C299E71CA1EEE85A5C64486AEA276',
 CAL_GLOBALTOTAL                TYPE /BOBF/DET_KEY VALUE '000C299E71CA1EEE85BE6F2D4B358436',
 CENTRAL_ADMIN_DATA             TYPE /BOBF/DET_KEY VALUE '000C299E71CA1EEE85A5B97726C5A26A',
 DELETE_DRAFT_WHN_ACTIVE_DELETE TYPE /BOBF/DET_KEY VALUE '000C299E71CA1EEE85A5B97726C6826A',
 DRAFT_ACTION_CONTROL           TYPE /BOBF/DET_KEY VALUE '000C299E71CA1EEE85A5B97726C6626A',
 DRAFT_SYS_ADMIN_DATA           TYPE /BOBF/DET_KEY VALUE '000C299E71CA1EEE85A5B97726C5C26A',
 DURABLE_LOCK_CLEANUP_CLEANUP   TYPE /BOBF/DET_KEY VALUE '000C299E71CA1EEE85A5B97726C6426A',
 DURABLE_LOCK_CLEANUP_DELETE    TYPE /BOBF/DET_KEY VALUE '000C299E71CA1EEE85A5B97726C5E26A',
 DURABLE_LOCK_CLEANUP_FAIL_SAVE TYPE /BOBF/DET_KEY VALUE '000C299E71CA1EEE85A5B97726C6226A',
 DURABLE_LOCK_CLEANUP_SUCC_SAVE TYPE /BOBF/DET_KEY VALUE '000C299E71CA1EEE85A5B97726C6026A',
 SET_SOID                       TYPE /BOBF/DET_KEY VALUE '000C299E71CA1EEE85A5E4A376EF228A',
      END OF ZI_SALESORDER_HEADER,
      BEGIN OF ZI_SALESORDER_ITEM,
 ACTION_AND_FIELD_CONTROL       TYPE /BOBF/DET_KEY VALUE '000C299E71CA1EEE85A5B97726C7226A',
 CAL_AMOUNT                     TYPE /BOBF/DET_KEY VALUE '000C299E71CA1EEE85A9F9BF98BD2406',
 DRAFT_ACTION_CONTROL           TYPE /BOBF/DET_KEY VALUE '000C299E71CA1EEE85A5B97726C7426A',
 SET_ITEM_POS                   TYPE /BOBF/DET_KEY VALUE '000C299E71CA1EEE85A9CDC1EA62C3E7',
      END OF ZI_SALESORDER_ITEM,
    END OF SC_DETERMINATION .
  constants:
    BEGIN OF SC_GROUP,
 DRAFT_CONSISTENCY              TYPE /BOBF/OBM_GROUP_KEY VALUE '000C299E71CA1EEE85A5B97726C3A26A',
    END OF SC_GROUP .
  constants:
    SC_MODEL_VERSION TYPE /BOBF/CONF_VERSION VALUE '00000' .
  constants:
    BEGIN OF SC_NODE,
 ZI_SALESORDER_HEADER           TYPE /BOBF/OBM_NODE_KEY VALUE '000C299E71CA1EEE85A5B97726C0626A',
 ZI_SALESORDER_HEADER_LOCK      TYPE /BOBF/OBM_NODE_KEY VALUE '000C299E71CA1EEE85A5B97726C0E26A',
 ZI_SALESORDER_HEADER_MESSAGE   TYPE /BOBF/OBM_NODE_KEY VALUE '000C299E71CA1EEE85A5B97726C0A26A',
 ZI_SALESORDER_HEADER_PROPERTY  TYPE /BOBF/OBM_NODE_KEY VALUE '000C299E71CA1EEE85A5B97726C1A26A',
 ZI_SALESORDER_ITEM             TYPE /BOBF/OBM_NODE_KEY VALUE '000C299E71CA1EEE85A5B97726C4026A',
 ZI_SALESORDER_ITEM_MESSAGE     TYPE /BOBF/OBM_NODE_KEY VALUE '000C299E71CA1EEE85A5B97726D9826A',
 ZI_SALESORDER_ITEM_PROPERTY    TYPE /BOBF/OBM_NODE_KEY VALUE '000C299E71CA1EEE85A5B97726D9C26A',
    END OF SC_NODE .
  constants:
    BEGIN OF SC_NODE_ATTRIBUTE,
      BEGIN OF ZI_SALESORDER_HEADER,
  NODE_DATA                      TYPE STRING VALUE 'NODE_DATA',
  SOID                           TYPE STRING VALUE 'SOID',
  BUSINESS_PARTNER               TYPE STRING VALUE 'BUSINESS_PARTNER',
  PARTNERNAME                    TYPE STRING VALUE 'PARTNERNAME',
  CURRENCY_CODE                  TYPE STRING VALUE 'CURRENCY_CODE',
  GROSS_AMOUNT                   TYPE STRING VALUE 'GROSS_AMOUNT',
  NET_AMOUNT                     TYPE STRING VALUE 'NET_AMOUNT',
  TAX_AMOUNT                     TYPE STRING VALUE 'TAX_AMOUNT',
  STATUS                         TYPE STRING VALUE 'STATUS',
  STATUSTXT                      TYPE STRING VALUE 'STATUSTXT',
  BILLING_STATUS                 TYPE STRING VALUE 'BILLING_STATUS',
  BILLSTATUS                     TYPE STRING VALUE 'BILLSTATUS',
  DELIVERY_STATUS                TYPE STRING VALUE 'DELIVERY_STATUS',
  DELIVETYSTATUS                 TYPE STRING VALUE 'DELIVETYSTATUS',
  CREA_DATE_TIME                 TYPE STRING VALUE 'CREA_DATE_TIME',
  CREA_UNAME                     TYPE STRING VALUE 'CREA_UNAME',
  LCHG_DATE_TIME                 TYPE STRING VALUE 'LCHG_DATE_TIME',
  LCHG_UNAME                     TYPE STRING VALUE 'LCHG_UNAME',
  ACTIVEUUID                     TYPE STRING VALUE 'ACTIVEUUID',
  HASACTIVEENTITY                TYPE STRING VALUE 'HASACTIVEENTITY',
  DRAFTENTITYCREATIONDATETIME    TYPE STRING VALUE 'DRAFTENTITYCREATIONDATETIME',
  DRAFTENTITYLASTCHANGEDATETIME  TYPE STRING VALUE 'DRAFTENTITYLASTCHANGEDATETIME',
  DRAFTENTITYCONSISTENCYSTATUS   TYPE STRING VALUE 'DRAFTENTITYCONSISTENCYSTATUS',
  ISACTIVEENTITY                 TYPE STRING VALUE 'ISACTIVEENTITY',
      END OF ZI_SALESORDER_HEADER,
      BEGIN OF ZI_SALESORDER_ITEM,
  NODE_DATA                      TYPE STRING VALUE 'NODE_DATA',
  SO_ITEM                        TYPE STRING VALUE 'SO_ITEM',
  PROD_ID                        TYPE STRING VALUE 'PROD_ID',
  PRDNAME                        TYPE STRING VALUE 'PRDNAME',
  QUANTITY                       TYPE STRING VALUE 'QUANTITY',
  UNIT_ID                        TYPE STRING VALUE 'UNIT_ID',
  DELIVERYDATE                   TYPE STRING VALUE 'DELIVERYDATE',
  CURRENCY_CODE                  TYPE STRING VALUE 'CURRENCY_CODE',
  GROSS_AMOUNT                   TYPE STRING VALUE 'GROSS_AMOUNT',
  NET_AMOUNT                     TYPE STRING VALUE 'NET_AMOUNT',
  TAX_AMOUNT                     TYPE STRING VALUE 'TAX_AMOUNT',
  AVAILABLE                      TYPE STRING VALUE 'AVAILABLE',
  ATPSTATUS                      TYPE STRING VALUE 'ATPSTATUS',
  ACTIVEUUID                     TYPE STRING VALUE 'ACTIVEUUID',
  HASACTIVEENTITY                TYPE STRING VALUE 'HASACTIVEENTITY',
  DRAFTENTITYCREATIONDATETIME    TYPE STRING VALUE 'DRAFTENTITYCREATIONDATETIME',
  DRAFTENTITYLASTCHANGEDATETIME  TYPE STRING VALUE 'DRAFTENTITYLASTCHANGEDATETIME',
  DRAFTENTITYCONSISTENCYSTATUS   TYPE STRING VALUE 'DRAFTENTITYCONSISTENCYSTATUS',
  ISACTIVEENTITY                 TYPE STRING VALUE 'ISACTIVEENTITY',
      END OF ZI_SALESORDER_ITEM,
    END OF SC_NODE_ATTRIBUTE .
  constants:
    BEGIN OF SC_NODE_CATEGORY,
      BEGIN OF ZI_SALESORDER_HEADER,
 ROOT                           TYPE /BOBF/OBM_NODE_CAT_KEY VALUE '000C299E71CA1EEE85A5B97726C0826A',
      END OF ZI_SALESORDER_HEADER,
      BEGIN OF ZI_SALESORDER_ITEM,
 ZI_SALESORDER_ITEM             TYPE /BOBF/OBM_NODE_CAT_KEY VALUE '000C299E71CA1EEE85A5B97726D8626A',
      END OF ZI_SALESORDER_ITEM,
    END OF SC_NODE_CATEGORY .
  constants:
    BEGIN OF SC_STATUS_VARIABLE,
      BEGIN OF ZI_SALESORDER_HEADER,
 DRAFT_CONSISTENCY_STATUS       TYPE /BOBF/STA_VAR_KEY VALUE '000C299E71CA1EEE85A5B97726C3826A',
      END OF ZI_SALESORDER_HEADER,
    END OF SC_STATUS_VARIABLE .
  constants:
    BEGIN OF SC_VALIDATION,
      BEGIN OF ZI_SALESORDER_HEADER,
 DURABLE_LOCK_CREATE_FOR_NEW    TYPE /BOBF/VAL_KEY VALUE '000C299E71CA1EEE85A5B97726C6A26A',
      END OF ZI_SALESORDER_HEADER,
    END OF SC_VALIDATION .
endinterface.
