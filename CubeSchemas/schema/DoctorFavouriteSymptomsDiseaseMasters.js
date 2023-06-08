cube(`DoctorFavouriteSymptomsDiseaseMasters`, {
  sql: `SELECT * FROM ebdb.doctor_favourite_symptoms_disease_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    DoctorMasters: {
      sql: `${CUBE}.doctor_master_id = ${DoctorMasters}.id`,
      relationship: `belongsTo`
    },
    
    DoctorFavouriteSymptomMasters: {
      sql: `${CUBE}.doctor_favourite_symptom_master_id = ${DoctorFavouriteSymptomMasters}.id`,
      relationship: `belongsTo`
    },
    
    DieticianFavouriteSymptomsDiseaseMasters: {
      sql: `${CUBE}.disease_master_id = ${DieticianFavouriteSymptomsDiseaseMasters}.disease_master_id`,
      relationship: `belongsTo`
    },
    
    DiseaseMasters: {
      sql: `${CUBE}.disease_master_id = ${DiseaseMasters}.id`,
      relationship: `belongsTo`
    },
    
    IcdCmCodeMasters: {
      sql: `${CUBE}.icd_cm_code_master_id = ${IcdCmCodeMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, createdAt, updatedAt]
    },
    
    usedCount: {
      sql: `used_count`,
      type: `sum`
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    dummy2: {
      sql: `dummy2`,
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
