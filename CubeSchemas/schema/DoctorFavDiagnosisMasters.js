cube(`DoctorFavDiagnosisMasters`, {
  sql: `SELECT * FROM ebdb.doctor_fav_diagnosis_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    DoctorMasters: {
      sql: `${CUBE}.doctor_master_id = ${DoctorMasters}.id`,
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
    
    DoctorFavouriteSymptomsDiseaseMasters: {
      sql: `${CUBE}.disease_master_id = ${DoctorFavouriteSymptomsDiseaseMasters}.disease_master_id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, dssName, createdAt, updatedAt]
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
    
    dssName: {
      sql: `dss_name`,
      type: `string`
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
