cube(`NanosafePayments`, {
  sql: `SELECT * FROM ebdb.nanosafe_payments`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PatientMasters: {
      sql: `${CUBE}.patient_master_id = ${PatientMasters}.id`,
      relationship: `belongsTo`
    },
    
    PatientPackageDetails: {
      sql: `${CUBE}.patient_package_detail_id = ${PatientPackageDetails}.id`,
      relationship: `belongsTo`
    },
    
    PaymentGatewayMasters: {
      sql: `${CUBE}.payment_gateway_master_id = ${PaymentGatewayMasters}.id`,
      relationship: `belongsTo`
    },
    
    PaymentTypeMasters: {
      sql: `${CUBE}.payment_type_master_id = ${PaymentTypeMasters}.id`,
      relationship: `belongsTo`
    },
    
    AppointmentTrackings: {
      sql: `${CUBE}.appointment_tracking_id = ${AppointmentTrackings}.id`,
      relationship: `belongsTo`
    },
    
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
      drillMembers: [id, pharmaBillId, recieptId, txnId, updatesJson, createdAt, updatedAt, procUpdatedAt, paidDate, renewalDate, plnRenDate]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    nanosafeAmt: {
      sql: `nanosafe_amt`,
      type: `string`
    },
    
    pharmaBillId: {
      sql: `pharma_bill_id`,
      type: `string`
    },
    
    prescriptionImg: {
      sql: `prescription_img`,
      type: `string`
    },
    
    medBillImg: {
      sql: `med_bill_img`,
      type: `string`
    },
    
    refundReason: {
      sql: `refund_reason`,
      type: `string`
    },
    
    cmmts: {
      sql: `cmmts`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    isApproved: {
      sql: `is_approved`,
      type: `string`
    },
    
    recieptId: {
      sql: `reciept_id`,
      type: `string`
    },
    
    paymentType: {
      sql: `payment_type`,
      type: `string`
    },
    
    txnId: {
      sql: `txn_id`,
      type: `string`
    },
    
    rcptImgUrl: {
      sql: `rcpt_img_url`,
      type: `string`
    },
    
    authorizationNo: {
      sql: `authorization_no`,
      type: `string`
    },
    
    claimNo: {
      sql: `claim_no`,
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
    
    procUpdatedAt: {
      sql: `proc_updated_at`,
      type: `time`
    },
    
    paidDate: {
      sql: `paid_date`,
      type: `time`
    },
    
    tbltCrtdAt: {
      sql: `tblt_crtd_at`,
      type: `time`
    },
    
    dummy3: {
      sql: `dummy3`,
      type: `time`
    },
    
    renewalDate: {
      sql: `renewal_date`,
      type: `time`
    },
    
    plnRenDate: {
      sql: `pln_ren_date`,
      type: `time`
    },
    
    approvedDt: {
      sql: `approved_dt`,
      type: `time`
    },
    
    recievedDt: {
      sql: `recieved_dt`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
