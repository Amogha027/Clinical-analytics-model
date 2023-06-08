cube(`PharmacyInventoryDetails`, {
  sql: `SELECT * FROM ebdb.pharmacy_inventory_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PharmacyMasters: {
      sql: `${CUBE}.pharmacy_master_id = ${PharmacyMasters}.id`,
      relationship: `belongsTo`
    },
    
    BrandMasters: {
      sql: `${CUBE}.brand_master_id = ${BrandMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, invoiceId, updates, createdAt, updatedAt]
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
    
    invoiceId: {
      sql: `invoice_id`,
      type: `string`
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
    
    purchaseUnitPrice: {
      sql: `purchase_unit_price`,
      type: `string`
    },
    
    updates: {
      sql: `updates`,
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
