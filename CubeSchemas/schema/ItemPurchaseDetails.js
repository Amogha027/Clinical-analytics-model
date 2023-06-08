cube(`ItemPurchaseDetails`, {
  sql: `SELECT * FROM ebdb.item_purchase_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    HospitalMasters: {
      sql: `${CUBE}.hospital_master_id = ${HospitalMasters}.id`,
      relationship: `belongsTo`
    },
    
    ExpenseItemMasters: {
      sql: `${CUBE}.item_master_id = ${ExpenseItemMasters}.id`,
      relationship: `belongsTo`
    },
    
    ItemMasters: {
      sql: `${CUBE}.item_master_id = ${ItemMasters}.id`,
      relationship: `belongsTo`
    },
    
    InventoryPurchaseHeaders: {
      sql: `${CUBE}.inventory_purchase_header_id = ${InventoryPurchaseHeaders}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, createdAt, updatedAt]
    },
    
    purchaseQty: {
      sql: `purchase_qty`,
      type: `sum`
    },
    
    unitPurchaseCost: {
      sql: `unit_purchase_cost`,
      type: `sum`
    },
    
    transportationCost: {
      sql: `transportation_cost`,
      type: `sum`
    },
    
    totalPurchaseCost: {
      sql: `total_purchase_cost`,
      type: `sum`
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    supplier: {
      sql: `supplier`,
      type: `string`
    },
    
    address: {
      sql: `address`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    hsncode: {
      sql: `hsncode`,
      type: `string`
    },
    
    cgst: {
      sql: `cgst`,
      type: `string`
    },
    
    sgst: {
      sql: `sgst`,
      type: `string`
    },
    
    purchaseDiscount: {
      sql: `purchase_discount`,
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
    
    purchaseDt: {
      sql: `purchase_dt`,
      type: `time`
    },
    
    manufacturingDt: {
      sql: `manufacturing_dt`,
      type: `time`
    },
    
    expiryDt: {
      sql: `expiry_dt`,
      type: `time`
    },
    
    dummy3: {
      sql: `dummy3`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
