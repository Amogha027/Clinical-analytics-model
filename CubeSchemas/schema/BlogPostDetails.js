cube(`BlogPostDetails`, {
  sql: `SELECT * FROM ebdb.blog_post_details`,
  
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
      drillMembers: [id, postTitle, createdAt, updatedAt]
    },
    
    viewsCount: {
      sql: `views_count`,
      type: `sum`
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    postTitle: {
      sql: `post_title`,
      type: `string`
    },
    
    postType: {
      sql: `post_type`,
      type: `string`
    },
    
    postContentType: {
      sql: `post_content_type`,
      type: `string`
    },
    
    postContentTypeUrl: {
      sql: `post_content_type_url`,
      type: `string`
    },
    
    postSlug: {
      sql: `post_slug`,
      type: `string`
    },
    
    postContent: {
      sql: `post_content`,
      type: `string`
    },
    
    metaDescription: {
      sql: `meta_description`,
      type: `string`
    },
    
    postStatus: {
      sql: `post_status`,
      type: `string`
    },
    
    postExcerpt: {
      sql: `post_excerpt`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    marketingAccess: {
      sql: `marketing_access`,
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
    
    dummy3: {
      sql: `dummy3`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
