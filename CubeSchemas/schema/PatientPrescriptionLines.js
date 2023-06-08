cube(`PatientPrescriptionLines`, {
  sql: `SELECT * FROM ebdb.patient_prescription_lines`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PatientPrescriptionHeaders: {
      sql: `${CUBE}.patient_prescription_header_id = ${PatientPrescriptionHeaders}.id`,
      relationship: `belongsTo`
    },
    
    BrandMasters: {
      sql: `${CUBE}.brand_master_id = ${BrandMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, createdAt, updatedAt]
    },
    
    endDuration: {
      sql: `end_duration`,
      type: `sum`
    },
    
    totalPrice: {
      sql: `total_price`,
      type: `sum`
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    route: {
      sql: `route`,
      type: `string`
    },
    
    medTime: {
      sql: `med_time`,
      type: `string`
    },
    
    endDurationType: {
      sql: `end_duration_type`,
      type: `string`
    },
    
    dummy1: {
      sql: `dummy1`,
      type: `string`
    },
    
    note: {
      sql: `note`,
      type: `string`
    },
    
    brandDescript: {
      sql: `brand_descript`,
      type: `string`
    },
    
    frequency: {
      sql: `frequency`,
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
