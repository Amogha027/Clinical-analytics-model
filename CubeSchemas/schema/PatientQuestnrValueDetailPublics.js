cube(`PatientQuestnrValueDetailPublics`, {
  sql: `SELECT * FROM ebdb.patient_questnr_value_detail_publics`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PatientMasterPublics: {
      sql: `${CUBE}.patient_master_public_id = ${PatientMasterPublics}.id`,
      relationship: `belongsTo`
    },
    
    QuestnrMasters: {
      sql: `${CUBE}.questnr_master_id = ${QuestnrMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, createdAt, updatedAt, activityDate]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    resultValue: {
      sql: `result_value`,
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
    
    activityDate: {
      sql: `activity_date`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
