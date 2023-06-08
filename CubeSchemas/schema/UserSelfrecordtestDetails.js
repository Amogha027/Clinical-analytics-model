cube(`UserSelfrecordtestDetails`, {
  sql: `SELECT * FROM ebdb.user_selfrecordtest_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PatientMasters: {
      sql: `${CUBE}.patient_master_id = ${PatientMasters}.id`,
      relationship: `belongsTo`
    },
    
    LocationMasters: {
      sql: `${CUBE}.location_master_id = ${LocationMasters}.id`,
      relationship: `belongsTo`
    },
    
    TabletMasters: {
      sql: `${CUBE}.tablet_master_id = ${TabletMasters}.id`,
      relationship: `belongsTo`
    },
    
    PatientPrescriptionHeaders: {
      sql: `${CUBE}.patient_prescription_header_id = ${PatientPrescriptionHeaders}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, updatesJson, createdAt, procUpdatedAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    dizzy: {
      sql: `dizzy`,
      type: `string`
    },
    
    dryTnge: {
      sql: `dry_tnge`,
      type: `string`
    },
    
    nmbness: {
      sql: `nmbness`,
      type: `string`
    },
    
    prgnnt: {
      sql: `prgnnt`,
      type: `string`
    },
    
    bmi: {
      sql: `bmi`,
      type: `string`
    },
    
    bldSgrCtgry: {
      sql: `bld_sgr_ctgry`,
      type: `string`
    },
    
    bpRskLvl: {
      sql: `bp_rsk_lvl`,
      type: `string`
    },
    
    bldSgrRskLvl: {
      sql: `bld_sgr_rsk_lvl`,
      type: `string`
    },
    
    dummy5: {
      sql: `dummy5`,
      type: `string`
    },
    
    dummy6: {
      sql: `dummy6`,
      type: `string`
    },
    
    dummy9: {
      sql: `dummy9`,
      type: `string`
    },
    
    cmmts: {
      sql: `cmmts`,
      type: `string`
    },
    
    exerciseFrq: {
      sql: `exercise_frq`,
      type: `string`
    },
    
    whr: {
      sql: `whr`,
      type: `string`
    },
    
    fatPcnt: {
      sql: `fat_pcnt`,
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
    
    procUpdatedAt: {
      sql: `proc_updated_at`,
      type: `time`
    },
    
    updatedAt: {
      sql: `updated_at`,
      type: `time`
    },
    
    selftestDt: {
      sql: `selftest_dt`,
      type: `time`
    },
    
    dummy10: {
      sql: `dummy10`,
      type: `time`
    },
    
    tbltCrtdAt: {
      sql: `tblt_crtd_at`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
