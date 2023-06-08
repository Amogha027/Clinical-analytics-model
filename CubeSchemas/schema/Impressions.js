cube(`Impressions`, {
  sql: `SELECT * FROM ebdb.impressions`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    Users: {
      sql: `${CUBE}.user_id = ${Users}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, controllerName, actionName, viewName, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    impressionableType: {
      sql: `impressionable_type`,
      type: `string`
    },
    
    controllerName: {
      sql: `controller_name`,
      type: `string`
    },
    
    actionName: {
      sql: `action_name`,
      type: `string`
    },
    
    viewName: {
      sql: `view_name`,
      type: `string`
    },
    
    requestHash: {
      sql: `request_hash`,
      type: `string`
    },
    
    ipAddress: {
      sql: `ip_address`,
      type: `string`
    },
    
    sessionHash: {
      sql: `session_hash`,
      type: `string`
    },
    
    message: {
      sql: `message`,
      type: `string`
    },
    
    referrer: {
      sql: `referrer`,
      type: `string`
    },
    
    params: {
      sql: `params`,
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
