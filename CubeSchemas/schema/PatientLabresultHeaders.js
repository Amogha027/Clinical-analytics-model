cube(`PatientLabresultHeaders`, {
  sql: `SELECT * FROM ebdb.patient_labresult_headers`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    DiagnosticLabMasters: {
      sql: `${CUBE}.diagnostic_lab_master_id = ${DiagnosticLabMasters}.id`,
      relationship: `belongsTo`
    },
    
    PatientMasters: {
      sql: `${CUBE}.patient_master_id = ${PatientMasters}.id`,
      relationship: `belongsTo`
    },
    
    LocationMasters: {
      sql: `${CUBE}.location_master_id = ${LocationMasters}.id`,
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
    
    AppointmentTrackings: {
      sql: `${CUBE}.appointment_tracking_id = ${AppointmentTrackings}.id`,
      relationship: `belongsTo`
    },
    
    DoctorVisits: {
      sql: `${CUBE}.doctor_visit_id = ${DoctorVisits}.id`,
      relationship: `belongsTo`
    },
    
    TempDoctorVisits: {
      sql: `${CUBE}.doctor_visit_id = ${TempDoctorVisits}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, thyrocareId, updatesJson, createdAt, updatedAt, testDate]
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
    
    barCode: {
      sql: `bar_code`,
      type: `string`
    },
    
    status: {
      sql: `status`,
      type: `string`
    },
    
    cmmts: {
      sql: `cmmts`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    thyrocareId: {
      sql: `thyrocare_id`,
      type: `string`
    },
    
    uploadType: {
      sql: `upload_type`,
      type: `string`
    },
    
    refferedBy: {
      sql: `reffered_by`,
      type: `string`
    },
    
    deliveryCharges: {
      sql: `delivery_charges`,
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
    
    testDate: {
      sql: `test_date`,
      type: `time`
    },
    
    digitalizedAt: {
      sql: `digitalized_at`,
      type: `time`
    },
    
    approvedAt: {
      sql: `approved_at`,
      type: `time`
    },
    
    deletedAt: {
      sql: `deleted_at`,
      type: `time`
    },
    
    dummy3: {
      sql: `dummy3`,
      type: `time`
    },
    
    smplClctdAt: {
      sql: `smpl_clctd_at`,
      type: `time`
    },
    
    woeAt: {
      sql: `woe_at`,
      type: `time`
    },
    
    deliveredAt: {
      sql: `delivered_at`,
      type: `time`
    },
    
    rprtRcvdAt: {
      sql: `rprt_rcvd_at`,
      type: `time`
    },
    
    tbltCrtdAt: {
      sql: `tblt_crtd_at`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
