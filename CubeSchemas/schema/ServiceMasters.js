cube(`ServiceMasters`, {
  sql: `SELECT * FROM ebdb.service_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, serviceName, apmntTypeIds, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    serviceCode: {
      sql: `service_code`,
      type: `string`
    },
    
    serviceType: {
      sql: `service_type`,
      type: `string`
    },
    
    serviceName: {
      sql: `service_name`,
      type: `string`
    },
    
    apmntTypeIds: {
      sql: `apmnt_type_ids`,
      type: `string`
    },
    
    sourceTable: {
      sql: `source_table`,
      type: `string`
    },
    
    serviceDesc: {
      sql: `service_desc`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    serviceLabel: {
      sql: `service_label`,
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
    
    effctvDt: {
      sql: `effctv_dt`,
      type: `time`
    },
    
    trmntnDt: {
      sql: `trmntn_dt`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
