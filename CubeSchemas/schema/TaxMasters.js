cube(`TaxMasters`, {
  sql: `SELECT * FROM ebdb.tax_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, taxName, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    taxName: {
      sql: `tax_name`,
      type: `string`
    },
    
    taxType: {
      sql: `tax_type`,
      type: `string`
    },
    
    description: {
      sql: `description`,
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
    
    effctvDt: {
      sql: `effctv_dt`,
      type: `time`
    },
    
    trmntnDt: {
      sql: `trmntn_dt`,
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
