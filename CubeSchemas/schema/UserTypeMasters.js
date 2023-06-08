cube(`UserTypeMasters`, {
  sql: `SELECT * FROM ebdb.user_type_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    
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
    
    userTypeCode: {
      sql: `user_type_code`,
      type: `string`
    },
    
    userTypeDesc: {
      sql: `user_type_desc`,
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
    
    dummy3: {
      sql: `dummy3`,
      type: `time`
    },
    
    deletedAt: {
      sql: `deleted_at`,
      type: `time`
    },
    
    trmntnDt: {
      sql: `trmntn_dt`,
      type: `time`
    },
    
    effctvDt: {
      sql: `effctv_dt`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
