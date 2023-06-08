cube(`ActiveAdminComments`, {
  sql: `SELECT * FROM ebdb.active_admin_comments`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, namespace, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    namespace: {
      sql: `namespace`,
      type: `string`
    },
    
    body: {
      sql: `body`,
      type: `string`
    },
    
    resourceType: {
      sql: `resource_type`,
      type: `string`
    },
    
    authorType: {
      sql: `author_type`,
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
