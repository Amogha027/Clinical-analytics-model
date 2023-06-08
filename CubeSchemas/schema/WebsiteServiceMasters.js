cube(`WebsiteServiceMasters`, {
  sql: `SELECT * FROM ebdb.website_service_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    WebsiteMasters: {
      sql: `${CUBE}.website_master_id = ${WebsiteMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, serviceName, serviceActionName, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    serviceName: {
      sql: `service_name`,
      type: `string`
    },
    
    serviceIconUrl: {
      sql: `service_icon_url`,
      type: `string`
    },
    
    serviceHeader: {
      sql: `service_header`,
      type: `string`
    },
    
    serviceContent: {
      sql: `service_content`,
      type: `string`
    },
    
    serviceActionName: {
      sql: `service_action_name`,
      type: `string`
    },
    
    serviceActionPath: {
      sql: `service_action_path`,
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
