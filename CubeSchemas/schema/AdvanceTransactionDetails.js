cube(`AdvanceTransactionDetails`, {
  sql: `SELECT * FROM ebdb.advance_transaction_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    CareDeliveryProgramMasters: {
      sql: `${CUBE}.care_delivery_program_master_id = ${CareDeliveryProgramMasters}.id`,
      relationship: `belongsTo`
    },
    
    HospitalMasters: {
      sql: `${CUBE}.hospital_master_id = ${HospitalMasters}.id`,
      relationship: `belongsTo`
    },
    
    PatientMasters: {
      sql: `${CUBE}.patient_master_id = ${PatientMasters}.id`,
      relationship: `belongsTo`
    },
    
    CurrencyMasters: {
      sql: `${CUBE}.currency_master_id = ${CurrencyMasters}.id`,
      relationship: `belongsTo`
    },
    
    PaymentGatewayMasters: {
      sql: `${CUBE}.payment_gateway_master_id = ${PaymentGatewayMasters}.id`,
      relationship: `belongsTo`
    },
    
    MediatorApiTransactionDetails: {
      sql: `${CUBE}.transaction_detail_id = ${MediatorApiTransactionDetails}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, txnId, receiptId, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    creditAmt: {
      sql: `credit_amt`,
      type: `string`
    },
    
    debitAmt: {
      sql: `debit_amt`,
      type: `string`
    },
    
    balance: {
      sql: `balance`,
      type: `string`
    },
    
    txnId: {
      sql: `txn_id`,
      type: `string`
    },
    
    receiptImgUrl: {
      sql: `receipt_img_url`,
      type: `string`
    },
    
    notes: {
      sql: `notes`,
      type: `string`
    },
    
    receiptId: {
      sql: `receipt_id`,
      type: `string`
    },
    
    createdAt: {
      sql: `created_at`,
      type: `time`
    },
    
    updatedAt: {
      sql: `updated_at`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
