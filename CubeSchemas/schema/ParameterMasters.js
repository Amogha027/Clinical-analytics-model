cube(`ParameterMasters`, {
  sql: `SELECT * FROM ebdb.parameter_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    FieldTypeMasters: {
      sql: `${CUBE}.field_type_master_id = ${FieldTypeMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, parameterName, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    parameterName: {
      sql: `parameter_name`,
      type: `string`
    },
    
    parameterDesc: {
      sql: `parameter_desc`,
      type: `string`
    },
    
    columnDesc: {
      sql: `column_desc`,
      type: `string`
    },
    
    options: {
      sql: `options`,
      type: `string`
    },
    
    parameterType: {
      sql: `parameter_type`,
      type: `string`
    },
    
    createdAt: {
      sql: `created_at`,
      type: `time`
    },
    
    updatedAt: {
      sql: `updated_at`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
