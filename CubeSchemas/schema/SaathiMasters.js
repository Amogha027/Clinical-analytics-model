cube(`SaathiMasters`, {
  sql: `SELECT * FROM ebdb.saathi_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    LocationMasters: {
      sql: `${CUBE}.location_master_id = ${LocationMasters}.id`,
      relationship: `belongsTo`
    },
    
    ServiceMasters: {
      sql: `${CUBE}.service_master_id = ${ServiceMasters}.id`,
      relationship: `belongsTo`
    },
    
    WebsiteServiceMasters: {
      sql: `${CUBE}.service_master_id = ${WebsiteServiceMasters}.id`,
      relationship: `belongsTo`
    },
    
    ExecutiveMasters: {
      sql: `${CUBE}.executive_master_id = ${ExecutiveMasters}.id`,
      relationship: `belongsTo`
    },
    
    CareDeliveryProgramMasters: {
      sql: `${CUBE}.care_delivery_program_master_id = ${CareDeliveryProgramMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, prfOfIdntty, saathiPhtFileName, saathiPoiPhtFileName, createdAt, updatedAt, saathiPhtUpdatedAt, saathiPoiPhtUpdatedAt]
    },
    
    slotDuration: {
      sql: `slot_duration`,
      type: `sum`
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
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
    
    basicSal: {
      sql: `basic_sal`,
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
    
    maritalStatus: {
      sql: `marital_status`,
      type: `string`
    },
    
    education: {
      sql: `education`,
      type: `string`
    },
    
    trainingModules: {
      sql: `training_modules`,
      type: `string`
    },
    
    cmmts: {
      sql: `cmmts`,
      type: `string`
    },
    
    saathiPhtFileName: {
      sql: `saathi_pht_file_name`,
      type: `string`
    },
    
    saathiPhtContentType: {
      sql: `saathi_pht_content_type`,
      type: `string`
    },
    
    saathiPoiPhtFileName: {
      sql: `saathi_poi_pht_file_name`,
      type: `string`
    },
    
    saathiPoiPhtContentType: {
      sql: `saathi_poi_pht_content_type`,
      type: `string`
    },
    
    experience: {
      sql: `experience`,
      type: `string`
    },
    
    description: {
      sql: `description`,
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
    
    saathiPhtUpdatedAt: {
      sql: `saathi_pht_updated_at`,
      type: `time`
    },
    
    saathiPoiPhtUpdatedAt: {
      sql: `saathi_poi_pht_updated_at`,
      type: `time`
    },
    
    dob: {
      sql: `dob`,
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
    }
  },
  
  dataSource: `default`
});
