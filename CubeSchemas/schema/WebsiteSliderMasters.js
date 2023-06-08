cube(`WebsiteSliderMasters`, {
  sql: `SELECT * FROM ebdb.website_slider_masters`,
  
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
      drillMembers: [id, name, sliderImgUrl, sliderMobileImg, sliderHeader, sliderContent, sliderActionName, sliderActionPath, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    name: {
      sql: `name`,
      type: `string`
    },
    
    sliderImgUrl: {
      sql: `slider_img_url`,
      type: `string`
    },
    
    sliderMobileImg: {
      sql: `slider_mobile_img`,
      type: `string`
    },
    
    sliderHeader: {
      sql: `slider_header`,
      type: `string`
    },
    
    sliderContent: {
      sql: `slider_content`,
      type: `string`
    },
    
    sliderActionName: {
      sql: `slider_action_name`,
      type: `string`
    },
    
    sliderActionPath: {
      sql: `slider_action_path`,
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
