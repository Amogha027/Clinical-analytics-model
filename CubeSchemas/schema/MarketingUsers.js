cube(`MarketingUsers`, {
  sql: `SELECT * FROM ebdb.marketing_users`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, rememberCreatedAt, createdAt, updatedAt]
    },
    
    signInCount: {
      sql: `sign_in_count`,
      type: `sum`
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
    
    gender: {
      sql: `gender`,
      type: `string`
    },
    
    location: {
      sql: `location`,
      type: `string`
    },
    
    mobile: {
      sql: `mobile`,
      type: `string`
    },
    
    designation: {
      sql: `designation`,
      type: `string`
    },
    
    prflShtDesc: {
      sql: `prfl_sht_desc`,
      type: `string`
    },
    
    prflFulDesc: {
      sql: `prfl_ful_desc`,
      type: `string`
    },
    
    role: {
      sql: `role`,
      type: `string`
    },
    
    pflImgUrl: {
      sql: `pfl_img_url`,
      type: `string`
    },
    
    email: {
      sql: `email`,
      type: `string`
    },
    
    encryptedPassword: {
      sql: `encrypted_password`,
      type: `string`
    },
    
    resetPasswordToken: {
      sql: `reset_password_token`,
      type: `string`
    },
    
    currentSignInIp: {
      sql: `current_sign_in_ip`,
      type: `string`
    },
    
    lastSignInIp: {
      sql: `last_sign_in_ip`,
      type: `string`
    },
    
    authenticationToken: {
      sql: `authentication_token`,
      type: `string`
    },
    
    rememberCreatedAt: {
      sql: `remember_created_at`,
      type: `time`
    },
    
    createdAt: {
      sql: `created_at`,
      type: `time`
    },
    
    updatedAt: {
      sql: `updated_at`,
      type: `time`
    },
    
    resetPasswordSentAt: {
      sql: `reset_password_sent_at`,
      type: `time`
    },
    
    currentSignInAt: {
      sql: `current_sign_in_at`,
      type: `time`
    },
    
    lastSignInAt: {
      sql: `last_sign_in_at`,
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
    
    effctvDt: {
      sql: `effctv_dt`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
