cube(`RfqInsurancePolicyDetails`, {
  sql: `SELECT * FROM ebdb.rfq_insurance_policy_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    ServiceAgencyMasters: {
      sql: `${CUBE}.service_agency_master_id = ${ServiceAgencyMasters}.id`,
      relationship: `belongsTo`
    },
    
    RfqCorpMasters: {
      sql: `${CUBE}.rfq_corp_master_id = ${RfqCorpMasters}.id`,
      relationship: `belongsTo`
    },
    
    TpaMasters: {
      sql: `${CUBE}.tpa_master_id = ${TpaMasters}.id`,
      relationship: `belongsTo`
    },
    
    Users: {
      sql: `${CUBE}.user_id = ${Users}.id`,
      relationship: `belongsTo`
    },
    
    InsuranceFamilyCoverageMasters: {
      sql: `${CUBE}.insurance_family_coverage_master_id = ${InsuranceFamilyCoverageMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, createdAt, updatedAt, policyStartDate, policyEndDate]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    reqSumInsured: {
      sql: `req_sum_insured`,
      type: `string`
    },
    
    pastPolicyYear: {
      sql: `past_policy_year`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    casesForCorpBuff: {
      sql: `cases_for_corp_buff`,
      type: `string`
    },
    
    sumInsuredType: {
      sql: `sum_insured_type`,
      type: `string`
    },
    
    eERelnNoDescription: {
      sql: `e_e_reln_no_description`,
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
