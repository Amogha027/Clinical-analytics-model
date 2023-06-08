cube(`PharmacyInvoiceDetails`, {
  sql: `SELECT * FROM ebdb.pharmacy_invoice_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PharmacyMasters: {
      sql: `${CUBE}.pharmacy_master_id = ${PharmacyMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, createdAt, updatedAt, invoiceDate, paidDate]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    invoiceNo: {
      sql: `invoice_no`,
      type: `string`
    },
    
    totalAmount: {
      sql: `total_amount`,
      type: `string`
    },
    
    paymentStatus: {
      sql: `payment_status`,
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
    
    igst: {
      sql: `igst`,
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
    
    invoiceDate: {
      sql: `invoice_date`,
      type: `time`
    },
    
    paidDate: {
      sql: `paid_date`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
