cube(`UserActivityDetails`, {
  sql: `SELECT * FROM ebdb.user_activity_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    Users: {
      sql: `${CUBE}.user_id = ${Users}.id`,
      relationship: `belongsTo`
    },
    
    RoleMasters: {
      sql: `${CUBE}.role_master_id = ${RoleMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, browserName, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    loginIp: {
      sql: `login_ip`,
      type: `string`
    },
    
    loginDevice: {
      sql: `login_device`,
      type: `string`
    },
    
    browserName: {
      sql: `browser_name`,
      type: `string`
    },
    
    appVersion: {
      sql: `app_version`,
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
    
    loginTime: {
      sql: `login_time`,
      type: `time`
    },
    
    logoutTime: {
      sql: `logout_time`,
      type: `time`
    },
    
    dummy3: {
      sql: `dummy3`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
