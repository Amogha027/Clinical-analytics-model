cube(`ExpenseHeaders`, {
  sql: `SELECT * FROM ebdb.expense_headers`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    HospitalMasters: {
      sql: `${CUBE}.hospital_master_id = ${HospitalMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, invoiceId, receiptId, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    totalPurchaseCost: {
      sql: `total_purchase_cost`,
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
    
    receiptImgUrl: {
      sql: `receipt_img_url`,
      type: `string`
    },
    
    transportationCost: {
      sql: `transportation_cost`,
      type: `string`
    },
    
    invoiceImgUrl: {
      sql: `invoice_img_url`,
      type: `string`
    },
    
    purchaseDiscount: {
      sql: `purchase_discount`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    supplier: {
      sql: `supplier`,
      type: `string`
    },
    
    invoiceId: {
      sql: `invoice_id`,
      type: `string`
    },
    
    receiptId: {
      sql: `receipt_id`,
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
