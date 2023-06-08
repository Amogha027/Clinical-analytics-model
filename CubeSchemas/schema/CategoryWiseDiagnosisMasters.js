cube(`CategoryWiseDiagnosisMasters`, {
  sql: `SELECT * FROM ebdb.category_wise_diagnosis_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    DoctorMasters: {
      sql: `${CUBE}.doctor_master_id = ${DoctorMasters}.id`,
      relationship: `belongsTo`
    },
    
    SpecialisationMasters: {
      sql: `${CUBE}.specialisation_master_id = ${SpecialisationMasters}.id`,
      relationship: `belongsTo`
    },
    
    AgeRangeMasters: {
      sql: `${CUBE}.age_range_master_id = ${AgeRangeMasters}.id`,
      relationship: `belongsTo`
    },
    
    GenderMasters: {
      sql: `${CUBE}.gender_master_id = ${GenderMasters}.id`,
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
