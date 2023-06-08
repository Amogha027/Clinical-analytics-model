cube(`PrescriptionReminderDetails`, {
  sql: `SELECT * FROM ebdb.prescription_reminder_details`,
  
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
    },
    
    PrescriptionReminderMasters: {
      sql: `${CUBE}.prescription_reminder_master_id = ${PrescriptionReminderMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, updatesJson, createdAt, updatedAt, medTakenDate, startDate, endDate]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    medTime: {
      sql: `med_time`,
      type: `string`
    },
    
    dayScore: {
      sql: `day_score`,
      type: `string`
    },
    
    cmmnts: {
      sql: `cmmnts`,
      type: `string`
    },
    
    dummy1: {
      sql: `dummy1`,
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
    
    mGenTime: {
      sql: `m_gen_time`,
      type: `time`
    },
    
    mrngRecTime: {
      sql: `mrng_rec_time`,
      type: `time`
    },
    
    aGenTime: {
      sql: `a_gen_time`,
      type: `time`
    },
    
    aftnRecTime: {
      sql: `aftn_rec_time`,
      type: `time`
    },
    
    eGenTime: {
      sql: `e_gen_time`,
      type: `time`
    },
    
    evngRecTime: {
      sql: `evng_rec_time`,
      type: `time`
    },
    
    nGenTime: {
      sql: `n_gen_time`,
      type: `time`
    },
    
    nytRecTime: {
      sql: `nyt_rec_time`,
      type: `time`
    },
    
    medTakenDate: {
      sql: `med_taken_date`,
      type: `time`
    },
    
    startDate: {
      sql: `start_date`,
      type: `time`
    },
    
    endDate: {
      sql: `end_date`,
      type: `time`
    },
    
    dummy3: {
      sql: `dummy3`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
