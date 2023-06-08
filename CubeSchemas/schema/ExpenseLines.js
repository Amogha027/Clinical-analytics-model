cube(`ExpenseLines`, {
  sql: `SELECT * FROM ebdb.expense_lines`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PharmacyPurchaseHeaders: {
      sql: `${CUBE}.pharmacy_purchase_header_id = ${PharmacyPurchaseHeaders}.id`,
      relationship: `belongsTo`
    },
    
    BrandMasters: {
      sql: `${CUBE}.brand_master_id = ${BrandMasters}.id`,
      relationship: `belongsTo`
    },
    
    ExpenseHeaders: {
      sql: `${CUBE}.expense_header_id = ${ExpenseHeaders}.id`,
      relationship: `belongsTo`
    },
    
    ExpenseItemMasters: {
      sql: `${CUBE}.expense_item_master_id = ${ExpenseItemMasters}.id`,
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
    
    purchaseUnitPrice: {
      sql: `purchase_unit_price`,
      type: `sum`
    },
    
    purchasePckQty: {
      sql: `purchase_pck_qty`,
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
    
    saleUnitPrice: {
      sql: `sale_unit_price`,
      type: `string`
    },
    
    saleDiscountPercent: {
      sql: `sale_discount_percent`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    hsnCode: {
      sql: `hsn_code`,
      type: `string`
    },
    
    gstRate: {
      sql: `gst_rate`,
      type: `string`
    },
    
    tax: {
      sql: `tax`,
      type: `string`
    },
    
    sgst: {
      sql: `sgst`,
      type: `string`
    },
    
    cgst: {
      sql: `cgst`,
      type: `string`
    },
    
    purchaseDiscount: {
      sql: `purchase_discount`,
      type: `string`
    },
    
    totalPrice: {
      sql: `total_price`,
      type: `string`
    },
    
    hsncode: {
      sql: `hsncode`,
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
    
    purchasePckCost: {
      sql: `purchase_pck_cost`,
      type: `string`
    },
    
    pckMrp: {
      sql: `pck_mrp`,
      type: `string`
    },
    
    description: {
      sql: `description`,
      type: `string`
    },
    
    expCount: {
      sql: `exp_count`,
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
