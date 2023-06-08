cube(`ProgramParameterDetails`, {
  sql: `SELECT * FROM ebdb.program_parameter_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    CareDeliveryProgramMasters: {
      sql: `${CUBE}.program_master_id = ${CareDeliveryProgramMasters}.id`,
      relationship: `belongsTo`
    },
    
    ProgramMasters: {
      sql: `${CUBE}.program_master_id = ${ProgramMasters}.id`,
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
    },
    
    PartnerParameterMasters: {
      sql: `${CUBE}.parameter_master_id = ${PartnerParameterMasters}.parameter_master_id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, parameterName, createdAt, updatedAt, dateVal]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    parameterName: {
      sql: `parameter_name`,
      type: `string`
    },
    
    stringVal: {
      sql: `string_val`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
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
    
    dateVal: {
      sql: `date_val`,
      type: `time`
    },
    
    dummy3: {
      sql: `dummy3`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
