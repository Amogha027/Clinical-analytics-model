cube(`Activities`, {
  sql: `SELECT * FROM ebdb.activities`,
  
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
    
    trackableType: {
      sql: `trackable_type`,
      type: `string`
    },
    
    ownerType: {
      sql: `owner_type`,
      type: `string`
    },
    
    key: {
      sql: `key`,
      type: `string`
    },
    
    parameters: {
      sql: `parameters`,
      type: `string`
    },
    
    recipientType: {
      sql: `recipient_type`,
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
