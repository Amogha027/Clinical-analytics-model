cube(`DiseaseMasters`, {
  sql: `SELECT * FROM ebdb.disease_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, dssName, aliasName, questnrMasterIds, defaultQuestnrMasterIds, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    dssCode: {
      sql: `dss_code`,
      type: `string`
    },
    
    dssName: {
      sql: `dss_name`,
      type: `string`
    },
    
    aliasName: {
      sql: `alias_name`,
      type: `string`
    },
    
    dssDesc: {
      sql: `dss_desc`,
      type: `string`
    },
    
    questnrMasterIds: {
      sql: `questnr_master_ids`,
      type: `string`
    },
    
    defaultQuestnrMasterIds: {
      sql: `default_questnr_master_ids`,
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
