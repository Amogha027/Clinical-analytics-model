cube(`SaleOrderDiscountDetails`, {
  sql: `SELECT * FROM ebdb.sale_order_discount_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PrescriptionSaleOrderHeaders: {
      sql: `${CUBE}.sale_order_header_id = ${PrescriptionSaleOrderHeaders}.sale_order_header_id`,
      relationship: `belongsTo`
    },
    
    SaleOrderHeaders: {
      sql: `${CUBE}.sale_order_header_id = ${SaleOrderHeaders}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    dscntSrceNm: {
      sql: `dscnt_srce_nm`,
      type: `string`
    },
    
    dscntAmt: {
      sql: `dscnt_amt`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
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
    
    archivedAt: {
      sql: `archived_at`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
