cube(`CityMasters`, {
  sql: `SELECT * FROM ebdb.city_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    StateMasters: {
      sql: `${CUBE}.state_master_id = ${StateMasters}.id`,
      relationship: `belongsTo`
    },
    
    DistrictMasters: {
      sql: `${CUBE}.district_master_id = ${DistrictMasters}.id`,
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
    
    ctyNm: {
      sql: `cty_nm`,
      type: `string`
    },
    
    ctyShrtNm: {
      sql: `cty_shrt_nm`,
      type: `string`
    },
    
    distNm: {
      sql: `dist_nm`,
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
    
    archivedAt: {
      sql: `archived_at`,
      type: `time`
    },
    
    effctvDt: {
      sql: `effctv_dt`,
      type: `time`
    },
    
    trmntnDt: {
      sql: `trmntn_dt`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
