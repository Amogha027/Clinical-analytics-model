cube(`DoctorPersonalizedRecommendationDetails`, {
  sql: `SELECT * FROM ebdb.doctor_personalized_recommendation_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PatientMasters: {
      sql: `${CUBE}.patient_master_id = ${PatientMasters}.id`,
      relationship: `belongsTo`
    },
    
    DoctorMasters: {
      sql: `${CUBE}.doctor_master_id = ${DoctorMasters}.id`,
      relationship: `belongsTo`
    },
    
    BreastCancerScreeningDetails: {
      sql: `${CUBE}.screening_detail_id = ${BreastCancerScreeningDetails}.screening_detail_id`,
      relationship: `belongsTo`
    },
    
    CervicalCancerScreeningDetails: {
      sql: `${CUBE}.screening_detail_id = ${CervicalCancerScreeningDetails}.screening_detail_id`,
      relationship: `belongsTo`
    },
    
    OralCancerScreeningDetails: {
      sql: `${CUBE}.screening_detail_id = ${OralCancerScreeningDetails}.screening_detail_id`,
      relationship: `belongsTo`
    },
    
    ProstateCancerScreeningDetails: {
      sql: `${CUBE}.screening_detail_id = ${ProstateCancerScreeningDetails}.screening_detail_id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, updatesJson, createdAt, updatedAt, recommendedDate]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    doctorRecommended: {
      sql: `doctor_recommended`,
      type: `string`
    },
    
    dietRecommended: {
      sql: `diet_recommended`,
      type: `string`
    },
    
    exerciseRecommended: {
      sql: `exercise_recommended`,
      type: `string`
    },
    
    otherRecommended: {
      sql: `other_recommended`,
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
    
    recommendedDate: {
      sql: `recommended_date`,
      type: `time`
    },
    
    archivedAt: {
      sql: `archived_at`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
