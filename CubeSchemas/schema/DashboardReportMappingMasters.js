cube(`DashboardReportMappingMasters`, {
  sql: `SELECT * FROM ebdb.dashboard_report_mapping_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    DashboardMasters: {
      sql: `${CUBE}.dashboard_master_id = ${DashboardMasters}.id`,
      relationship: `belongsTo`
    },
    
    ReportMasters: {
      sql: `${CUBE}.report_master_id = ${ReportMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, derivedReportIds, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    derivedReportIds: {
      sql: `derived_report_ids`,
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
