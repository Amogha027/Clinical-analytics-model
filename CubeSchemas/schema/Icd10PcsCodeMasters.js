cube(`Icd10PcsCodeMasters`, {
  sql: `SELECT * FROM ebdb.icd10_pcs_code_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    ServiceMasters: {
      sql: `${CUBE}.service_master_id = ${ServiceMasters}.id`,
      relationship: `belongsTo`
    },
    
    WebsiteServiceMasters: {
      sql: `${CUBE}.service_master_id = ${WebsiteServiceMasters}.id`,
      relationship: `belongsTo`
    },
    
    ChargeCodeMasters: {
      sql: `${CUBE}.charge_code_master_id = ${ChargeCodeMasters}.id`,
      relationship: `belongsTo`
    },
    
    RoleMasters: {
      sql: `${CUBE}.role_master_id = ${RoleMasters}.id`,
      relationship: `belongsTo`
    },
    
    TaxServiceMappingMasters: {
      sql: `${CUBE}.tax_service_mapping_master_id = ${TaxServiceMappingMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    icd10PcsCode: {
      sql: `icd10_pcs_code`,
      type: `string`
    },
    
    descriptionLong: {
      sql: `description_long`,
      type: `string`
    },
    
    descLevel1: {
      sql: `desc_level1`,
      type: `string`
    },
    
    descLevel2: {
      sql: `desc_level2`,
      type: `string`
    },
    
    descLevel3: {
      sql: `desc_level3`,
      type: `string`
    },
    
    descLevel4: {
      sql: `desc_level4`,
      type: `string`
    },
    
    descLevel5: {
      sql: `desc_level5`,
      type: `string`
    },
    
    descLevel6: {
      sql: `desc_level6`,
      type: `string`
    },
    
    createdAt: {
      sql: `created_at`,
      type: `time`
    },
    
    updatedAt: {
      sql: `updated_at`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
