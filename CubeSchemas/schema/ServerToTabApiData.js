cube(`ServerToTabApiData`, {
  sql: `SELECT * FROM ebdb.server_to_tab_api_data`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    ItemOrderHeaders: {
      sql: `${CUBE}.item_order_header_id = ${ItemOrderHeaders}.id`,
      relationship: `belongsTo`
    },
    
    LocationMasters: {
      sql: `${CUBE}.location_master_id = ${LocationMasters}.id`,
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
      drillMembers: [id, ptntRgstrtnId, ddid, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    ptntRgstrtnId: {
      sql: `ptnt_rgstrtn_id`,
      type: `string`
    },
    
    ddid: {
      sql: `ddid`,
      type: `string`
    },
    
    changeType: {
      sql: `change_type`,
      type: `string`
    },
    
    status: {
      sql: `status`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    dummy4: {
      sql: `dummy4`,
      type: `string`
    },
    
    dummy5: {
      sql: `dummy5`,
      type: `string`
    },
    
    dummy6: {
      sql: `dummy6`,
      type: `string`
    },
    
    flag: {
      sql: `flag`,
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
    
    renewalDt: {
      sql: `renewal_dt`,
      type: `time`
    },
    
    nextTestDt: {
      sql: `next_test_dt`,
      type: `time`
    },
    
    dummy3: {
      sql: `dummy3`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
