cube(`JsonDataHistories`, {
  sql: `SELECT * FROM ebdb.json_data_histories`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    LocationMasters: {
      sql: `${CUBE}.location_master_id = ${LocationMasters}.id`,
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
    
    HospitalDoctors: {
      sql: `${CUBE}.hospital_doctor_id = ${HospitalDoctors}.id`,
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
    
    ScreeningCampMasters: {
      sql: `${CUBE}.screening_camp_master_id = ${ScreeningCampMasters}.id`,
      relationship: `belongsTo`
    },
    
    PatientPackageDetails: {
      sql: `${CUBE}.patient_package_detail_id = ${PatientPackageDetails}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, ptntRgstrtnId, prfOfIdntty, ethnicity, ddid, createdAt, updatedAt, visitDate, pckStartDate, pckEndDate, renewalDate, nextTestDate]
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
    
    screenTyp: {
      sql: `screen_typ`,
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
    
    nmbr: {
      sql: `nmbr`,
      type: `string`
    },
    
    phnNmbrTyp: {
      sql: `phn_nmbr_typ`,
      type: `string`
    },
    
    fthrOrSpuseNm: {
      sql: `fthr_or_spuse_nm`,
      type: `string`
    },
    
    pnCd: {
      sql: `pn_cd`,
      type: `string`
    },
    
    ptntPht: {
      sql: `ptnt_pht`,
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
    
    poiPht: {
      sql: `poi_pht`,
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
    
    prgnnt: {
      sql: `prgnnt`,
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
    
    weight: {
      sql: `weight`,
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
    
    tmprtur: {
      sql: `tmprtur`,
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
    
    haemoglobin: {
      sql: `haemoglobin`,
      type: `string`
    },
    
    hba1c: {
      sql: `hba1c`,
      type: `string`
    },
    
    prescriptionImg: {
      sql: `prescription_img`,
      type: `string`
    },
    
    dummy3: {
      sql: `dummy3`,
      type: `string`
    },
    
    dummy4: {
      sql: `dummy4`,
      type: `string`
    },
    
    dummy5: {
      sql: `dummy5`,
      type: `string`
    },
    
    cmmts: {
      sql: `cmmts`,
      type: `string`
    },
    
    encryptedPassword: {
      sql: `encrypted_password`,
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
    
    disease: {
      sql: `disease`,
      type: `string`
    },
    
    changeType: {
      sql: `change_type`,
      type: `string`
    },
    
    imeiCode: {
      sql: `imei_code`,
      type: `string`
    },
    
    flag: {
      sql: `flag`,
      type: `string`
    },
    
    saathiAccompanied: {
      sql: `saathi_accompanied`,
      type: `string`
    },
    
    referredBy: {
      sql: `referred_by`,
      type: `string`
    },
    
    totalChol: {
      sql: `total_chol`,
      type: `string`
    },
    
    hdl: {
      sql: `hdl`,
      type: `string`
    },
    
    ldl: {
      sql: `ldl`,
      type: `string`
    },
    
    t3: {
      sql: `t3`,
      type: `string`
    },
    
    t4: {
      sql: `t4`,
      type: `string`
    },
    
    tsh: {
      sql: `tsh`,
      type: `string`
    },
    
    ddid: {
      sql: `ddid`,
      type: `string`
    },
    
    famHead: {
      sql: `fam_head`,
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
    
    allergies: {
      sql: `allergies`,
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
    
    tbltCrtdAt: {
      sql: `tblt_crtd_at`,
      type: `time`
    },
    
    visitDate: {
      sql: `visit_date`,
      type: `time`
    },
    
    dummy6: {
      sql: `dummy6`,
      type: `time`
    },
    
    dummy7: {
      sql: `dummy7`,
      type: `time`
    },
    
    pckStartDate: {
      sql: `pck_start_date`,
      type: `time`
    },
    
    pckEndDate: {
      sql: `pck_end_date`,
      type: `time`
    },
    
    renewalDate: {
      sql: `renewal_date`,
      type: `time`
    },
    
    nextTestDate: {
      sql: `next_test_date`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
