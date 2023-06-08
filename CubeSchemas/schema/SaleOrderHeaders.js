cube(`SaleOrderHeaders`, {
  sql: `SELECT * FROM ebdb.sale_order_headers`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PatientMasters: {
      sql: `${CUBE}.patient_master_id = ${PatientMasters}.id`,
      relationship: `belongsTo`
    },
    
    CurrencyMasters: {
      sql: `${CUBE}.currency_master_id = ${CurrencyMasters}.id`,
      relationship: `belongsTo`
    },
    
    ClaimDetails: {
      sql: `${CUBE}.claim_detail_id = ${ClaimDetails}.id`,
      relationship: `belongsTo`
    },
    
    RfqClaimDetails: {
      sql: `${CUBE}.claim_detail_id = ${RfqClaimDetails}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, razorpayRefId, invoiceId, updatesJson, createdAt, updatedAt, orderDate, dueDate]
    },
    
    orderValue: {
      sql: `order_value`,
      type: `sum`
    },
    
    discount: {
      sql: `discount`,
      type: `sum`
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    razorpayRefId: {
      sql: `razorpay_ref_id`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    invoiceId: {
      sql: `invoice_id`,
      type: `string`
    },
    
    emiPreEnquiry: {
      sql: `emi_pre_enquiry`,
      type: `string`
    },
    
    updatesJson: {
      sql: `updates_json`,
      type: `string`
    },
    
    pkgDisc: {
      sql: `pkg_disc`,
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
    
    orderDate: {
      sql: `order_date`,
      type: `time`
    },
    
    dueDate: {
      sql: `due_date`,
      type: `time`
    },
    
    dummy3: {
      sql: `dummy3`,
      type: `time`
    },
    
    deletedAt: {
      sql: `deleted_at`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
