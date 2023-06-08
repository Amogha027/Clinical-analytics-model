cube(`PartnerPaymentDetails`, {
  sql: `SELECT * FROM ebdb.partner_payment_details`,
  
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
    
    PaymentGatewayMasters: {
      sql: `${CUBE}.payment_gateway_master_id = ${PaymentGatewayMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, paidAmount, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    partnerType: {
      sql: `partner_type`,
      type: `string`
    },
    
    paidAmount: {
      sql: `paid_amount`,
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
