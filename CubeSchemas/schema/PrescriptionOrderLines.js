cube(`PrescriptionOrderLines`, {
  sql: `SELECT * FROM ebdb.prescription_order_lines`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PrescriptionSaleOrderHeaders: {
      sql: `${CUBE}.prescription_sale_order_header_id = ${PrescriptionSaleOrderHeaders}.id`,
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
      drillMembers: [id, createdAt, updatedAt]
    },
    
    quantity: {
      sql: `quantity`,
      type: `sum`
    },
    
    aggregateTotalDiscount: {
      sql: `aggregate_total_discount`,
      type: `sum`
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    dummy1: {
      sql: `dummy1`,
      type: `string`
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
    
    saleTotalPrice: {
      sql: `sale_total_price`,
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
    
    category: {
      sql: `category`,
      type: `string`
    },
    
    hsncode: {
      sql: `hsncode`,
      type: `string`
    },
    
    netPrice: {
      sql: `net_price`,
      type: `string`
    },
    
    serialNumbers: {
      sql: `serial_numbers`,
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
    
    dummy3: {
      sql: `dummy3`,
      type: `time`
    },
    
    deletedAt: {
      sql: `deleted_at`,
      type: `time`
    },
    
    expiryDt: {
      sql: `expiry_dt`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
