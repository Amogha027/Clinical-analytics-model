cube(`WSectionContentDetails`, {
  sql: `SELECT * FROM ebdb.w_section_content_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    WSectionMasters: {
      sql: `${CUBE}.w_section_master_id = ${WSectionMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, sectionTitle, actionName, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    sectionTitle: {
      sql: `section_title`,
      type: `string`
    },
    
    contentHeading: {
      sql: `content_heading`,
      type: `string`
    },
    
    contentImg: {
      sql: `content_img`,
      type: `string`
    },
    
    contentBody: {
      sql: `content_body`,
      type: `string`
    },
    
    actionName: {
      sql: `action_name`,
      type: `string`
    },
    
    actionPath: {
      sql: `action_path`,
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
