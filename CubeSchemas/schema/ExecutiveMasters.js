cube(`ExecutiveMasters`, {
  sql: `SELECT * FROM ebdb.executive_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    CityMasters: {
      sql: `${CUBE}.city_master_id = ${CityMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, prfOfIdntty, execPhtFileName, execPoiPhtFileName, createdAt, updatedAt, execPhtUpdatedAt, execPoiPhtUpdatedAt, archivedById]
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
    
    notes: {
      sql: `notes`,
      type: `string`
    },
    
    execPhtFileName: {
      sql: `exec_pht_file_name`,
      type: `string`
    },
    
    execPhtContentType: {
      sql: `exec_pht_content_type`,
      type: `string`
    },
    
    execPoiPhtFileName: {
      sql: `exec_poi_pht_file_name`,
      type: `string`
    },
    
    execPoiPhtContentType: {
      sql: `exec_poi_pht_content_type`,
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
    
    execPhtUpdatedAt: {
      sql: `exec_pht_updated_at`,
      type: `time`
    },
    
    execPoiPhtUpdatedAt: {
      sql: `exec_poi_pht_updated_at`,
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
    
    archivedById: {
      sql: `archived_by_id`,
      type: `time`
    },
    
    archivedAt: {
      sql: `archived_at`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
