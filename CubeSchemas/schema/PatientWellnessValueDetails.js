cube(`PatientWellnessValueDetails`, {
  sql: `SELECT * FROM ebdb.patient_wellness_value_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PatientMasters: {
      sql: `${CUBE}.patient_master_id = ${PatientMasters}.id`,
      relationship: `belongsTo`
    },
    
    WellnessDataTypeMasters: {
      sql: `${CUBE}.wellness_data_type_master_id = ${WellnessDataTypeMasters}.id`,
      relationship: `belongsTo`
    },
    
    PatientLinkedDeviseDetails: {
      sql: `${CUBE}.patient_linked_devise_detail_id = ${PatientLinkedDeviseDetails}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, updatesJson, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    value: {
      sql: `value`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
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
    
    startTime: {
      sql: `start_time`,
      type: `time`
    },
    
    endTime: {
      sql: `end_time`,
      type: `time`
    },
    
    archivedAt: {
      sql: `archived_at`,
      type: `time`
    },
    
    dummy3: {
      sql: `dummy3`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
