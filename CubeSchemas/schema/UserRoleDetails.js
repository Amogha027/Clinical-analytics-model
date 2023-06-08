cube(`UserRoleDetails`, {
  sql: `SELECT * FROM ebdb.user_role_details`,
  
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
    },
    
    DashboardMasters: {
      sql: `${CUBE}.dashboard_master_id = ${DashboardMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, accessIds, programMasterIds, labelName, dashboardMasterId, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    accessIds: {
      sql: `access_ids`,
      type: `string`
    },
    
    programMasterIds: {
      sql: `program_master_ids`,
      type: `string`
    },
    
    fcmToken: {
      sql: `fcm_token`,
      type: `string`
    },
    
    labelName: {
      sql: `label_name`,
      type: `string`
    },
    
    dashboardMasterId: {
      sql: `dashboard_master_id`,
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
