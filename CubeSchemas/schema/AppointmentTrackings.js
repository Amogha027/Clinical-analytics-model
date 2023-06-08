cube(`AppointmentTrackings`, {
  sql: `SELECT * FROM ebdb.appointment_trackings`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    ServiceMasters: {
      sql: `${CUBE}.service_master_id = ${ServiceMasters}.id`,
      relationship: `belongsTo`
    },
    
    WebsiteServiceMasters: {
      sql: `${CUBE}.service_master_id = ${WebsiteServiceMasters}.id`,
      relationship: `belongsTo`
    },
    
    PatientMasters: {
      sql: `${CUBE}.patient_master_id = ${PatientMasters}.id`,
      relationship: `belongsTo`
    },
    
    PrescriptionSaleOrderHeaders: {
      sql: `${CUBE}.sale_order_header_id = ${PrescriptionSaleOrderHeaders}.sale_order_header_id`,
      relationship: `belongsTo`
    },
    
    SaleOrderHeaders: {
      sql: `${CUBE}.sale_order_header_id = ${SaleOrderHeaders}.id`,
      relationship: `belongsTo`
    },
    
    PromoCodeMasters: {
      sql: `${CUBE}.promo_code_master_id = ${PromoCodeMasters}.id`,
      relationship: `belongsTo`
    },
    
    AppointmentTypeMasters: {
      sql: `${CUBE}.appointment_type_master_id = ${AppointmentTypeMasters}.id`,
      relationship: `belongsTo`
    },
    
    ScreeningCampMasters: {
      sql: `${CUBE}.screening_camp_master_id = ${ScreeningCampMasters}.id`,
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
    
    ReferralDetails: {
      sql: `${CUBE}.referral_detail_id = ${ReferralDetails}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, appointmentId, partnerBookingRefId, razorpayPaymentId, invoiceId, updatesJson, createdAt, updatedAt, apmntDate, apmntEndDate]
    },
    
    orderValue: {
      sql: `order_value`,
      type: `sum`
    },
    
    discount: {
      sql: `discount`,
      type: `sum`
    },
    
    tokenNumber: {
      sql: `token_number`,
      type: `sum`
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    appointmentId: {
      sql: `appointment_id`,
      type: `string`
    },
    
    partnerBookingRefId: {
      sql: `partner_booking_ref_id`,
      type: `string`
    },
    
    razorpayPaymentId: {
      sql: `razorpay_payment_id`,
      type: `string`
    },
    
    apmntStatus: {
      sql: `apmnt_status`,
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
    
    complaints: {
      sql: `complaints`,
      type: `string`
    },
    
    complaintsLink: {
      sql: `complaints_link`,
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
    
    apmntDate: {
      sql: `apmnt_date`,
      type: `time`
    },
    
    apmntEndDate: {
      sql: `apmnt_end_date`,
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
