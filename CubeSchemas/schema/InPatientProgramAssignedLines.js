cube(`InPatientProgramAssignedLines`, {
  sql: `SELECT * FROM ebdb.in_patient_program_assigned_lines`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PatientMasters: {
      sql: `${CUBE}.patient_master_id = ${PatientMasters}.id`,
      relationship: `belongsTo`
    },
    
    ServiceMasters: {
      sql: `${CUBE}.service_master_id = ${ServiceMasters}.id`,
      relationship: `belongsTo`
    },
    
    WebsiteServiceMasters: {
      sql: `${CUBE}.service_master_id = ${WebsiteServiceMasters}.id`,
      relationship: `belongsTo`
    },
    
    UserActivityDetails: {
      sql: `${CUBE}.activity_detail_id = ${UserActivityDetails}.id`,
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
      drillMembers: [id, createdAt, updatedAt, scheduleDateTime, actualDateTime]
    },
    
    interactionCount: {
      sql: `interaction_count`,
      type: `sum`
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    status: {
      sql: `status`,
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
    
    scheduleDateTime: {
      sql: `schedule_date_time`,
      type: `time`
    },
    
    actualDateTime: {
      sql: `actual_date_time`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
