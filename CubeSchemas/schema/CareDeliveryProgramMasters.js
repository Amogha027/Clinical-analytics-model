cube(`CareDeliveryProgramMasters`, {
  sql: `SELECT * FROM ebdb.care_delivery_program_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    ContactDetails: {
      sql: `${CUBE}.contact_detail_id = ${ContactDetails}.id`,
      relationship: `belongsTo`
    },
    
    ReferralContactDetails: {
      sql: `${CUBE}.contact_detail_id = ${ReferralContactDetails}.id`,
      relationship: `belongsTo`
    },
    
    TabContactDetails: {
      sql: `${CUBE}.contact_detail_id = ${TabContactDetails}.contact_detail_id`,
      relationship: `belongsTo`
    },
    
    AddressDetails: {
      sql: `${CUBE}.address_detail_id = ${AddressDetails}.id`,
      relationship: `belongsTo`
    },
    
    OrderAddressDetails: {
      sql: `${CUBE}.address_detail_id = ${OrderAddressDetails}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, name, patientIdFormat, razorpayId, createdAt, updatedAt]
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
    
    desc: {
      sql: `desc`,
      type: `string`
    },
    
    webLogoUrl: {
      sql: `web_logo_url`,
      type: `string`
    },
    
    hmeBgrndImg: {
      sql: `hme_bgrnd_img`,
      type: `string`
    },
    
    appLogoUrl: {
      sql: `app_logo_url`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    patientIdFormat: {
      sql: `patient_id_format`,
      type: `string`
    },
    
    appLinkUrl: {
      sql: `app_link_url`,
      type: `string`
    },
    
    razorpayId: {
      sql: `razorpay_id`,
      type: `string`
    },
    
    domainLink: {
      sql: `domain_link`,
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
    
    archivedAt: {
      sql: `archived_at`,
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
