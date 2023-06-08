cube(`DiagnosticTestBookLines`, {
  sql: `SELECT * FROM ebdb.diagnostic_test_book_lines`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    DiagnosticTestBookingHeaders: {
      sql: `${CUBE}.diagnostic_test_booking_header_id = ${DiagnosticTestBookingHeaders}.id`,
      relationship: `belongsTo`
    },
    
    DiagnosticTestLabDetails: {
      sql: `${CUBE}.diagnostic_test_lab_detail_id = ${DiagnosticTestLabDetails}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, createdAt, updatedAt, testDate]
    },
    
    testAmount: {
      sql: `test_amount`,
      type: `sum`
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
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
    
    testDate: {
      sql: `test_date`,
      type: `time`
    },
    
    pickupTime: {
      sql: `pickup_time`,
      type: `time`
    },
    
    dummy3: {
      sql: `dummy3`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
