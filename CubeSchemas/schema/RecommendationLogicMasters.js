cube(`RecommendationLogicMasters`, {
  sql: `SELECT * FROM ebdb.recommendation_logic_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    CareDeliveryProgramMasters: {
      sql: `${CUBE}.care_delivery_program_master_id = ${CareDeliveryProgramMasters}.id`,
      relationship: `belongsTo`
    },
    
    ServiceMasters: {
      sql: `${CUBE}.service_master_id = ${ServiceMasters}.id`,
      relationship: `belongsTo`
    },
    
    WebsiteServiceMasters: {
      sql: `${CUBE}.service_master_id = ${WebsiteServiceMasters}.id`,
      relationship: `belongsTo`
    },
    
    QuestnrMasters: {
      sql: `${CUBE}.questnr_master_id = ${QuestnrMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, operationalStatusIds, clinicalStatusIds, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    logicCode: {
      sql: `logic_code`,
      type: `string`
    },
    
    expectedInputs: {
      sql: `expected_inputs`,
      type: `string`
    },
    
    logic: {
      sql: `logic`,
      type: `string`
    },
    
    logicDesc: {
      sql: `logic_desc`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    operationalStatusIds: {
      sql: `operational_status_ids`,
      type: `string`
    },
    
    clinicalStatusIds: {
      sql: `clinical_status_ids`,
      type: `string`
    },
    
    medicalCondition: {
      sql: `medical_condition`,
      type: `string`
    },
    
    sourceUrls: {
      sql: `source_urls`,
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
