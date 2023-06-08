cube(`ScreeningCampSaathis`, {
  sql: `SELECT * FROM ebdb.screening_camp_saathis`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    ScreeningCampMasters: {
      sql: `${CUBE}.screening_camp_master_id = ${ScreeningCampMasters}.id`,
      relationship: `belongsTo`
    },
    
    SaathiMasters: {
      sql: `${CUBE}.saathi_master_id = ${SaathiMasters}.id`,
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
