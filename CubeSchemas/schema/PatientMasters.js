cube(`PatientMasters`, {
  sql: `SELECT * FROM ebdb.patient_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    LocationMasters: {
      sql: `${CUBE}.location_master_id = ${LocationMasters}.id`,
      relationship: `belongsTo`
    },
    
    CareDeliveryProgramMasters: {
      sql: `${CUBE}.program_master_id = ${CareDeliveryProgramMasters}.id`,
      relationship: `belongsTo`
    },
    
    ProgramMasters: {
      sql: `${CUBE}.program_master_id = ${ProgramMasters}.id`,
      relationship: `belongsTo`
    },
    
    ClaimStatusMasters: {
      sql: `${CUBE}.status_master_id = ${ClaimStatusMasters}.id`,
      relationship: `belongsTo`
    },
    
    DeliveryStatusMasters: {
      sql: `${CUBE}.status_master_id = ${DeliveryStatusMasters}.id`,
      relationship: `belongsTo`
    },
    
    GlobalStatusMasters: {
      sql: `${CUBE}.status_master_id = ${GlobalStatusMasters}.id`,
      relationship: `belongsTo`
    },
    
    OrderCartStatusMasters: {
      sql: `${CUBE}.status_master_id = ${OrderCartStatusMasters}.id`,
      relationship: `belongsTo`
    },
    
    StatusMasters: {
      sql: `${CUBE}.status_master_id = ${StatusMasters}.id`,
      relationship: `belongsTo`
    },
    
    RenewalGroups: {
      sql: `${CUBE}.renewal_group_id = ${RenewalGroups}.id`,
      relationship: `belongsTo`
    },
    
    PackageMasters: {
      sql: `${CUBE}.package_master_id = ${PackageMasters}.id`,
      relationship: `belongsTo`
    },
    
    WebsitePackageMasters: {
      sql: `${CUBE}.package_master_id = ${WebsitePackageMasters}.id`,
      relationship: `belongsTo`
    },
    
    PatientPackageDetails: {
      sql: `${CUBE}.patient_package_detail_id = ${PatientPackageDetails}.id`,
      relationship: `belongsTo`
    },
    
    CategoryLocationProgramMapingMasters: {
      sql: `${CUBE}.location_program_maping_master_id = ${CategoryLocationProgramMapingMasters}.id`,
      relationship: `belongsTo`
    },
    
    LocationProgramMapingMasters: {
      sql: `${CUBE}.location_program_maping_master_id = ${LocationProgramMapingMasters}.id`,
      relationship: `belongsTo`
    },
    
    CountryMasters: {
      sql: `${CUBE}.country_master_id = ${CountryMasters}.id`,
      relationship: `belongsTo`
    },
    
    ScreeningCampMasters: {
      sql: `${CUBE}.screening_camp_master_id = ${ScreeningCampMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, ptntRgstrtnId, title, prfOfIdntty, ethnicity, vitalQuestionIds, createdAt, updatedAt, procUpdatedAt, nextTestDate, renewalDate]
    },
    
    interactionCount: {
      sql: `interaction_count`,
      type: `sum`
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    ptntRgstrtnId: {
      sql: `ptnt_rgstrtn_id`,
      type: `string`
    },
    
    title: {
      sql: `title`,
      type: `string`
    },
    
    frstNm: {
      sql: `frst_nm`,
      type: `string`
    },
    
    mdlNm: {
      sql: `mdl_nm`,
      type: `string`
    },
    
    lstNm: {
      sql: `lst_nm`,
      type: `string`
    },
    
    suffix: {
      sql: `suffix`,
      type: `string`
    },
    
    dsplyNm: {
      sql: `dsply_nm`,
      type: `string`
    },
    
    dobVerified: {
      sql: `dob_verified`,
      type: `string`
    },
    
    gndr: {
      sql: `gndr`,
      type: `string`
    },
    
    addrss: {
      sql: `addrss`,
      type: `string`
    },
    
    email: {
      sql: `email`,
      type: `string`
    },
    
    phnNmbrTyp: {
      sql: `phn_nmbr_typ`,
      type: `string`
    },
    
    nmbr: {
      sql: `nmbr`,
      type: `string`
    },
    
    fthrOrSpuseNm: {
      sql: `fthr_or_spuse_nm`,
      type: `string`
    },
    
    poiType: {
      sql: `poi_type`,
      type: `string`
    },
    
    prfOfIdntty: {
      sql: `prf_of_idntty`,
      type: `string`
    },
    
    ethnicity: {
      sql: `ethnicity`,
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
    
    onMdctn: {
      sql: `on_mdctn`,
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
    
    dbtsFam: {
      sql: `dbts_fam`,
      type: `string`
    },
    
    hyptnFam: {
      sql: `hyptn_fam`,
      type: `string`
    },
    
    bldGrp: {
      sql: `bld_grp`,
      type: `string`
    },
    
    bldGrpRhFctr: {
      sql: `bld_grp_rh_fctr`,
      type: `string`
    },
    
    nsfEnrlld: {
      sql: `nsf_enrlld`,
      type: `string`
    },
    
    disease: {
      sql: `disease`,
      type: `string`
    },
    
    cmmts: {
      sql: `cmmts`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    reference: {
      sql: `reference`,
      type: `string`
    },
    
    famHead: {
      sql: `fam_head`,
      type: `string`
    },
    
    allergies: {
      sql: `allergies`,
      type: `string`
    },
    
    profession: {
      sql: `profession`,
      type: `string`
    },
    
    vitalQuestionIds: {
      sql: `vital_question_ids`,
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
    
    procUpdatedAt: {
      sql: `proc_updated_at`,
      type: `time`
    },
    
    dob: {
      sql: `dob`,
      type: `time`
    },
    
    nsfJoinDt: {
      sql: `nsf_join_dt`,
      type: `time`
    },
    
    trmntnDt: {
      sql: `trmntn_dt`,
      type: `time`
    },
    
    dummy3: {
      sql: `dummy3`,
      type: `time`
    },
    
    nextTestDate: {
      sql: `next_test_date`,
      type: `time`
    },
    
    tbltCrtdAt: {
      sql: `tblt_crtd_at`,
      type: `time`
    },
    
    renewalDate: {
      sql: `renewal_date`,
      type: `time`
    },
    
    archivedAt: {
      sql: `archived_at`,
      type: `time`
    },
    
    effctvDt: {
      sql: `effctv_dt`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
