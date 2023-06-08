cube(`ShortenedUrls`, {
  sql: `SELECT * FROM ebdb.shortened_urls`,
  
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
    },
    
    useCount: {
      sql: `use_count`,
      type: `sum`
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    recipient: {
      sql: `recipient`,
      type: `string`
    },
    
    ownerType: {
      sql: `owner_type`,
      type: `string`
    },
    
    url: {
      sql: `url`,
      type: `string`
    },
    
    uniqueKey: {
      sql: `unique_key`,
      type: `string`
    },
    
    otpSecretKey: {
      sql: `otp_secret_key`,
      type: `string`
    },
    
    label: {
      sql: `label`,
      type: `string`
    },
    
    string: {
      sql: `string`,
      type: `string`
    },
    
    category: {
      sql: `category`,
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
    
    expiresAt: {
      sql: `expires_at`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
