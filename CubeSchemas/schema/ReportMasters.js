cube(`ReportMasters`, {
  sql: `SELECT * FROM ebdb.report_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, reportName, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    reportName: {
      sql: `report_name`,
      type: `string`
    },
    
    reportHeading: {
      sql: `report_heading`,
      type: `string`
    },
    
    reportPath: {
      sql: `report_path`,
      type: `string`
    },
    
    reportClass: {
      sql: `report_class`,
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
    }
  },
  
  dataSource: `default`
});
