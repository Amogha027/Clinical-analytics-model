cube(`DoctorFavouritePrescriptions`, {
  sql: `SELECT * FROM ebdb.doctor_favourite_prescriptions`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    DoctorMasters: {
      sql: `${CUBE}.doctor_master_id = ${DoctorMasters}.id`,
      relationship: `belongsTo`
    },
    
    ClaimStatusMasters: {
      sql: `${CUBE}.status_master_id = ${ClaimStatusMasters}.id`,
      relationship: `belongsTo`
    },
    
    DeliveryStatusMasters: {
      sql: `${CUBE}.status_master_id = ${DeliveryStatusMasters}.id`,
      relationship: `belongsTo`
    },
    
    GlobalStatusMasters: {
      sql: `${CUBE}.status_master_id = ${GlobalStatusMasters}.id`,
      relationship: `belongsTo`
    },
    
    OrderCartStatusMasters: {
      sql: `${CUBE}.status_master_id = ${OrderCartStatusMasters}.id`,
      relationship: `belongsTo`
    },
    
    StatusMasters: {
      sql: `${CUBE}.status_master_id = ${StatusMasters}.id`,
      relationship: `belongsTo`
    },
    
    UserSelfrecordtestDetails: {
      sql: `${CUBE}.user_selfrecordtest_detail_id = ${UserSelfrecordtestDetails}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, favName, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    favName: {
      sql: `fav_name`,
      type: `string`
    },
    
    disease: {
      sql: `disease`,
      type: `string`
    },
    
    symptoms: {
      sql: `symptoms`,
      type: `string`
    },
    
    diagnosis: {
      sql: `diagnosis`,
      type: `string`
    },
    
    recommendedLabs: {
      sql: `recommended_labs`,
      type: `string`
    },
    
    cmmts: {
      sql: `cmmts`,
      type: `string`
    },
    
    referralReason: {
      sql: `referral_reason`,
      type: `string`
    },
    
    refDoctorSpecialisation: {
      sql: `ref_doctor_specialisation`,
      type: `string`
    },
    
    healthHistory: {
      sql: `health_history`,
      type: `string`
    },
    
    accompaniedWith: {
      sql: `accompanied_with`,
      type: `string`
    },
    
    packagesOrSurgeries: {
      sql: `packages_or_surgeries`,
      type: `string`
    },
    
    nxtVstDurType: {
      sql: `nxt_vst_dur_type`,
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
    
    nextVisitDt: {
      sql: `next_visit_dt`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
