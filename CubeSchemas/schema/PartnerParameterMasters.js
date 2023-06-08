cube(`PartnerParameterMasters`, {
  sql: `SELECT * FROM ebdb.partner_parameter_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    CareDeliveryProgramMasters: {
      sql: `${CUBE}.care_delivery_program_master_id = ${CareDeliveryProgramMasters}.id`,
      relationship: `belongsTo`
    },
    
    DiseaseScoreParameterMasters: {
      sql: `${CUBE}.parameter_master_id = ${DiseaseScoreParameterMasters}.id`,
      relationship: `belongsTo`
    },
    
    FormParameterMasters: {
      sql: `${CUBE}.parameter_master_id = ${FormParameterMasters}.parameter_master_id`,
      relationship: `belongsTo`
    },
    
    NanoParameterMasters: {
      sql: `${CUBE}.parameter_master_id = ${NanoParameterMasters}.id`,
      relationship: `belongsTo`
    },
    
    ParameterMasters: {
      sql: `${CUBE}.parameter_master_id = ${ParameterMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    sourceTable: {
      sql: `source_table`,
      type: `string`
    },
    
    parameterValue: {
      sql: `parameter_value`,
      type: `string`
    },
    
    createdAt: {
      sql: `created_at`,
      type: `time`
    },
    
    updatedAt: {
      sql: `updated_at`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
