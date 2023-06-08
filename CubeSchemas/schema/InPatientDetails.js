cube(`InPatientDetails`, {
  sql: `SELECT * FROM ebdb.in_patient_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PatientMasters: {
      sql: `${CUBE}.patient_master_id = ${PatientMasters}.id`,
      relationship: `belongsTo`
    },
    
    SurgeryMasters: {
      sql: `${CUBE}.surgery_master_id = ${SurgeryMasters}.id`,
      relationship: `belongsTo`
    },
    
    PrescriptionSaleOrderHeaders: {
      sql: `${CUBE}.sale_order_header_id = ${PrescriptionSaleOrderHeaders}.sale_order_header_id`,
      relationship: `belongsTo`
    },
    
    SaleOrderHeaders: {
      sql: `${CUBE}.sale_order_header_id = ${SaleOrderHeaders}.id`,
      relationship: `belongsTo`
    },
    
    ClinicRoomTypeMasters: {
      sql: `${CUBE}.room_type_master_id = ${ClinicRoomTypeMasters}.id`,
      relationship: `belongsTo`
    },
    
    DepartmentMasters: {
      sql: `${CUBE}.department_master_id = ${DepartmentMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, doctorId, therapistId, counsellorId, updatesJson, createdAt, updatedAt]
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
    
    ipNumber: {
      sql: `ip_number`,
      type: `string`
    },
    
    status: {
      sql: `status`,
      type: `string`
    },
    
    roomNo: {
      sql: `room_no`,
      type: `string`
    },
    
    pricePerDay: {
      sql: `price_per_day`,
      type: `string`
    },
    
    anaesthesiaChrge: {
      sql: `anaesthesia_chrge`,
      type: `string`
    },
    
    nursingChrge: {
      sql: `nursing_chrge`,
      type: `string`
    },
    
    referredBy: {
      sql: `referred_by`,
      type: `string`
    },
    
    admittedDays: {
      sql: `admitted_days`,
      type: `string`
    },
    
    consentFormUrl: {
      sql: `consent_form_url`,
      type: `string`
    },
    
    otChrge: {
      sql: `ot_chrge`,
      type: `string`
    },
    
    doctorId: {
      sql: `doctor_id`,
      type: `string`
    },
    
    therapistId: {
      sql: `therapist_id`,
      type: `string`
    },
    
    counsellorId: {
      sql: `counsellor_id`,
      type: `string`
    },
    
    summaryImages: {
      sql: `summary_images`,
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
    
    operationDt: {
      sql: `operation_dt`,
      type: `time`
    },
    
    admissionDt: {
      sql: `admission_dt`,
      type: `time`
    },
    
    dischargeDt: {
      sql: `discharge_dt`,
      type: `time`
    },
    
    archivedAt: {
      sql: `archived_at`,
      type: `time`
    },
    
    plannedOperationDt: {
      sql: `planned_operation_dt`,
      type: `time`
    },
    
    plannedAdmissionDt: {
      sql: `planned_admission_dt`,
      type: `time`
    },
    
    plannedDischargeDt: {
      sql: `planned_discharge_dt`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
