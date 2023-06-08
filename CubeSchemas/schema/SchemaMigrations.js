cube(`SchemaMigrations`, {
  sql: `SELECT * FROM ebdb.schema_migrations`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: []
    }
  },
  
  dimensions: {
    version: {
      sql: `version`,
      type: `string`
    }
  },
  
  dataSource: `default`
});
