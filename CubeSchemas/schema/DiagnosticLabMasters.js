cube(`DiagnosticLabMasters`, {
  sql: `SELECT * FROM ebdb.diagnostic_lab_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    AddressDetails: {
      sql: `${CUBE}.address_detail_id = ${AddressDetails}.id`,
      relationship: `belongsTo`
    },
    
    OrderAddressDetails: {
      sql: `${CUBE}.address_detail_id = ${OrderAddressDetails}.id`,
      relationship: `belongsTo`
    },
    
    ServiceMasters: {
      sql: `${CUBE}.service_master_id = ${ServiceMasters}.id`,
      relationship: `belongsTo`
    },
    
    WebsiteServiceMasters: {
      sql: `${CUBE}.service_master_id = ${WebsiteServiceMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, labName, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    labName: {
      sql: `lab_name`,
      type: `string`
    },
    
    diagnosticLabGroup: {
      sql: `diagnostic_lab_group`,
      type: `string`
    },
    
    landline: {
      sql: `landline`,
      type: `string`
    },
    
    mobile: {
      sql: `mobile`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
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
    
    dummy3: {
      sql: `dummy3`,
      type: `time`
    },
    
    deletedAt: {
      sql: `deleted_at`,
      type: `time`
    },
    
    effctvDt: {
      sql: `effctv_dt`,
      type: `time`
    },
    
    trmntnDt: {
      sql: `trmntn_dt`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
