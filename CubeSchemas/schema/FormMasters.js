cube(`FormMasters`, {
  sql: `SELECT * FROM ebdb.form_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    CareDeliveryProgramMasters: {
      sql: `${CUBE}.program_master_id = ${CareDeliveryProgramMasters}.id`,
      relationship: `belongsTo`
    },
    
    ProgramMasters: {
      sql: `${CUBE}.program_master_id = ${ProgramMasters}.id`,
      relationship: `belongsTo`
    },
    
    FormTypeMasters: {
      sql: `${CUBE}.form_type_master_id = ${FormTypeMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, formName, formLabelName, respRoleId, formMetaTitle, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    formName: {
      sql: `form_name`,
      type: `string`
    },
    
    formLabelName: {
      sql: `form_label_name`,
      type: `string`
    },
    
    code: {
      sql: `code`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    respRoleId: {
      sql: `resp_role_id`,
      type: `string`
    },
    
    saathiAppFont: {
      sql: `saathi_app_font`,
      type: `string`
    },
    
    submitText: {
      sql: `submit_text`,
      type: `string`
    },
    
    submitLink: {
      sql: `submit_link`,
      type: `string`
    },
    
    websiteFormUrl: {
      sql: `website_form_url`,
      type: `string`
    },
    
    formMetaTitle: {
      sql: `form_meta_title`,
      type: `string`
    },
    
    formMetaDesc: {
      sql: `form_meta_desc`,
      type: `string`
    },
    
    formIconUrl: {
      sql: `form_icon_url`,
      type: `string`
    },
    
    formOgImgUrl: {
      sql: `form_og_img_url`,
      type: `string`
    },
    
    formWebImgUrl: {
      sql: `form_web_img_url`,
      type: `string`
    },
    
    dynamicLink: {
      sql: `dynamic_link`,
      type: `string`
    },
    
    headerImgUrl: {
      sql: `header_img_url`,
      type: `string`
    },
    
    footerImgUrl: {
      sql: `footer_img_url`,
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
    
    archivedAt: {
      sql: `archived_at`,
      type: `time`
    },
    
    dummy3: {
      sql: `dummy3`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
