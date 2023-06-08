cube(`PatientPrescriptionHeaders`, {
  sql: `SELECT * FROM ebdb.patient_prescription_headers`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PatientMasters: {
      sql: `${CUBE}.patient_master_id = ${PatientMasters}.id`,
      relationship: `belongsTo`
    },
    
    InPatientDetails: {
      sql: `${CUBE}.in_patient_detail_id = ${InPatientDetails}.id`,
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
    
    PatientLabresultHeaders: {
      sql: `${CUBE}.patient_labresult_header_id = ${PatientLabresultHeaders}.id`,
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
      drillMembers: [id, updatesJson, comorbidity, createdAt, updatedAt, visitDate]
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
    
    activityType: {
      sql: `activity_type`,
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
    
    cmmts: {
      sql: `cmmts`,
      type: `string`
    },
    
    dummy1: {
      sql: `dummy1`,
      type: `string`
    },
    
    lttd: {
      sql: `lttd`,
      type: `string`
    },
    
    lgtd: {
      sql: `lgtd`,
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
    
    comorbidity: {
      sql: `comorbidity`,
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
    
    createdAt: {
      sql: `created_at`,
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
    
    nextVisitDt: {
      sql: `next_visit_dt`,
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
    
    dummy3: {
      sql: `dummy3`,
      type: `time`
    },
    
    deletedAt: {
      sql: `deleted_at`,
      type: `time`
    },
    
    tbltCrtdAt: {
      sql: `tblt_crtd_at`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
