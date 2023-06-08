cube(`LabInventoryDetails`, {
  sql: `SELECT * FROM ebdb.lab_inventory_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    ExpenseItemMasters: {
      sql: `${CUBE}.item_master_id = ${ExpenseItemMasters}.id`,
      relationship: `belongsTo`
    },
    
    ItemMasters: {
      sql: `${CUBE}.item_master_id = ${ItemMasters}.id`,
      relationship: `belongsTo`
    },
    
    DiagnosticLabMasters: {
      sql: `${CUBE}.diagnostic_lab_master_id = ${DiagnosticLabMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, createdAt, updatedAt]
    },
    
    remainingQty: {
      sql: `remaining_qty`,
      type: `sum`
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    batch: {
      sql: `batch`,
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
    
    mrp: {
      sql: `mrp`,
      type: `string`
    },
    
    category: {
      sql: `category`,
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
    
    expiryDt: {
      sql: `expiry_dt`,
      type: `time`
    },
    
    archivedAt: {
      sql: `archived_at`,
      type: `time`
    },
    
    dummy3: {
      sql: `dummy3`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
