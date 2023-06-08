cube(`DieticianMasters`, {
  sql: `SELECT * FROM ebdb.dietician_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    Users: {
      sql: `${CUBE}.user_id = ${Users}.id`,
      relationship: `belongsTo`
    },
    
    ImageDetails: {
      sql: `${CUBE}.image_detail_id = ${ImageDetails}.id`,
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
      drillMembers: [id, vitalQuestionIds, createdAt, updatedAt]
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
    
    dsplyNm: {
      sql: `dsply_nm`,
      type: `string`
    },
    
    gender: {
      sql: `gender`,
      type: `string`
    },
    
    rgstrtnNo: {
      sql: `rgstrtn_no`,
      type: `string`
    },
    
    qualification: {
      sql: `qualification`,
      type: `string`
    },
    
    nmbr: {
      sql: `nmbr`,
      type: `string`
    },
    
    phnNmbrTyp: {
      sql: `phn_nmbr_typ`,
      type: `string`
    },
    
    nanohealthEmp: {
      sql: `nanohealth_emp`,
      type: `string`
    },
    
    signature: {
      sql: `signature`,
      type: `string`
    },
    
    cmmts: {
      sql: `cmmts`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    email: {
      sql: `email`,
      type: `string`
    },
    
    cntryCode: {
      sql: `cntry_code`,
      type: `string`
    },
    
    vitalQuestionIds: {
      sql: `vital_question_ids`,
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
    
    effctvStartDt: {
      sql: `effctv_start_dt`,
      type: `time`
    },
    
    trmntnDt: {
      sql: `trmntn_dt`,
      type: `time`
    },
    
    dummy3: {
      sql: `dummy3`,
      type: `time`
    },
    
    deletedAt: {
      sql: `deleted_at`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
