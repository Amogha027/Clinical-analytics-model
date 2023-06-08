cube(`DieticianConsultationDetails`, {
  sql: `SELECT * FROM ebdb.dietician_consultation_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    HospitalDieticians: {
      sql: `${CUBE}.hospital_dietician_id = ${HospitalDieticians}.id`,
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
      drillMembers: [id, createdAt, updatedAt]
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
