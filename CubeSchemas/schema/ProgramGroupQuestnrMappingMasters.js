cube(`ProgramGroupQuestnrMappingMasters`, {
  sql: `SELECT * FROM ebdb.program_group_questnr_mapping_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    FieldTypeMasters: {
      sql: `${CUBE}.field_type_master_id = ${FieldTypeMasters}.id`,
      relationship: `belongsTo`
    },
    
    CareDeliveryProgramMasters: {
      sql: `${CUBE}.program_master_id = ${CareDeliveryProgramMasters}.id`,
      relationship: `belongsTo`
    },
    
    ProgramMasters: {
      sql: `${CUBE}.program_master_id = ${ProgramMasters}.id`,
      relationship: `belongsTo`
    },
    
    QuestnrGroupMasters: {
      sql: `${CUBE}.questnr_group_master_id = ${QuestnrGroupMasters}.id`,
      relationship: `belongsTo`
    },
    
    QuestnrMasters: {
      sql: `${CUBE}.questnr_master_id = ${QuestnrMasters}.id`,
      relationship: `belongsTo`
    },
    
    HospitalAppointmentUnitMasters: {
      sql: `${CUBE}.unit_master_id = ${HospitalAppointmentUnitMasters}.id`,
      relationship: `belongsTo`
    },
    
    UnitMasters: {
      sql: `${CUBE}.unit_master_id = ${UnitMasters}.id`,
      relationship: `belongsTo`
    },
    
    FormMasters: {
      sql: `${CUBE}.form_master_id = ${FormMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, tableRowQuestnrIds, questnLabelName, derivedQuestnIds, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    tableRowQuestnrIds: {
      sql: `table_row_questnr_ids`,
      type: `string`
    },
    
    questnLabelName: {
      sql: `questn_label_name`,
      type: `string`
    },
    
    options: {
      sql: `options`,
      type: `string`
    },
    
    questnDesc: {
      sql: `questn_desc`,
      type: `string`
    },
    
    minVal: {
      sql: `min_val`,
      type: `string`
    },
    
    maxVal: {
      sql: `max_val`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    derivedQuestnIds: {
      sql: `derived_questn_ids`,
      type: `string`
    },
    
    placeholderLabel: {
      sql: `placeholder_label`,
      type: `string`
    },
    
    customLogic: {
      sql: `custom_logic`,
      type: `string`
    },
    
    colSpanMd: {
      sql: `col_span_md`,
      type: `string`
    },
    
    srceLogic: {
      sql: `srce_logic`,
      type: `string`
    },
    
    createdAt: {
      sql: `created_at`,
      type: `time`
    },
    
    updatedAt: {
      sql: `updated_at`,
      type: `time`
    },
    
    archivedAt: {
      sql: `archived_at`,
      type: `time`
    },
    
    dummy3: {
      sql: `dummy3`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
