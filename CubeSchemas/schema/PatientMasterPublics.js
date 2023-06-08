cube(`PatientMasterPublics`, {
  sql: `SELECT * FROM ebdb.patient_master_publics`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    FormMasters: {
      sql: `${CUBE}.form_master_id = ${FormMasters}.id`,
      relationship: `belongsTo`
    },
    
    CountryMasters: {
      sql: `${CUBE}.country_master_id = ${CountryMasters}.id`,
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
    
    AddressDetails: {
      sql: `${CUBE}.address_detail_id = ${AddressDetails}.id`,
      relationship: `belongsTo`
    },
    
    OrderAddressDetails: {
      sql: `${CUBE}.address_detail_id = ${OrderAddressDetails}.id`,
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
      drillMembers: [id, prfOfIdntty, createdAt, updatedAt]
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
    
    gndr: {
      sql: `gndr`,
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
    
    fthrOrSpuseNm: {
      sql: `fthr_or_spuse_nm`,
      type: `string`
    },
    
    prfOfIdntty: {
      sql: `prf_of_idntty`,
      type: `string`
    },
    
    smoking: {
      sql: `smoking`,
      type: `string`
    },
    
    bldGrp: {
      sql: `bld_grp`,
      type: `string`
    },
    
    cmmts: {
      sql: `cmmts`,
      type: `string`
    },
    
    profession: {
      sql: `profession`,
      type: `string`
    },
    
    hghtFt: {
      sql: `hght_ft`,
      type: `string`
    },
    
    hghtIn: {
      sql: `hght_in`,
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
    }
  },
  
  dataSource: `default`
});
