cube(`ImageDetails`, {
  sql: `SELECT * FROM ebdb.image_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PatientMasters: {
      sql: `${CUBE}.patient_master_id = ${PatientMasters}.id`,
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
    
    PatientPrescriptionHeaders: {
      sql: `${CUBE}.patient_prescription_header_id = ${PatientPrescriptionHeaders}.id`,
      relationship: `belongsTo`
    },
    
    PatientLabresultHeaders: {
      sql: `${CUBE}.patient_labresult_header_id = ${PatientLabresultHeaders}.id`,
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
    
    RfqInsurancePolicyDetails: {
      sql: `${CUBE}.insurance_policy_detail_id = ${RfqInsurancePolicyDetails}.id`,
      relationship: `belongsTo`
    },
    
    InsurancePolicyDetails: {
      sql: `${CUBE}.insurance_policy_detail_id = ${InsurancePolicyDetails}.id`,
      relationship: `belongsTo`
    },
    
    PatientMessages: {
      sql: `${CUBE}.patient_message_id = ${PatientMessages}.id`,
      relationship: `belongsTo`
    },
    
    DieticianVisits: {
      sql: `${CUBE}.dietician_visit_id = ${DieticianVisits}.id`,
      relationship: `belongsTo`
    },
    
    PrescriptionSaleOrderHeaders: {
      sql: `${CUBE}.sale_order_header_id = ${PrescriptionSaleOrderHeaders}.sale_order_header_id`,
      relationship: `belongsTo`
    },
    
    SaleOrderHeaders: {
      sql: `${CUBE}.sale_order_header_id = ${SaleOrderHeaders}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, imgName, updatesJson, createdAt, updatedAt, uploadDate]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    imgUrl: {
      sql: `img_url`,
      type: `string`
    },
    
    imgType: {
      sql: `img_type`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    imgName: {
      sql: `img_name`,
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
    
    uploadDate: {
      sql: `upload_date`,
      type: `time`
    },
    
    dummy3: {
      sql: `dummy3`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
