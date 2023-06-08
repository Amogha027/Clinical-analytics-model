cube(`PrescriptionReminderMasters`, {
  sql: `SELECT * FROM ebdb.prescription_reminder_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PatientMasters: {
      sql: `${CUBE}.patient_master_id = ${PatientMasters}.id`,
      relationship: `belongsTo`
    },
    
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
      drillMembers: [id, updatesJson, createdAt, updatedAt, startDateTime, endDateTime]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    prscrbdMrng: {
      sql: `prscrbd_mrng`,
      type: `string`
    },
    
    prscrbdAftn: {
      sql: `prscrbd_aftn`,
      type: `string`
    },
    
    prscrbdEvng: {
      sql: `prscrbd_evng`,
      type: `string`
    },
    
    prscrbdNyt: {
      sql: `prscrbd_nyt`,
      type: `string`
    },
    
    route: {
      sql: `route`,
      type: `string`
    },
    
    medTime: {
      sql: `med_time`,
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
    
    mrngGenTime: {
      sql: `mrng_gen_time`,
      type: `time`
    },
    
    aftnGenTime: {
      sql: `aftn_gen_time`,
      type: `time`
    },
    
    evngGenTime: {
      sql: `evng_gen_time`,
      type: `time`
    },
    
    nytGenTime: {
      sql: `nyt_gen_time`,
      type: `time`
    },
    
    startDateTime: {
      sql: `start_date_time`,
      type: `time`
    },
    
    endDateTime: {
      sql: `end_date_time`,
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
