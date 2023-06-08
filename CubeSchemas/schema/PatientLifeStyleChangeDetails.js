cube(`PatientLifeStyleChangeDetails`, {
  sql: `SELECT * FROM ebdb.patient_life_style_change_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    DoctorVisits: {
      sql: `${CUBE}.doctor_visit_id = ${DoctorVisits}.id`,
      relationship: `belongsTo`
    },
    
    TempDoctorVisits: {
      sql: `${CUBE}.doctor_visit_id = ${TempDoctorVisits}.id`,
      relationship: `belongsTo`
    },
    
    DoctorFavouritePrescriptions: {
      sql: `${CUBE}.doctor_favourite_prescription_id = ${DoctorFavouritePrescriptions}.id`,
      relationship: `belongsTo`
    },
    
    PatientMasters: {
      sql: `${CUBE}.patient_master_id = ${PatientMasters}.id`,
      relationship: `belongsTo`
    },
    
    PatientPrescriptionHeaders: {
      sql: `${CUBE}.patient_prescription_header_id = ${PatientPrescriptionHeaders}.id`,
      relationship: `belongsTo`
    },
    
    DieticianFavouritePrescriptions: {
      sql: `${CUBE}.dietician_favourite_prescription_id = ${DieticianFavouritePrescriptions}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, updatesJson, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    lifestyleDesc: {
      sql: `lifestyle_desc`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
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
    
    archivedAt: {
      sql: `archived_at`,
      type: `time`
    },
    
    dummy3: {
      sql: `dummy3`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
