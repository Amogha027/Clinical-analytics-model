cube(`ReferralContactDetails`, {
  sql: `SELECT * FROM ebdb.referral_contact_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    ReferralTypeMasters: {
      sql: `${CUBE}.referral_type_master_id = ${ReferralTypeMasters}.id`,
      relationship: `belongsTo`
    },
    
    FacilityTypeMasters: {
      sql: `${CUBE}.facility_type_master_id = ${FacilityTypeMasters}.id`,
      relationship: `belongsTo`
    },
    
    Users: {
      sql: `${CUBE}.user_id = ${Users}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, referralByName, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    referralByName: {
      sql: `referral_by_name`,
      type: `string`
    },
    
    cmmts: {
      sql: `cmmts`,
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
    }
  },
  
  dataSource: `default`
});
