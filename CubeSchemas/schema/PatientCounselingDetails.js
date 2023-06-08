cube(`PatientCounselingDetails`, {
  sql: `SELECT * FROM ebdb.patient_counseling_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    LocationMasters: {
      sql: `${CUBE}.location_master_id = ${LocationMasters}.id`,
      relationship: `belongsTo`
    },
    
    UserActivityDetails: {
      sql: `${CUBE}.activity_detail_id = ${UserActivityDetails}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, ptntRgstrtnId, createdAt, updatedAt]
    },
    
    duration: {
      sql: `duration`,
      type: `sum`
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    ptntRgstrtnId: {
      sql: `ptnt_rgstrtn_id`,
      type: `string`
    },
    
    screenType: {
      sql: `screen_type`,
      type: `string`
    },
    
    timeSpentOn: {
      sql: `time_spent_on`,
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
    
    dummy3: {
      sql: `dummy3`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
