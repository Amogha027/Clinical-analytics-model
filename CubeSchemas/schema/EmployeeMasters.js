cube(`EmployeeMasters`, {
  sql: `SELECT * FROM ebdb.employee_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    CorpMasters: {
      sql: `${CUBE}.corp_master_id = ${CorpMasters}.id`,
      relationship: `belongsTo`
    },
    
    RfqCorpMasters: {
      sql: `${CUBE}.corp_master_id = ${RfqCorpMasters}.id`,
      relationship: `belongsTo`
    },
    
    ContactDetails: {
      sql: `${CUBE}.contact_detail_id = ${ContactDetails}.id`,
      relationship: `belongsTo`
    },
    
    ReferralContactDetails: {
      sql: `${CUBE}.contact_detail_id = ${ReferralContactDetails}.id`,
      relationship: `belongsTo`
    },
    
    TabContactDetails: {
      sql: `${CUBE}.contact_detail_id = ${TabContactDetails}.contact_detail_id`,
      relationship: `belongsTo`
    },
    
    PatientRelationshipMasters: {
      sql: `${CUBE}.patient_relationship_master_id = ${PatientRelationshipMasters}.id`,
      relationship: `belongsTo`
    },
    
    PatientMasters: {
      sql: `${CUBE}.patient_master_id = ${PatientMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, empId, uhid, city, updatesJson, createdAt, updatedAt, joiningDate, relievingDate, policyEndDate]
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
    
    gndr: {
      sql: `gndr`,
      type: `string`
    },
    
    department: {
      sql: `department`,
      type: `string`
    },
    
    maritalStatus: {
      sql: `marital_status`,
      type: `string`
    },
    
    notes: {
      sql: `notes`,
      type: `string`
    },
    
    uhid: {
      sql: `uhid`,
      type: `string`
    },
    
    policyNo: {
      sql: `policy_no`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
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
    
    designation: {
      sql: `designation`,
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
    
    dob: {
      sql: `dob`,
      type: `time`
    },
    
    joiningDate: {
      sql: `joining_date`,
      type: `time`
    },
    
    relievingDate: {
      sql: `relieving_date`,
      type: `time`
    },
    
    policyEndDate: {
      sql: `policy_end_date`,
      type: `time`
    },
    
    effctvDt: {
      sql: `effctv_dt`,
      type: `time`
    },
    
    trmntnDt: {
      sql: `trmntn_dt`,
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
