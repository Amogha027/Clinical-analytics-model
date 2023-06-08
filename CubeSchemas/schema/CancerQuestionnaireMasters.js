cube(`CancerQuestionnaireMasters`, {
  sql: `SELECT * FROM ebdb.cancer_questionnaire_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    DieticianFavouriteSymptomsDiseaseMasters: {
      sql: `${CUBE}.disease_master_id = ${DieticianFavouriteSymptomsDiseaseMasters}.disease_master_id`,
      relationship: `belongsTo`
    },
    
    DiseaseMasters: {
      sql: `${CUBE}.disease_master_id = ${DiseaseMasters}.id`,
      relationship: `belongsTo`
    },
    
    DoctorFavouriteSymptomsDiseaseMasters: {
      sql: `${CUBE}.disease_master_id = ${DoctorFavouriteSymptomsDiseaseMasters}.disease_master_id`,
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
    
    q1: {
      sql: `q1`,
      type: `string`
    },
    
    q2: {
      sql: `q2`,
      type: `string`
    },
    
    q3: {
      sql: `q3`,
      type: `string`
    },
    
    q4: {
      sql: `q4`,
      type: `string`
    },
    
    q5: {
      sql: `q5`,
      type: `string`
    },
    
    q6: {
      sql: `q6`,
      type: `string`
    },
    
    q7: {
      sql: `q7`,
      type: `string`
    },
    
    q8: {
      sql: `q8`,
      type: `string`
    },
    
    q9: {
      sql: `q9`,
      type: `string`
    },
    
    q10: {
      sql: `q10`,
      type: `string`
    },
    
    q11: {
      sql: `q11`,
      type: `string`
    },
    
    q12: {
      sql: `q12`,
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
    }
  },
  
  dataSource: `default`
});
