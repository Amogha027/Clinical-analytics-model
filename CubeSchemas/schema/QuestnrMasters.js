cube(`QuestnrMasters`, {
  sql: `SELECT * FROM ebdb.questnr_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    FieldTypeMasters: {
      sql: `${CUBE}.field_type_master_id = ${FieldTypeMasters}.id`,
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
    
    DiagnosticTestMasters: {
      sql: `${CUBE}.diagnostic_test_master_id = ${DiagnosticTestMasters}.id`,
      relationship: `belongsTo`
    },
    
    DieticianFavouriteDiagnosticTestMasters: {
      sql: `${CUBE}.diagnostic_test_master_id = ${DieticianFavouriteDiagnosticTestMasters}.diagnostic_test_master_id`,
      relationship: `belongsTo`
    },
    
    DoctorFavouriteDiagnosticTestMasters: {
      sql: `${CUBE}.diagnostic_test_master_id = ${DoctorFavouriteDiagnosticTestMasters}.diagnostic_test_master_id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, tableRowQuestnrIds, questnName, derivedQuestnIds, createdAt, updatedAt]
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
    
    questnName: {
      sql: `questn_name`,
      type: `string`
    },
    
    questnCode: {
      sql: `questn_code`,
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
    
    srceLogic: {
      sql: `srce_logic`,
      type: `string`
    },
    
    targetLogic: {
      sql: `target_logic`,
      type: `string`
    },
    
    resultLogic: {
      sql: `result_logic`,
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
