cube(`OrderAddressDetails`, {
  sql: `SELECT * FROM ebdb.order_address_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
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
