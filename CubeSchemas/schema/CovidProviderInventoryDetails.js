cube(`CovidProviderInventoryDetails`, {
  sql: `SELECT * FROM ebdb.covid_provider_inventory_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    CovidProviderMasters: {
      sql: `${CUBE}.covid_provider_master_id = ${CovidProviderMasters}.id`,
      relationship: `belongsTo`
    },
    
    ExpenseItemMasters: {
      sql: `${CUBE}.item_master_id = ${ExpenseItemMasters}.id`,
      relationship: `belongsTo`
    },
    
    ItemMasters: {
      sql: `${CUBE}.item_master_id = ${ItemMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, createdAt, updatedAt]
    },
    
    total: {
      sql: `total`,
      type: `sum`
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
