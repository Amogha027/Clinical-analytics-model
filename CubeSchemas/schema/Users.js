cube(`Users`, {
  sql: `SELECT * FROM ebdb.users`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    UserTypeMasters: {
      sql: `${CUBE}.user_type_master_id = ${UserTypeMasters}.id`,
      relationship: `belongsTo`
    },
    
    UserGroupMasters: {
      sql: `${CUBE}.user_group_master_id = ${UserGroupMasters}.id`,
      relationship: `belongsTo`
    },
    
    ImageDetails: {
      sql: `${CUBE}.image_detail_id = ${ImageDetails}.id`,
      relationship: `belongsTo`
    },
    
    PatientMasters: {
      sql: `${CUBE}.patient_master_id = ${PatientMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, fulname, title, empId, updatesJson, rememberCreatedAt, createdAt, updatedAt]
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
    
    fulname: {
      sql: `fulname`,
      type: `string`
    },
    
    title: {
      sql: `title`,
      type: `string`
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
    
    department: {
      sql: `department`,
      type: `string`
    },
    
    position: {
      sql: `position`,
      type: `string`
    },
    
    empId: {
      sql: `emp_id`,
      type: `string`
    },
    
    mobile: {
      sql: `mobile`,
      type: `string`
    },
    
    role: {
      sql: `role`,
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
    
    confirmationToken: {
      sql: `confirmation_token`,
      type: `string`
    },
    
    unconfirmedEmail: {
      sql: `unconfirmed_email`,
      type: `string`
    },
    
    unlockToken: {
      sql: `unlock_token`,
      type: `string`
    },
    
    authenticationToken: {
      sql: `authentication_token`,
      type: `string`
    },
    
    otpSecretKey: {
      sql: `otp_secret_key`,
      type: `string`
    },
    
    fcmToken: {
      sql: `fcm_token`,
      type: `string`
    },
    
    deviceToken: {
      sql: `device_token`,
      type: `string`
    },
    
    deviceType: {
      sql: `device_type`,
      type: `string`
    },
    
    referralCode: {
      sql: `referral_code`,
      type: `string`
    },
    
    signature: {
      sql: `signature`,
      type: `string`
    },
    
    cntryCode: {
      sql: `cntry_code`,
      type: `string`
    },
    
    updatesJson: {
      sql: `updates_json`,
      type: `string`
    },
    
    webAuthToken: {
      sql: `web_auth_token`,
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
    
    confirmedAt: {
      sql: `confirmed_at`,
      type: `time`
    },
    
    confirmationSentAt: {
      sql: `confirmation_sent_at`,
      type: `time`
    },
    
    lockedAt: {
      sql: `locked_at`,
      type: `time`
    },
    
    trmntnDt: {
      sql: `trmntn_dt`,
      type: `time`
    },
    
    effctvDt: {
      sql: `effctv_dt`,
      type: `time`
    },
    
    archivedAt: {
      sql: `archived_at`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
