cube(`People`, {
  sql: `SELECT * FROM ebdb.people`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, name]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    name: {
      sql: `${CUBE}.\`NAME\``,
      type: `string`
    },
    
    occupation: {
      sql: `occupation`,
      type: `string`
    }
  },
  
  dataSource: `default`
});
