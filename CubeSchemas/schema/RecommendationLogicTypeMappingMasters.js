cube(`RecommendationLogicTypeMappingMasters`, {
  sql: `SELECT * FROM ebdb.recommendation_logic_type_mapping_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    CareDeliveryProgramMasters: {
      sql: `${CUBE}.program_master_id = ${CareDeliveryProgramMasters}.id`,
      relationship: `belongsTo`
    },
    
    ProgramMasters: {
      sql: `${CUBE}.program_master_id = ${ProgramMasters}.id`,
      relationship: `belongsTo`
    },
    
    RecommendationLogicMasters: {
      sql: `${CUBE}.recommendation_logic_master_id = ${RecommendationLogicMasters}.id`,
      relationship: `belongsTo`
    },
    
    RecommendationTypeMasters: {
      sql: `${CUBE}.recommendation_type_master_id = ${RecommendationTypeMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, sourceName, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    sourceType: {
      sql: `source_type`,
      type: `string`
    },
    
    sourceName: {
      sql: `source_name`,
      type: `string`
    },
    
    reason: {
      sql: `reason`,
      type: `string`
    },
    
    riskDescription: {
      sql: `risk_description`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
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
