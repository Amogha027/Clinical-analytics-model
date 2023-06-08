cube(`HospitalAppointmentUnitMasters`, {
  sql: `SELECT * FROM ebdb.hospital_appointment_unit_masters`,
  
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
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, appointmentUnitName, createdAt, updatedAt]
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
    
    appointmentUnitName: {
      sql: `appointment_unit_name`,
      type: `string`
    },
    
    price: {
      sql: `price`,
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
