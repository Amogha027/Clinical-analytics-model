cube(`ServiceAgencyMasters`, {
  sql: `SELECT * FROM ebdb.service_agency_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    ServiceAgencyCategoryMasters: {
      sql: `${CUBE}.service_agency_category_master_id = ${ServiceAgencyCategoryMasters}.id`,
      relationship: `belongsTo`
    },
    
    ServiceAgencyTypeMasters: {
      sql: `${CUBE}.service_agency_type_master_id = ${ServiceAgencyTypeMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, saName, saShortName, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    saName: {
      sql: `sa_name`,
      type: `string`
    },
    
    saShortName: {
      sql: `${CUBE}.\`sa_short_Name\``,
      type: `string`
    },
    
    licenseCodeNo: {
      sql: `license_code_no`,
      type: `string`
    },
    
    certNo: {
      sql: `cert_no`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    bannerLogo: {
      sql: `banner_logo`,
      type: `string`
    },
    
    webLogo: {
      sql: `web_logo`,
      type: `string`
    },
    
    waterMarkImg: {
      sql: `water_mark_img`,
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
    
    effctvDt: {
      sql: `effctv_dt`,
      type: `time`
    },
    
    trmntnDt: {
      sql: `trmntn_dt`,
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
