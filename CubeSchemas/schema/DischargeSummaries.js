cube(`DischargeSummaries`, {
  sql: `SELECT * FROM ebdb.discharge_summaries`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    HospitalDoctors: {
      sql: `${CUBE}.hospital_doctor_id = ${HospitalDoctors}.id`,
      relationship: `belongsTo`
    },
    
    HospitalMasters: {
      sql: `${CUBE}.hospital_master_id = ${HospitalMasters}.id`,
      relationship: `belongsTo`
    },
    
    DoctorMasters: {
      sql: `${CUBE}.doctor_master_id = ${DoctorMasters}.id`,
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
    
    PatientPrescriptionHeaders: {
      sql: `${CUBE}.patient_prescription_header_id = ${PatientPrescriptionHeaders}.id`,
      relationship: `belongsTo`
    },
    
    PatientLabresultHeaders: {
      sql: `${CUBE}.patient_labresult_header_id = ${PatientLabresultHeaders}.id`,
      relationship: `belongsTo`
    },
    
    UserSelfrecordtestDetails: {
      sql: `${CUBE}.user_selfrecordtest_detail_id = ${UserSelfrecordtestDetails}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, updatesJson, comorbidity, createdAt, procUpdatedAt, updatedAt, visitDate]
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
    
    disease: {
      sql: `disease`,
      type: `string`
    },
    
    prescriptionImg: {
      sql: `prescription_img`,
      type: `string`
    },
    
    symptoms: {
      sql: `symptoms`,
      type: `string`
    },
    
    diagnosis: {
      sql: `diagnosis`,
      type: `string`
    },
    
    recommendedLabs: {
      sql: `recommended_labs`,
      type: `string`
    },
    
    packagesOrSurgeries: {
      sql: `packages_or_surgeries`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    saathiAccompanied: {
      sql: `saathi_accompanied`,
      type: `string`
    },
    
    cmmts: {
      sql: `cmmts`,
      type: `string`
    },
    
    referralReason: {
      sql: `referral_reason`,
      type: `string`
    },
    
    refDoctorSpecialisation: {
      sql: `ref_doctor_specialisation`,
      type: `string`
    },
    
    accompaniedWith: {
      sql: `accompanied_with`,
      type: `string`
    },
    
    healthHistory: {
      sql: `health_history`,
      type: `string`
    },
    
    updatesJson: {
      sql: `updates_json`,
      type: `string`
    },
    
    provisionalDiagnosis: {
      sql: `provisional_diagnosis`,
      type: `string`
    },
    
    courseOrTreatment: {
      sql: `course_or_treatment`,
      type: `string`
    },
    
    conditionOnDischarge: {
      sql: `condition_on_discharge`,
      type: `string`
    },
    
    adviceOnDischarge: {
      sql: `advice_on_discharge`,
      type: `string`
    },
    
    comorbidity: {
      sql: `comorbidity`,
      type: `string`
    },
    
    createdAt: {
      sql: `created_at`,
      type: `time`
    },
    
    procUpdatedAt: {
      sql: `proc_updated_at`,
      type: `time`
    },
    
    updatedAt: {
      sql: `updated_at`,
      type: `time`
    },
    
    visitDate: {
      sql: `visit_date`,
      type: `time`
    },
    
    dummy3: {
      sql: `dummy3`,
      type: `time`
    },
    
    tbltCrtdAt: {
      sql: `tblt_crtd_at`,
      type: `time`
    },
    
    nextVisitDt: {
      sql: `next_visit_dt`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
