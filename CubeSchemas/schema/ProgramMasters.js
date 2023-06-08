cube(`ProgramMasters`, {
  sql: `SELECT * FROM ebdb.program_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PatientCategoryMasters: {
      sql: `${CUBE}.patient_category_master_id = ${PatientCategoryMasters}.id`,
      relationship: `belongsTo`
    },
    
    FormMasters: {
      sql: `${CUBE}.form_master_id = ${FormMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, programName, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    programName: {
      sql: `program_name`,
      type: `string`
    },
    
    programComp: {
      sql: `program_comp`,
      type: `string`
    },
    
    programOwner: {
      sql: `program_owner`,
      type: `string`
    },
    
    logoUrl: {
      sql: `logo_url`,
      type: `string`
    },
    
    desc: {
      sql: `desc`,
      type: `string`
    },
    
    events: {
      sql: `events`,
      type: `string`
    },
    
    authenticationToken: {
      sql: `authentication_token`,
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
    
    startDt: {
      sql: `start_dt`,
      type: `time`
    },
    
    endAt: {
      sql: `end_at`,
      type: `time`
    },
    
    archivedAt: {
      sql: `archived_at`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
