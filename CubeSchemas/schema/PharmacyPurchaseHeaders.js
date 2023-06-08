cube(`PharmacyPurchaseHeaders`, {
  sql: `SELECT * FROM ebdb.pharmacy_purchase_headers`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    AddressDetails: {
      sql: `${CUBE}.address_detail_id = ${AddressDetails}.id`,
      relationship: `belongsTo`
    },
    
    OrderAddressDetails: {
      sql: `${CUBE}.address_detail_id = ${OrderAddressDetails}.id`,
      relationship: `belongsTo`
    },
    
    GlobalStatusMasters: {
      sql: `${CUBE}.global_status_master_id = ${GlobalStatusMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, invoiceId, createdAt, updatedAt, approvedDate]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    poNumber: {
      sql: `po_number`,
      type: `string`
    },
    
    invoiceId: {
      sql: `invoice_id`,
      type: `string`
    },
    
    tax: {
      sql: `tax`,
      type: `string`
    },
    
    transportationCost: {
      sql: `transportation_cost`,
      type: `string`
    },
    
    totalPurchaseCost: {
      sql: `total_purchase_cost`,
      type: `string`
    },
    
    receiptImgUrl: {
      sql: `receipt_img_url`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
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
    
    igst: {
      sql: `igst`,
      type: `string`
    },
    
    dealer: {
      sql: `dealer`,
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
    
    additionalDiscount: {
      sql: `additional_discount`,
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
    },
    
    approvedDate: {
      sql: `approved_date`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
