cube(`PatientMasterTrackings`, {
  sql: `SELECT * FROM ebdb.patient_master_trackings`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PatientMasters: {
      sql: `${CUBE}.patient_master_id = ${PatientMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, deviceId, deviceMacId, updatesJson, createdAt, updatedAt, trackDate]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    deviceId: {
      sql: `device_id`,
      type: `string`
    },
    
    deviceMacId: {
      sql: `device_mac_id`,
      type: `string`
    },
    
    signalStrength: {
      sql: `signal_strength`,
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
    
    trackDate: {
      sql: `track_date`,
      type: `time`
    },
    
    capturedTime: {
      sql: `captured_time`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
