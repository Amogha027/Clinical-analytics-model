cube(`PatientLinkedDeviseDetails`, {
  sql: `SELECT * FROM ebdb.patient_linked_devise_details`,
  
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
      drillMembers: [id, mobileUniqueId, sourceName, updatesJson, createdAt, updatedAt, effctvStartDate, effctvEndDate]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    mobileUniqueId: {
      sql: `mobile_unique_id`,
      type: `string`
    },
    
    sourceName: {
      sql: `source_name`,
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
    
    effctvStartDate: {
      sql: `effctv_start_date`,
      type: `time`
    },
    
    effctvEndDate: {
      sql: `effctv_end_date`,
      type: `time`
    },
    
    archivedAt: {
      sql: `archived_at`,
      type: `time`
    },
    
    lastSyncedTime: {
      sql: `last_synced_time`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
