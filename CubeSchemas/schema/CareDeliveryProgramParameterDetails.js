cube(`CareDeliveryProgramParameterDetails`, {
  sql: `SELECT * FROM ebdb.care_delivery_program_parameter_details`,
  
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
    },
    
    PartnerParameterMasters: {
      sql: `${CUBE}.parameter_master_id = ${PartnerParameterMasters}.parameter_master_id`,
      relationship: `belongsTo`
    },
    
    ServiceMasters: {
      sql: `${CUBE}.service_master_id = ${ServiceMasters}.id`,
      relationship: `belongsTo`
    },
    
    WebsiteServiceMasters: {
      sql: `${CUBE}.service_master_id = ${WebsiteServiceMasters}.id`,
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
    
    parameterValue: {
      sql: `parameter_value`,
      type: `string`
    },
    
    strVal: {
      sql: `str_val`,
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
