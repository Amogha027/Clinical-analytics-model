cube(`CustomTemplatePdfDetails`, {
  sql: `SELECT * FROM ebdb.custom_template_pdf_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    QuestnrMasters: {
      sql: `${CUBE}.questnr_master_id = ${QuestnrMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, templateName, serviceMasterIds, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    templateName: {
      sql: `template_name`,
      type: `string`
    },
    
    sourceType: {
      sql: `source_type`,
      type: `string`
    },
    
    serviceMasterIds: {
      sql: `service_master_ids`,
      type: `string`
    },
    
    templateHeading: {
      sql: `template_heading`,
      type: `string`
    },
    
    templateHeaderUrl: {
      sql: `template_header_url`,
      type: `string`
    },
    
    templateContent: {
      sql: `template_content`,
      type: `string`
    },
    
    footerHeaderUrl: {
      sql: `footer_header_url`,
      type: `string`
    },
    
    signatureUrl: {
      sql: `signature_url`,
      type: `string`
    },
    
    commts: {
      sql: `commts`,
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
