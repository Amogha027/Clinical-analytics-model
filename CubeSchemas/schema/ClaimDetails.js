cube(`ClaimDetails`, {
  sql: `SELECT * FROM ebdb.claim_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    InsurancePolicyDetails: {
      sql: `${CUBE}.insurance_policy_detail_id = ${InsurancePolicyDetails}.id`,
      relationship: `belongsTo`
    },
    
    RfqInsurancePolicyDetails: {
      sql: `${CUBE}.insurance_policy_detail_id = ${RfqInsurancePolicyDetails}.id`,
      relationship: `belongsTo`
    },
    
    InsuranceCompanyMasters: {
      sql: `${CUBE}.insurance_company_master_id = ${InsuranceCompanyMasters}.id`,
      relationship: `belongsTo`
    },
    
    CorpMasters: {
      sql: `${CUBE}.corp_master_id = ${CorpMasters}.id`,
      relationship: `belongsTo`
    },
    
    RfqCorpMasters: {
      sql: `${CUBE}.corp_master_id = ${RfqCorpMasters}.id`,
      relationship: `belongsTo`
    },
    
    ClaimTypeMasters: {
      sql: `${CUBE}.claim_type_master_id = ${ClaimTypeMasters}.id`,
      relationship: `belongsTo`
    },
    
    ClaimStatusMasters: {
      sql: `${CUBE}.claim_status_master_id = ${ClaimStatusMasters}.id`,
      relationship: `belongsTo`
    },
    
    IcdCodeMasters: {
      sql: `${CUBE}.icd_code_master_id = ${IcdCodeMasters}.id`,
      relationship: `belongsTo`
    },
    
    HospitalMasters: {
      sql: `${CUBE}.hospital_master_id = ${HospitalMasters}.id`,
      relationship: `belongsTo`
    },
    
    PaymentGatewayMasters: {
      sql: `${CUBE}.payment_gateway_master_id = ${PaymentGatewayMasters}.id`,
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
      drillMembers: [id, icName, corpName, employeeName, hospitalName, hospitalCity, createdAt, updatedAt, policyStartDate, policyEndDate, intimationDate, admissionDate, dischargeDate, lastauditdate, utrDate, queryOrRejectionDate]
    },
    
    approvedAmount: {
      sql: `approved_amount`,
      type: `sum`
    },
    
    incurredAmount: {
      sql: `incurred_amount`,
      type: `sum`
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    icName: {
      sql: `ic_name`,
      type: `string`
    },
    
    policyNo: {
      sql: `policy_no`,
      type: `string`
    },
    
    corpName: {
      sql: `corp_name`,
      type: `string`
    },
    
    employeeCode: {
      sql: `employee_code`,
      type: `string`
    },
    
    employeeName: {
      sql: `employee_name`,
      type: `string`
    },
    
    patient: {
      sql: `patient`,
      type: `string`
    },
    
    patientGender: {
      sql: `patient_gender`,
      type: `string`
    },
    
    age: {
      sql: `age`,
      type: `string`
    },
    
    relation: {
      sql: `relation`,
      type: `string`
    },
    
    uhcNo: {
      sql: `uhc_no`,
      type: `string`
    },
    
    insuranceCardNo: {
      sql: `insurance_card_no`,
      type: `string`
    },
    
    claimNo: {
      sql: `claim_no`,
      type: `string`
    },
    
    claimType: {
      sql: `${CUBE}.\`claim_Type\``,
      type: `string`
    },
    
    claimStatus: {
      sql: `claim_status`,
      type: `string`
    },
    
    disease: {
      sql: `disease`,
      type: `string`
    },
    
    icdcode: {
      sql: `icdcode`,
      type: `string`
    },
    
    level1IcdGroup: {
      sql: `level1_icd_group`,
      type: `string`
    },
    
    level2IcdGroup: {
      sql: `level2_icd_group`,
      type: `string`
    },
    
    level3IcdGroup: {
      sql: `level3_icd_group`,
      type: `string`
    },
    
    hospitalName: {
      sql: `hospital_name`,
      type: `string`
    },
    
    hospitalCity: {
      sql: `hospital_city`,
      type: `string`
    },
    
    hospitalState: {
      sql: `hospital_state`,
      type: `string`
    },
    
    utrNo: {
      sql: `utr_no`,
      type: `string`
    },
    
    paymentMode: {
      sql: `payment_mode`,
      type: `string`
    },
    
    paymnetConfirmation: {
      sql: `paymnet_confirmation`,
      type: `string`
    },
    
    floatNo: {
      sql: `float_no`,
      type: `string`
    },
    
    queryOrRejectionReason: {
      sql: `query_or_rejection_reason`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    nhImpactPrcnt: {
      sql: `nh_impact_prcnt`,
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
    
    policyStartDate: {
      sql: `policy_start_date`,
      type: `time`
    },
    
    policyEndDate: {
      sql: `policy_end_date`,
      type: `time`
    },
    
    intimationDate: {
      sql: `intimation_date`,
      type: `time`
    },
    
    admissionDate: {
      sql: `admission_date`,
      type: `time`
    },
    
    dischargeDate: {
      sql: `discharge_date`,
      type: `time`
    },
    
    lastauditdate: {
      sql: `lastauditdate`,
      type: `time`
    },
    
    utrDate: {
      sql: `utr_date`,
      type: `time`
    },
    
    queryOrRejectionDate: {
      sql: `query_or_rejection_date`,
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
