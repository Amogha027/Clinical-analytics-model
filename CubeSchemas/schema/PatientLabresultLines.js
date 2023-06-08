cube(`PatientLabresultLines`, {
  sql: `SELECT * FROM ebdb.patient_labresult_lines`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PatientLabresultHeaders: {
      sql: `${CUBE}.patient_labresult_header_id = ${PatientLabresultHeaders}.id`,
      relationship: `belongsTo`
    },
    
    PatientMasters: {
      sql: `${CUBE}.patient_master_id = ${PatientMasters}.id`,
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
    
    DiagnosticLabMasters: {
      sql: `${CUBE}.diagnostic_lab_master_id = ${DiagnosticLabMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, updatesJson, createdAt, updatedAt, testDate]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    barcode: {
      sql: `barcode`,
      type: `string`
    },
    
    status: {
      sql: `status`,
      type: `string`
    },
    
    resultValue: {
      sql: `result_value`,
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
    
    testDate: {
      sql: `test_date`,
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
    
    deliveredAt: {
      sql: `delivered_at`,
      type: `time`
    },
    
    rprtRcvdAt: {
      sql: `rprt_rcvd_at`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
