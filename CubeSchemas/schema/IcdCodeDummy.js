cube(`IcdCodeDummy`, {
  sql: `SELECT * FROM ebdb.icd_code_dummy`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    icdCode: {
      sql: `icd_code`,
      type: `string`
    },
    
    nhImpactPrcnt: {
      sql: `nh_impact_prcnt`,
      type: `string`
    }
  },
  
  dataSource: `default`
});
