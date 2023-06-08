cube(`PatientTestRecommendationDetails`, {
  sql: `SELECT * FROM ebdb.patient_test_recommendation_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    RecommendationTypeMasters: {
      sql: `${CUBE}.recommendation_type_master_id = ${RecommendationTypeMasters}.id`,
      relationship: `belongsTo`
    },
    
    DiagnosticTestMasters: {
      sql: `${CUBE}.diagnostic_test_master_id = ${DiagnosticTestMasters}.id`,
      relationship: `belongsTo`
    },
    
    DieticianFavouriteDiagnosticTestMasters: {
      sql: `${CUBE}.diagnostic_test_master_id = ${DieticianFavouriteDiagnosticTestMasters}.diagnostic_test_master_id`,
      relationship: `belongsTo`
    },
    
    DoctorFavouriteDiagnosticTestMasters: {
      sql: `${CUBE}.diagnostic_test_master_id = ${DoctorFavouriteDiagnosticTestMasters}.diagnostic_test_master_id`,
      relationship: `belongsTo`
    },
    
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
    },
    
    Activities: {
      sql: `${CUBE}.activity_id = ${Activities}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, logicIds, updatesJson, createdAt, updatedAt, startDate, endDate, scheduleStartDate, scheduleEndDate]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    lvl2SourceTable: {
      sql: `lvl2_source_table`,
      type: `string`
    },
    
    status: {
      sql: `status`,
      type: `string`
    },
    
    sourceInfo: {
      sql: `source_info`,
      type: `string`
    },
    
    logicIds: {
      sql: `logic_ids`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    activityCode: {
      sql: `activity_code`,
      type: `string`
    },
    
    cmmnt: {
      sql: `cmmnt`,
      type: `string`
    },
    
    scheduleType: {
      sql: `schedule_type`,
      type: `string`
    },
    
    riskDescription: {
      sql: `risk_description`,
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
    
    startDate: {
      sql: `start_date`,
      type: `time`
    },
    
    endDate: {
      sql: `end_date`,
      type: `time`
    },
    
    dummy3: {
      sql: `dummy3`,
      type: `time`
    },
    
    scheduleStartDate: {
      sql: `schedule_start_date`,
      type: `time`
    },
    
    scheduleEndDate: {
      sql: `schedule_end_date`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
