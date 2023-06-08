cube(`DemographicDetails`, {
  sql: `SELECT * FROM ebdb.demographic_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    CategoryLocationProgramMapingMasters: {
      sql: `${CUBE}.location_program_maping_master_id = ${CategoryLocationProgramMapingMasters}.id`,
      relationship: `belongsTo`
    },
    
    LocationProgramMapingMasters: {
      sql: `${CUBE}.location_program_maping_master_id = ${LocationProgramMapingMasters}.id`,
      relationship: `belongsTo`
    },
    
    PatientRelationshipMasters: {
      sql: `${CUBE}.patient_relationship_master_id = ${PatientRelationshipMasters}.id`,
      relationship: `belongsTo`
    },
    
    RfqInsurancePolicyDetails: {
      sql: `${CUBE}.rfq_insurance_policy_detail_id = ${RfqInsurancePolicyDetails}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, empId, city, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    empId: {
      sql: `emp_id`,
      type: `string`
    },
    
    frstNm: {
      sql: `frst_nm`,
      type: `string`
    },
    
    lstNm: {
      sql: `lst_nm`,
      type: `string`
    },
    
    fthrOrSpuseNm: {
      sql: `fthr_or_spuse_nm`,
      type: `string`
    },
    
    email: {
      sql: `email`,
      type: `string`
    },
    
    mobile: {
      sql: `mobile`,
      type: `string`
    },
    
    gndr: {
      sql: `gndr`,
      type: `string`
    },
    
    department: {
      sql: `department`,
      type: `string`
    },
    
    designation: {
      sql: `designation`,
      type: `string`
    },
    
    cmpnyNm: {
      sql: `cmpny_nm`,
      type: `string`
    },
    
    adrsLine1: {
      sql: `adrs_line1`,
      type: `string`
    },
    
    adrsLine2: {
      sql: `adrs_line2`,
      type: `string`
    },
    
    landmark: {
      sql: `landmark`,
      type: `string`
    },
    
    area: {
      sql: `area`,
      type: `string`
    },
    
    city: {
      sql: `city`,
      type: `string`
    },
    
    pin: {
      sql: `pin`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    bldGrp: {
      sql: `bld_grp`,
      type: `string`
    },
    
    isDbts: {
      sql: `is_dbts`,
      type: `string`
    },
    
    isHyptn: {
      sql: `is_hyptn`,
      type: `string`
    },
    
    otherDiseases: {
      sql: `other_diseases`,
      type: `string`
    },
    
    hrtAttck: {
      sql: `hrt_attck`,
      type: `string`
    },
    
    smoking: {
      sql: `smoking`,
      type: `string`
    },
    
    exerciseFrq: {
      sql: `exercise_frq`,
      type: `string`
    },
    
    prgnnt: {
      sql: `prgnnt`,
      type: `string`
    },
    
    hyptnFam: {
      sql: `hyptn_fam`,
      type: `string`
    },
    
    dbtsFam: {
      sql: `dbts_fam`,
      type: `string`
    },
    
    dizzy: {
      sql: `dizzy`,
      type: `string`
    },
    
    dryTnge: {
      sql: `dry_tnge`,
      type: `string`
    },
    
    nmbnss: {
      sql: `nmbnss`,
      type: `string`
    },
    
    sumInsured: {
      sql: `sum_insured`,
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
    
    dob: {
      sql: `dob`,
      type: `time`
    },
    
    dummy3: {
      sql: `dummy3`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
