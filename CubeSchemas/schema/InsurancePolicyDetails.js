cube(`InsurancePolicyDetails`, {
  sql: `SELECT * FROM ebdb.insurance_policy_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    InsurancePolicyClassMasters: {
      sql: `${CUBE}.insurance_policy_class_master_id = ${InsurancePolicyClassMasters}.id`,
      relationship: `belongsTo`
    },
    
    InsuranceCompanyMasters: {
      sql: `${CUBE}.insurance_company_master_id = ${InsuranceCompanyMasters}.id`,
      relationship: `belongsTo`
    },
    
    ServiceAgencyMasters: {
      sql: `${CUBE}.service_agency_master_id = ${ServiceAgencyMasters}.id`,
      relationship: `belongsTo`
    },
    
    InsuranceGroupMasters: {
      sql: `${CUBE}.insurance_group_master_id = ${InsuranceGroupMasters}.id`,
      relationship: `belongsTo`
    },
    
    TpaMasters: {
      sql: `${CUBE}.tpa_master_id = ${TpaMasters}.id`,
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
    
    Users: {
      sql: `${CUBE}.user_id = ${Users}.id`,
      relationship: `belongsTo`
    },
    
    InsuranceFamilyCoverageMasters: {
      sql: `${CUBE}.insurance_family_coverage_master_id = ${InsuranceFamilyCoverageMasters}.id`,
      relationship: `belongsTo`
    },
    
    PatientMasters: {
      sql: `${CUBE}.patient_master_id = ${PatientMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, idCard, updatesJson, createdAt, updatedAt, policyStartDate, policyEndDate, claimExtractDate]
    },
    
    premiumAmount: {
      sql: `premium_amount`,
      type: `sum`
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    policyNo: {
      sql: `policy_no`,
      type: `string`
    },
    
    notes: {
      sql: `notes`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    reqSumInsured: {
      sql: `req_sum_insured`,
      type: `string`
    },
    
    sumInsuredType: {
      sql: `sum_insured_type`,
      type: `string`
    },
    
    siForCorpBuff: {
      sql: `si_for_corp_buff`,
      type: `string`
    },
    
    casesForCorpBuff: {
      sql: `cases_for_corp_buff`,
      type: `string`
    },
    
    premium: {
      sql: `premium`,
      type: `string`
    },
    
    eERelnNoDescription: {
      sql: `e_e_reln_no_description`,
      type: `string`
    },
    
    idCard: {
      sql: `id_card`,
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
    
    policyStartDate: {
      sql: `policy_start_date`,
      type: `time`
    },
    
    policyEndDate: {
      sql: `policy_end_date`,
      type: `time`
    },
    
    effctvDt: {
      sql: `effctv_dt`,
      type: `time`
    },
    
    trmntnDt: {
      sql: `trmntn_dt`,
      type: `time`
    },
    
    archivedAt: {
      sql: `archived_at`,
      type: `time`
    },
    
    dummy3: {
      sql: `dummy3`,
      type: `time`
    },
    
    claimExtractDate: {
      sql: `claim_extract_date`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
