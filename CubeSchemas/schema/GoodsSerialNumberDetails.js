cube(`GoodsSerialNumberDetails`, {
  sql: `SELECT * FROM ebdb.goods_serial_number_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PharmacyGoodsReceivedDetails: {
      sql: `${CUBE}.pharmacy_goods_received_detail_id = ${PharmacyGoodsReceivedDetails}.id`,
      relationship: `belongsTo`
    },
    
    BrandMasters: {
      sql: `${CUBE}.brand_master_id = ${BrandMasters}.id`,
      relationship: `belongsTo`
    },
    
    PatientMasters: {
      sql: `${CUBE}.patient_master_id = ${PatientMasters}.id`,
      relationship: `belongsTo`
    },
    
    PrescriptionOrderLines: {
      sql: `${CUBE}.prescription_order_line_id = ${PrescriptionOrderLines}.id`,
      relationship: `belongsTo`
    },
    
    PrescriptionSaleOrderHeaders: {
      sql: `${CUBE}.prescription_sale_order_header_id = ${PrescriptionSaleOrderHeaders}.id`,
      relationship: `belongsTo`
    },
    
    PharmacyPurchaseLines: {
      sql: `${CUBE}.pharmacy_purchase_line_id = ${PharmacyPurchaseLines}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, grInvoiceId, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    serialNumber: {
      sql: `serial_number`,
      type: `string`
    },
    
    grInvoiceId: {
      sql: `gr_invoice_id`,
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
    
    receivedDt: {
      sql: `received_dt`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
