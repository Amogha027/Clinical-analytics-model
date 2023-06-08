cube(`EnquiryDetails`, {
  sql: `SELECT * FROM ebdb.enquiry_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, city, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    frstNm: {
      sql: `frst_nm`,
      type: `string`
    },
    
    lstNm: {
      sql: `lst_nm`,
      type: `string`
    },
    
    email: {
      sql: `email`,
      type: `string`
    },
    
    mobile: {
      sql: `mobile`,
      type: `string`
    },
    
    service: {
      sql: `service`,
      type: `string`
    },
    
    crntOrg: {
      sql: `crnt_org`,
      type: `string`
    },
    
    crntJob: {
      sql: `crnt_job`,
      type: `string`
    },
    
    fnctlArea: {
      sql: `fnctl_area`,
      type: `string`
    },
    
    exp: {
      sql: `exp`,
      type: `string`
    },
    
    cmmnts: {
      sql: `cmmnts`,
      type: `string`
    },
    
    addr1: {
      sql: `addr1`,
      type: `string`
    },
    
    addr2: {
      sql: `addr2`,
      type: `string`
    },
    
    location: {
      sql: `location`,
      type: `string`
    },
    
    city: {
      sql: `city`,
      type: `string`
    },
    
    state: {
      sql: `state`,
      type: `string`
    },
    
    pin: {
      sql: `pin`,
      type: `string`
    },
    
    enqType: {
      sql: `enq_type`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
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
