cube(`DieticianBrandFavourites`, {
  sql: `SELECT * FROM ebdb.dietician_brand_favourites`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    DieticianMasters: {
      sql: `${CUBE}.dietician_master_id = ${DieticianMasters}.id`,
      relationship: `belongsTo`
    },
    
    BrandMasters: {
      sql: `${CUBE}.brand_master_id = ${BrandMasters}.id`,
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
    },
    
    AgeRangeMasters: {
      sql: `${CUBE}.age_range_master_id = ${AgeRangeMasters}.id`,
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
    
    gender: {
      sql: `gender`,
      type: `string`
    },
    
    frequency: {
      sql: `frequency`,
      type: `string`
    },
    
    note: {
      sql: `note`,
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
    }
  },
  
  dataSource: `default`
});
