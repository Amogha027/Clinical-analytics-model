cube(`RfqInsurancePolicyPasts`, {
  sql: `SELECT * FROM ebdb.rfq_insurance_policy_pasts`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    RfqInsurancePolicyDetails: {
      sql: `${CUBE}.rfq_insurance_policy_detail_id = ${RfqInsurancePolicyDetails}.id`,
      relationship: `belongsTo`
    },
    
    InsuranceGroupMasters: {
      sql: `${CUBE}.insurance_group_master_id = ${InsuranceGroupMasters}.id`,
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
    },
    
    premiumAmount: {
      sql: `premium_amount`,
      type: `sum`
    },
    
    policyDuration: {
      sql: `policy_duration`,
      type: `sum`
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    pastPolicyNo: {
      sql: `past_policy_no`,
      type: `string`
    },
    
    year: {
      sql: `year`,
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
    
    sumInsuredType: {
      sql: `sum_insured_type`,
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
    },
    
    lastClaimDt: {
      sql: `last_claim_dt`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
