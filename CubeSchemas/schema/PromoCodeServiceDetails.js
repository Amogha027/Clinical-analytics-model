cube(`PromoCodeServiceDetails`, {
  sql: `SELECT * FROM ebdb.promo_code_service_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PromoCodeMasters: {
      sql: `${CUBE}.promo_code_master_id = ${PromoCodeMasters}.id`,
      relationship: `belongsTo`
    },
    
    CareDeliveryProgramMasters: {
      sql: `${CUBE}.care_delivery_program_master_id = ${CareDeliveryProgramMasters}.id`,
      relationship: `belongsTo`
    },
    
    ClaimStatusMasters: {
      sql: `${CUBE}.status_master_id = ${ClaimStatusMasters}.id`,
      relationship: `belongsTo`
    },
    
    DeliveryStatusMasters: {
      sql: `${CUBE}.status_master_id = ${DeliveryStatusMasters}.id`,
      relationship: `belongsTo`
    },
    
    GlobalStatusMasters: {
      sql: `${CUBE}.status_master_id = ${GlobalStatusMasters}.id`,
      relationship: `belongsTo`
    },
    
    OrderCartStatusMasters: {
      sql: `${CUBE}.status_master_id = ${OrderCartStatusMasters}.id`,
      relationship: `belongsTo`
    },
    
    StatusMasters: {
      sql: `${CUBE}.status_master_id = ${StatusMasters}.id`,
      relationship: `belongsTo`
    },
    
    PatientCategoryMasters: {
      sql: `${CUBE}.patient_category_master_id = ${PatientCategoryMasters}.id`,
      relationship: `belongsTo`
    },
    
    ServiceMasters: {
      sql: `${CUBE}.service_master_id = ${ServiceMasters}.id`,
      relationship: `belongsTo`
    },
    
    WebsiteServiceMasters: {
      sql: `${CUBE}.service_master_id = ${WebsiteServiceMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, programMasterIds, notInProgramIds, statusMasterId, serviceMasterId, createdAt, updatedAt, startDate, endDate]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    programMasterIds: {
      sql: `program_master_ids`,
      type: `string`
    },
    
    notInProgramIds: {
      sql: `not_in_program_ids`,
      type: `string`
    },
    
    statusMasterId: {
      sql: `status_master_id`,
      type: `string`
    },
    
    serviceMasterId: {
      sql: `service_master_id`,
      type: `string`
    },
    
    customLogic: {
      sql: `custom_logic`,
      type: `string`
    },
    
    discount: {
      sql: `discount`,
      type: `string`
    },
    
    amount: {
      sql: `amount`,
      type: `string`
    },
    
    maxDiscAmt: {
      sql: `max_disc_amt`,
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
    
    startDate: {
      sql: `start_date`,
      type: `time`
    },
    
    endDate: {
      sql: `end_date`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
