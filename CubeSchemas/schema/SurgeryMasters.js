cube(`SurgeryMasters`, {
  sql: `SELECT * FROM ebdb.surgery_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    ChargeCodeMasters: {
      sql: `${CUBE}.charge_code_master_id = ${ChargeCodeMasters}.id`,
      relationship: `belongsTo`
    },
    
    RoleMasters: {
      sql: `${CUBE}.role_master_id = ${RoleMasters}.id`,
      relationship: `belongsTo`
    },
    
    CustomTemplatePdfDetails: {
      sql: `${CUBE}.custom_template_pdf_detail_id = ${CustomTemplatePdfDetails}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, serviceId, surgeryName, preauthEvidence, claimEvidence, customTemplatePdfDetailId, createdAt, updatedAt]
    },
    
    approxDuration: {
      sql: `approx_duration`,
      type: `sum`
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    icdCode: {
      sql: `icd_code`,
      type: `string`
    },
    
    surgeryByCode: {
      sql: `surgery_by_code`,
      type: `string`
    },
    
    surgerySystem: {
      sql: `surgery_system`,
      type: `string`
    },
    
    surgeryType: {
      sql: `surgery_type`,
      type: `string`
    },
    
    serviceId: {
      sql: `service_id`,
      type: `string`
    },
    
    surgeryName: {
      sql: `surgery_name`,
      type: `string`
    },
    
    preauthEvidence: {
      sql: `preauth_evidence`,
      type: `string`
    },
    
    claimEvidence: {
      sql: `claim_evidence`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    advAdmitHours: {
      sql: `adv_admit_hours`,
      type: `string`
    },
    
    expectedAdmitHours: {
      sql: `expected_admit_hours`,
      type: `string`
    },
    
    hsncode: {
      sql: `hsncode`,
      type: `string`
    },
    
    customTemplatePdfDetailId: {
      sql: `custom_template_pdf_detail_id`,
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
    }
  },
  
  dataSource: `default`
});
