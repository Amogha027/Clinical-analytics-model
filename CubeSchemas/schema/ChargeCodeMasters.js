cube(`ChargeCodeMasters`, {
  sql: `SELECT * FROM ebdb.charge_code_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    HealthSystemMasters: {
      sql: `${CUBE}.health_system_master_id = ${HealthSystemMasters}.id`,
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
    
    chargeCode: {
      sql: `charge_code`,
      type: `string`
    },
    
    chargeCodeDesc: {
      sql: `charge_code_desc`,
      type: `string`
    },
    
    parentChargeCode: {
      sql: `parent_charge_code`,
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
