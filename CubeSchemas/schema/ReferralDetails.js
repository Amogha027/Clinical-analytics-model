cube(`ReferralDetails`, {
  sql: `SELECT * FROM ebdb.referral_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PatientMasters: {
      sql: `${CUBE}.patient_master_id = ${PatientMasters}.id`,
      relationship: `belongsTo`
    },
    
    ReferralContactDetails: {
      sql: `${CUBE}.referral_contact_detail_id = ${ReferralContactDetails}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, updatesJson, createdAt, updatedAt, referredDate]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    referredFor: {
      sql: `referred_for`,
      type: `string`
    },
    
    status: {
      sql: `status`,
      type: `string`
    },
    
    source: {
      sql: `source`,
      type: `string`
    },
    
    updatesJson: {
      sql: `updates_json`,
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
    
    referredDate: {
      sql: `referred_date`,
      type: `time`
    },
    
    archivedAt: {
      sql: `archived_at`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
