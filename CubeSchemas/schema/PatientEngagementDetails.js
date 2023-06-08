cube(`PatientEngagementDetails`, {
  sql: `SELECT * FROM ebdb.patient_engagement_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PatientMasters: {
      sql: `${CUBE}.patient_master_id = ${PatientMasters}.id`,
      relationship: `belongsTo`
    },
    
    Activities: {
      sql: `${CUBE}.activity_id = ${Activities}.id`,
      relationship: `belongsTo`
    },
    
    GlobalStatusMasters: {
      sql: `${CUBE}.global_status_master_id = ${GlobalStatusMasters}.id`,
      relationship: `belongsTo`
    },
    
    PatientMessageDetails: {
      sql: `${CUBE}.patient_message_detail_id = ${PatientMessageDetails}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, updatesJson, createdAt, updatedAt, engagementDateTime, prfrdFollowupDateTime]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    activityType: {
      sql: `activity_type`,
      type: `string`
    },
    
    engmntMethod: {
      sql: `engmnt_method`,
      type: `string`
    },
    
    notes: {
      sql: `notes`,
      type: `string`
    },
    
    prfrdFollowupMethod: {
      sql: `prfrd_followup_method`,
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
    
    engagementDateTime: {
      sql: `engagement_date_time`,
      type: `time`
    },
    
    prfrdFollowupDateTime: {
      sql: `prfrd_followup_date_time`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
