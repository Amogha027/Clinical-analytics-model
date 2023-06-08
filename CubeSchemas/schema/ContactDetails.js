cube(`ContactDetails`, {
  sql: `SELECT * FROM ebdb.contact_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    CountryMasters: {
      sql: `${CUBE}.country_master_id = ${CountryMasters}.id`,
      relationship: `belongsTo`
    },
    
    RfqCorpMasters: {
      sql: `${CUBE}.corp_master_id = ${RfqCorpMasters}.id`,
      relationship: `belongsTo`
    },
    
    CorpMasters: {
      sql: `${CUBE}.corp_master_id = ${CorpMasters}.id`,
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
      drillMembers: [id, updatesJson, createdAt, updatedAt]
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
    
    phnNmbrTyp: {
      sql: `phn_nmbr_typ`,
      type: `string`
    },
    
    nmbr: {
      sql: `nmbr`,
      type: `string`
    },
    
    fax: {
      sql: `fax`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    email: {
      sql: `email`,
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
