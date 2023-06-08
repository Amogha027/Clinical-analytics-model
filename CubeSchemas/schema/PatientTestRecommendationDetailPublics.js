cube(`PatientTestRecommendationDetailPublics`, {
  sql: `SELECT * FROM ebdb.patient_test_recommendation_detail_publics`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    RecommendationTypeMasters: {
      sql: `${CUBE}.recommendation_type_master_id = ${RecommendationTypeMasters}.id`,
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
    
    UserActivityDetails: {
      sql: `${CUBE}.activity_detail_id = ${UserActivityDetails}.id`,
      relationship: `belongsTo`
    },
    
    PatientMasterPublics: {
      sql: `${CUBE}.patient_master_public_id = ${PatientMasterPublics}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, logicIds, createdAt, updatedAt, startDate, endDate]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    status: {
      sql: `status`,
      type: `string`
    },
    
    sourceInfo: {
      sql: `source_info`,
      type: `string`
    },
    
    logicIds: {
      sql: `logic_ids`,
      type: `string`
    },
    
    riskDescription: {
      sql: `risk_description`,
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
    
    startDate: {
      sql: `start_date`,
      type: `time`
    },
    
    endDate: {
      sql: `end_date`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
