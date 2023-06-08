cube(`ProgramEventDetails`, {
  sql: `SELECT * FROM ebdb.program_event_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    CareDeliveryProgramMasters: {
      sql: `${CUBE}.program_master_id = ${CareDeliveryProgramMasters}.id`,
      relationship: `belongsTo`
    },
    
    ProgramMasters: {
      sql: `${CUBE}.program_master_id = ${ProgramMasters}.id`,
      relationship: `belongsTo`
    },
    
    InsurancePolicyDetails: {
      sql: `${CUBE}.insurance_policy_detail_id = ${InsurancePolicyDetails}.id`,
      relationship: `belongsTo`
    },
    
    RfqInsurancePolicyDetails: {
      sql: `${CUBE}.insurance_policy_detail_id = ${RfqInsurancePolicyDetails}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, eventName, eventActivityId, screeningCampMasterIds, createdAt, updatedAt, fromDate, toDate]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    eventName: {
      sql: `event_name`,
      type: `string`
    },
    
    eventActivityId: {
      sql: `event_activity_id`,
      type: `string`
    },
    
    screeningCampMasterIds: {
      sql: `screening_camp_master_ids`,
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
    
    fromDate: {
      sql: `from_date`,
      type: `time`
    },
    
    toDate: {
      sql: `to_date`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
