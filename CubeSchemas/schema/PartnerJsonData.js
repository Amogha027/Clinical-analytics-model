cube(`PartnerJsonData`, {
  sql: `SELECT * FROM ebdb.partner_json_data`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    CareDeliveryProgramMasters: {
      sql: `${CUBE}.care_delivery_program_master_id = ${CareDeliveryProgramMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, referenceId, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    referenceId: {
      sql: `reference_id`,
      type: `string`
    },
    
    responseData: {
      sql: `response_data`,
      type: `string`
    },
    
    changeType: {
      sql: `change_type`,
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
    
    processedAt: {
      sql: `processed_at`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
