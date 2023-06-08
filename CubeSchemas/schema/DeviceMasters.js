cube(`DeviceMasters`, {
  sql: `SELECT * FROM ebdb.device_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    DeviceTypeMasters: {
      sql: `${CUBE}.device_type_master_id = ${DeviceTypeMasters}.id`,
      relationship: `belongsTo`
    },
    
    HospitalMasters: {
      sql: `${CUBE}.hospital_master_id = ${HospitalMasters}.id`,
      relationship: `belongsTo`
    },
    
    SaathiMasters: {
      sql: `${CUBE}.saathi_master_id = ${SaathiMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, deviceId, deviceName, uuid, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    deviceId: {
      sql: `device_id`,
      type: `string`
    },
    
    deviceName: {
      sql: `device_name`,
      type: `string`
    },
    
    uuid: {
      sql: `uuid`,
      type: `string`
    },
    
    major: {
      sql: `major`,
      type: `string`
    },
    
    minor: {
      sql: `minor`,
      type: `string`
    },
    
    rentPerDay: {
      sql: `rent_per_day`,
      type: `string`
    },
    
    salePrice: {
      sql: `sale_price`,
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
    }
  },
  
  dataSource: `default`
});
