cube(`DiagnosticTestMasters`, {
  sql: `SELECT * FROM ebdb.diagnostic_test_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, testName, aliasName, idealRange, createdAt, updatedAt]
    },
    
    price: {
      sql: `price`,
      type: `sum`
    },
    
    maxValue: {
      sql: `max_value`,
      type: `sum`
    },
    
    minValue: {
      sql: `min_value`,
      type: `sum`
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    loincCode: {
      sql: `loinc_code`,
      type: `string`
    },
    
    testName: {
      sql: `test_name`,
      type: `string`
    },
    
    aliasName: {
      sql: `alias_name`,
      type: `string`
    },
    
    department: {
      sql: `department`,
      type: `string`
    },
    
    testType: {
      sql: `test_type`,
      type: `string`
    },
    
    units: {
      sql: `units`,
      type: `string`
    },
    
    sampleType: {
      sql: `sample_type`,
      type: `string`
    },
    
    volume: {
      sql: `volume`,
      type: `string`
    },
    
    fieldType: {
      sql: `field_type`,
      type: `string`
    },
    
    idealRange: {
      sql: `ideal_range`,
      type: `string`
    },
    
    testDesc: {
      sql: `test_desc`,
      type: `string`
    },
    
    maxRange: {
      sql: `max_range`,
      type: `string`
    },
    
    haveChild: {
      sql: `have_child`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    technology: {
      sql: `technology`,
      type: `string`
    },
    
    customUrl: {
      sql: `custom_url`,
      type: `string`
    },
    
    metaDescription: {
      sql: `meta_description`,
      type: `string`
    },
    
    testImageUrl: {
      sql: `test_image_url`,
      type: `string`
    },
    
    description: {
      sql: `description`,
      type: `string`
    },
    
    faqs: {
      sql: `faqs`,
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
