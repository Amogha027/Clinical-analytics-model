cube(`TranslationWordDetails`, {
  sql: `SELECT * FROM ebdb.translation_word_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    TranslationWordMasters: {
      sql: `${CUBE}.translation_word_master_id = ${TranslationWordMasters}.id`,
      relationship: `belongsTo`
    },
    
    LanguageMasters: {
      sql: `${CUBE}.language_master_id = ${LanguageMasters}.id`,
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
    
    transltdWord: {
      sql: `transltd_word`,
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
