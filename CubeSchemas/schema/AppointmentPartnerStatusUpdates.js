cube(`AppointmentPartnerStatusUpdates`, {
  sql: `SELECT * FROM ebdb.appointment_partner_status_updates`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    Users: {
      sql: `${CUBE}.user_id = ${Users}.id`,
      relationship: `belongsTo`
    },
    
    AppointmentTrackings: {
      sql: `${CUBE}.appointment_tracking_id = ${AppointmentTrackings}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, createdAt, updatedAt, date]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    cmmts: {
      sql: `cmmts`,
      type: `string`
    },
    
    status: {
      sql: `status`,
      type: `string`
    },
    
    jsonResp: {
      sql: `json_resp`,
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
    
    date: {
      sql: `date`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
