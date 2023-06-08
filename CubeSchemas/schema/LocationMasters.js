cube(`LocationMasters`, {
  sql: `SELECT * FROM ebdb.location_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    CityMasters: {
      sql: `${CUBE}.city_master_id = ${CityMasters}.id`,
      relationship: `belongsTo`
    },
    
    ExecutiveMasters: {
      sql: `${CUBE}.executive_master_id = ${ExecutiveMasters}.id`,
      relationship: `belongsTo`
    },
    
    TabletMasters: {
      sql: `${CUBE}.tablet_master_id = ${TabletMasters}.id`,
      relationship: `belongsTo`
    },
    
    AreaMasters: {
      sql: `${CUBE}.area_master_id = ${AreaMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, createdAt, updatedAt, archivedById]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    lctnNm: {
      sql: `lctn_nm`,
      type: `string`
    },
    
    lctnShrtNm: {
      sql: `lctn_shrt_nm`,
      type: `string`
    },
    
    dscrptn: {
      sql: `dscrptn`,
      type: `string`
    },
    
    area: {
      sql: `area`,
      type: `string`
    },
    
    pnCd: {
      sql: `pn_cd`,
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
    
    archivedById: {
      sql: `archived_by_id`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
