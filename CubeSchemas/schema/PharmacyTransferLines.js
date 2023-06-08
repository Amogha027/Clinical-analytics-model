cube(`PharmacyTransferLines`, {
  sql: `SELECT * FROM ebdb.pharmacy_transfer_lines`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PharmacyTransferHeaders: {
      sql: `${CUBE}.pharmacy_transfer_header_id = ${PharmacyTransferHeaders}.id`,
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
    
    receivedQty: {
      sql: `received_qty`,
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
    
    purchaseUnitPrice: {
      sql: `purchase_unit_price`,
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
    }
  },
  
  dataSource: `default`
});
