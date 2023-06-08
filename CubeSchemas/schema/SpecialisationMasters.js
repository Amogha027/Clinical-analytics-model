cube(`SpecialisationMasters`, {
  sql: `SELECT * FROM ebdb.specialisation_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    FormMasters: {
      sql: `${CUBE}.form_master_id = ${FormMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, vitalQuestionIds, metaTitle, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    specialisationCode: {
      sql: `specialisation_code`,
      type: `string`
    },
    
    specialisationDesc: {
      sql: `specialisation_desc`,
      type: `string`
    },
    
    specialist: {
      sql: `specialist`,
      type: `string`
    },
    
    iconImg: {
      sql: `icon_img`,
      type: `string`
    },
    
    vitalQuestionIds: {
      sql: `vital_question_ids`,
      type: `string`
    },
    
    symptoms: {
      sql: `symptoms`,
      type: `string`
    },
    
    metaTitle: {
      sql: `meta_title`,
      type: `string`
    },
    
    metaDescription: {
      sql: `meta_description`,
      type: `string`
    },
    
    ogImage: {
      sql: `og_image`,
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
    },
    
    deletedAt: {
      sql: `deleted_at`,
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
