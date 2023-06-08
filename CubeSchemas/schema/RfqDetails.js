cube(`RfqDetails`, {
  sql: `SELECT * FROM ebdb.rfq_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    RfqInsurancePolicyDetails: {
      sql: `${CUBE}.rfq_insurance_policy_detail_id = ${RfqInsurancePolicyDetails}.id`,
      relationship: `belongsTo`
    },
    
    ServiceAgencyInsuranceCompanyMappings: {
      sql: `${CUBE}.service_agency_insurance_company_mapping_id = ${ServiceAgencyInsuranceCompanyMappings}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, createdAt, premiumUpdatedAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    createdAt: {
      sql: `created_at`,
      type: `time`
    },
    
    premiumUpdatedAt: {
      sql: `premium_updated_at`,
      type: `time`
    },
    
    updatedAt: {
      sql: `updated_at`,
      type: `time`
    },
    
    rfqSentAt: {
      sql: `rfq_sent_at`,
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
