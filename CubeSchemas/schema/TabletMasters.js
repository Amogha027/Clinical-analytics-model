cube(`TabletMasters`, {
  sql: `SELECT * FROM ebdb.tablet_masters`,
  
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
    
    imeiCode: {
      sql: `imei_code`,
      type: `string`
    },
    
    company: {
      sql: `company`,
      type: `string`
    },
    
    modelNo: {
      sql: `model_no`,
      type: `string`
    },
    
    fcmToken: {
      sql: `fcm_token`,
      type: `string`
    },
    
    authenticationToken: {
      sql: `authentication_token`,
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
    
    purchaseDt: {
      sql: `purchase_dt`,
      type: `time`
    },
    
    oprStartDt: {
      sql: `opr_start_dt`,
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
