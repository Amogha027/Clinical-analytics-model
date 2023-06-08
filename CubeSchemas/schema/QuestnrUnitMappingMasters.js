cube(`QuestnrUnitMappingMasters`, {
  sql: `SELECT * FROM ebdb.questnr_unit_mapping_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    QuestnrMasters: {
      sql: `${CUBE}.questnr_master_id = ${QuestnrMasters}.id`,
      relationship: `belongsTo`
    },
    
    HospitalAppointmentUnitMasters: {
      sql: `${CUBE}.unit_master_id = ${HospitalAppointmentUnitMasters}.id`,
      relationship: `belongsTo`
    },
    
    UnitMasters: {
      sql: `${CUBE}.unit_master_id = ${UnitMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    baseToUnitLogic: {
      sql: `base_to_unit_logic`,
      type: `string`
    },
    
    unitToBaseLogic: {
      sql: `unit_to_base_logic`,
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
