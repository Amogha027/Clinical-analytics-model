cube(`ProductServiceRelationshipMasters`, {
  sql: `SELECT * FROM ebdb.product_service_relationship_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    CareDeliveryProgramMasters: {
      sql: `${CUBE}.care_delivery_program_master_id = ${CareDeliveryProgramMasters}.id`,
      relationship: `belongsTo`
    },
    
    AppointmentTypeMasters: {
      sql: `${CUBE}.appointment_type_master_id = ${AppointmentTypeMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, productMasterId, providerTable, providerId, providerServiceCharges, createdAt, updatedAt]
    },
    
    slotDuration: {
      sql: `slot_duration`,
      type: `sum`
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    productMasterId: {
      sql: `product_master_id`,
      type: `string`
    },
    
    providerTable: {
      sql: `provider_table`,
      type: `string`
    },
    
    providerId: {
      sql: `provider_id`,
      type: `string`
    },
    
    providerServiceCharges: {
      sql: `provider_service_charges`,
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
