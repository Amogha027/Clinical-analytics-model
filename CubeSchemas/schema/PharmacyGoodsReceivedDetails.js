cube(`PharmacyGoodsReceivedDetails`, {
  sql: `SELECT * FROM ebdb.pharmacy_goods_received_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PharmacyMasters: {
      sql: `${CUBE}.pharmacy_master_id = ${PharmacyMasters}.id`,
      relationship: `belongsTo`
    },
    
    PharmacyInvoiceDetails: {
      sql: `${CUBE}.pharmacy_invoice_detail_id = ${PharmacyInvoiceDetails}.id`,
      relationship: `belongsTo`
    },
    
    PharmacyPurchaseHeaders: {
      sql: `${CUBE}.pharmacy_purchase_header_id = ${PharmacyPurchaseHeaders}.id`,
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
      drillMembers: [id, grId, invoiceId, createdAt, updatedAt]
    },
    
    purchaseQty: {
      sql: `purchase_qty`,
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
    
    poNumber: {
      sql: `po_number`,
      type: `string`
    },
    
    grId: {
      sql: `gr_id`,
      type: `string`
    },
    
    batch: {
      sql: `batch`,
      type: `string`
    },
    
    purchaseUnitPrice: {
      sql: `purchase_unit_price`,
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
    
    igst: {
      sql: `igst`,
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
    
    invoiceId: {
      sql: `invoice_id`,
      type: `string`
    },
    
    grDoc: {
      sql: `gr_doc`,
      type: `string`
    },
    
    invoiceImgUrl: {
      sql: `invoice_img_url`,
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
    
    expiryDt: {
      sql: `expiry_dt`,
      type: `time`
    },
    
    archivedAt: {
      sql: `archived_at`,
      type: `time`
    },
    
    receivedDt: {
      sql: `received_dt`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
