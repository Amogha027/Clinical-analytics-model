cube(`IcdCmCodeMasters`, {
  sql: `SELECT * FROM ebdb.icd_cm_code_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, aliasName, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    icdCmCode: {
      sql: `icd_cm_code`,
      type: `string`
    },
    
    description1: {
      sql: `description1`,
      type: `string`
    },
    
    description2: {
      sql: `description2`,
      type: `string`
    },
    
    description3: {
      sql: `description3`,
      type: `string`
    },
    
    aliasName: {
      sql: `alias_name`,
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
