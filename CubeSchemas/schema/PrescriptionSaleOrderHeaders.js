cube(`PrescriptionSaleOrderHeaders`, {
  sql: `SELECT * FROM ebdb.prescription_sale_order_headers`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PatientMasters: {
      sql: `${CUBE}.patient_master_id = ${PatientMasters}.id`,
      relationship: `belongsTo`
    },
    
    PatientPrescriptionHeaders: {
      sql: `${CUBE}.patient_prescription_header_id = ${PatientPrescriptionHeaders}.id`,
      relationship: `belongsTo`
    },
    
    PharmacyMasters: {
      sql: `${CUBE}.pharmacy_master_id = ${PharmacyMasters}.id`,
      relationship: `belongsTo`
    },
    
    OrderAddressDetails: {
      sql: `${CUBE}.order_address_detail_id = ${OrderAddressDetails}.id`,
      relationship: `belongsTo`
    },
    
    PatientTestRecommendationDetails: {
      sql: `${CUBE}.patient_test_recommendation_detail_id = ${PatientTestRecommendationDetails}.id`,
      relationship: `belongsTo`
    },
    
    NanosafePayments: {
      sql: `${CUBE}.nanosafe_payment_id = ${NanosafePayments}.id`,
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
      drillMembers: [id, orderId, invoiceId, razorpayPaymentId, prevOrderId, doctorName, pharmacistName, updatesJson, createdAt, updatedAt, orderDate, deliveryDate, refillDate]
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
    
    orderId: {
      sql: `order_id`,
      type: `string`
    },
    
    invoiceId: {
      sql: `invoice_id`,
      type: `string`
    },
    
    razorpayPaymentId: {
      sql: `razorpay_payment_id`,
      type: `string`
    },
    
    orderStatus: {
      sql: `order_status`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    prevOrderId: {
      sql: `prev_order_id`,
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
    
    doctorName: {
      sql: `doctor_name`,
      type: `string`
    },
    
    pharmacistName: {
      sql: `pharmacist_name`,
      type: `string`
    },
    
    updatesJson: {
      sql: `updates_json`,
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
    
    deliveryDate: {
      sql: `delivery_date`,
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
    
    refillDate: {
      sql: `refill_date`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
