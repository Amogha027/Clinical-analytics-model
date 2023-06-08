cube(`AddressDetails`, {
  sql: `SELECT * FROM ebdb.address_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    Users: {
      sql: `${CUBE}.user_id = ${Users}.id`,
      relationship: `belongsTo`
    },
    
    CityMasters: {
      sql: `${CUBE}.city_master_id = ${CityMasters}.id`,
      relationship: `belongsTo`
    },
    
    RfqCorpMasters: {
      sql: `${CUBE}.corp_master_id = ${RfqCorpMasters}.id`,
      relationship: `belongsTo`
    },
    
    CorpMasters: {
      sql: `${CUBE}.corp_master_id = ${CorpMasters}.id`,
      relationship: `belongsTo`
    },
    
    PatientMasters: {
      sql: `${CUBE}.patient_master_id = ${PatientMasters}.id`,
      relationship: `belongsTo`
    },
    
    DiagnosticLabMasters: {
      sql: `${CUBE}.diagnostic_lab_master_id = ${DiagnosticLabMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, updatesJson, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    addressType: {
      sql: `address_type`,
      type: `string`
    },
    
    addressKind: {
      sql: `address_kind`,
      type: `string`
    },
    
    addressLine1: {
      sql: `address_line1`,
      type: `string`
    },
    
    addressLine2: {
      sql: `address_line2`,
      type: `string`
    },
    
    area: {
      sql: `area`,
      type: `string`
    },
    
    landmark: {
      sql: `landmark`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
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
    
    dummy3: {
      sql: `dummy3`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
