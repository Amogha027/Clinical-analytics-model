cube(`FormParameterMasters`, {
  sql: `SELECT * FROM ebdb.form_parameter_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    FormMasters: {
      sql: `${CUBE}.form_master_id = ${FormMasters}.id`,
      relationship: `belongsTo`
    },
    
    DiseaseScoreParameterMasters: {
      sql: `${CUBE}.parameter_master_id = ${DiseaseScoreParameterMasters}.id`,
      relationship: `belongsTo`
    },
    
    NanoParameterMasters: {
      sql: `${CUBE}.parameter_master_id = ${NanoParameterMasters}.id`,
      relationship: `belongsTo`
    },
    
    ParameterMasters: {
      sql: `${CUBE}.parameter_master_id = ${ParameterMasters}.id`,
      relationship: `belongsTo`
    },
    
    PartnerParameterMasters: {
      sql: `${CUBE}.parameter_master_id = ${PartnerParameterMasters}.parameter_master_id`,
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
