cube(`WebsitePackageMasters`, {
  sql: `SELECT * FROM ebdb.website_package_masters`,
  
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
      drillMembers: [id, packageName, packageActionName, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    packageName: {
      sql: `package_name`,
      type: `string`
    },
    
    packageIconUrl: {
      sql: `package_icon_url`,
      type: `string`
    },
    
    packageHeader: {
      sql: `package_header`,
      type: `string`
    },
    
    packageContent: {
      sql: `package_content`,
      type: `string`
    },
    
    packageActionName: {
      sql: `package_action_name`,
      type: `string`
    },
    
    packageActionPath: {
      sql: `package_action_path`,
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
