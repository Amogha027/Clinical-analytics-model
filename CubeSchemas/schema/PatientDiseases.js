cube(`PatientDiseases`, {
  sql: `SELECT * FROM ebdb.patient_diseases`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PatientMasters: {
      sql: `${CUBE}.patient_master_id = ${PatientMasters}.id`,
      relationship: `belongsTo`
    },
    
    DieticianFavouriteSymptomsDiseaseMasters: {
      sql: `${CUBE}.disease_master_id = ${DieticianFavouriteSymptomsDiseaseMasters}.disease_master_id`,
      relationship: `belongsTo`
    },
    
    DiseaseMasters: {
      sql: `${CUBE}.disease_master_id = ${DiseaseMasters}.id`,
      relationship: `belongsTo`
    },
    
    DoctorFavouriteSymptomsDiseaseMasters: {
      sql: `${CUBE}.disease_master_id = ${DoctorFavouriteSymptomsDiseaseMasters}.disease_master_id`,
      relationship: `belongsTo`
    },
    
    PatientPrescriptionHeaders: {
      sql: `${CUBE}.patient_prescription_header_id = ${PatientPrescriptionHeaders}.id`,
      relationship: `belongsTo`
    },
    
    ClaimStatusMasters: {
      sql: `${CUBE}.status_master_id = ${ClaimStatusMasters}.id`,
      relationship: `belongsTo`
    },
    
    DeliveryStatusMasters: {
      sql: `${CUBE}.status_master_id = ${DeliveryStatusMasters}.id`,
      relationship: `belongsTo`
    },
    
    GlobalStatusMasters: {
      sql: `${CUBE}.status_master_id = ${GlobalStatusMasters}.id`,
      relationship: `belongsTo`
    },
    
    OrderCartStatusMasters: {
      sql: `${CUBE}.status_master_id = ${OrderCartStatusMasters}.id`,
      relationship: `belongsTo`
    },
    
    StatusMasters: {
      sql: `${CUBE}.status_master_id = ${StatusMasters}.id`,
      relationship: `belongsTo`
    },
    
    BreastCancerScreeningDetails: {
      sql: `${CUBE}.screening_detail_id = ${BreastCancerScreeningDetails}.screening_detail_id`,
      relationship: `belongsTo`
    },
    
    CervicalCancerScreeningDetails: {
      sql: `${CUBE}.screening_detail_id = ${CervicalCancerScreeningDetails}.screening_detail_id`,
      relationship: `belongsTo`
    },
    
    OralCancerScreeningDetails: {
      sql: `${CUBE}.screening_detail_id = ${OralCancerScreeningDetails}.screening_detail_id`,
      relationship: `belongsTo`
    },
    
    ProstateCancerScreeningDetails: {
      sql: `${CUBE}.screening_detail_id = ${ProstateCancerScreeningDetails}.screening_detail_id`,
      relationship: `belongsTo`
    },
    
    DoctorVisits: {
      sql: `${CUBE}.doctor_visit_id = ${DoctorVisits}.id`,
      relationship: `belongsTo`
    },
    
    TempDoctorVisits: {
      sql: `${CUBE}.doctor_visit_id = ${TempDoctorVisits}.id`,
      relationship: `belongsTo`
    },
    
    IcdCmCodeMasters: {
      sql: `${CUBE}.icd_cm_code_master_id = ${IcdCmCodeMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, updatesJson, createdAt, updatedAt, procUpdatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
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
    
    procUpdatedAt: {
      sql: `proc_updated_at`,
      type: `time`
    },
    
    tbltCrtdAt: {
      sql: `tblt_crtd_at`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
