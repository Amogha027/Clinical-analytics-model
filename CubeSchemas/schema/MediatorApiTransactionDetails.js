cube(`MediatorApiTransactionDetails`, {
  sql: `SELECT * FROM ebdb.mediator_api_transaction_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, requestId, nhEventName, nhEventId, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    target: {
      sql: `target`,
      type: `string`
    },
    
    origin: {
      sql: `origin`,
      type: `string`
    },
    
    url: {
      sql: `url`,
      type: `string`
    },
    
    requestId: {
      sql: `request_id`,
      type: `string`
    },
    
    reqJsonBody: {
      sql: `req_json_body`,
      type: `string`
    },
    
    respStatusCode: {
      sql: `resp_status_code`,
      type: `string`
    },
    
    respJsonBody: {
      sql: `resp_json_body`,
      type: `string`
    },
    
    nhEventName: {
      sql: `nh_event_name`,
      type: `string`
    },
    
    nhEventId: {
      sql: `nh_event_id`,
      type: `string`
    },
    
    status: {
      sql: `status`,
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
