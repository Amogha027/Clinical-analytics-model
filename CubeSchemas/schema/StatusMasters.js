cube(`StatusMasters`, {
  sql: `SELECT * FROM ebdb.status_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, statusName, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    statusCode: {
      sql: `status_code`,
      type: `string`
    },
    
    statusName: {
      sql: `status_name`,
      type: `string`
    },
    
    statusDescription: {
      sql: `status_description`,
      type: `string`
    },
    
    nextStep: {
      sql: `next_step`,
      type: `string`
    },
    
    sourceActivity: {
      sql: `source_activity`,
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
    
    trmntnDt: {
      sql: `trmntn_dt`,
      type: `time`
    },
    
    effctvDt: {
      sql: `effctv_dt`,
      type: `time`
    },
    
    archivedAt: {
      sql: `archived_at`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
