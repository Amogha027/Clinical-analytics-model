cube(`MedicineData`, {
  sql: `SELECT * FROM ebdb.medicine_data`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    MedicineTypeMasters: {
      sql: `${CUBE}.medicine_type_master_id = ${MedicineTypeMasters}.id`,
      relationship: `belongsTo`
    },
    
    HospitalAppointmentUnitMasters: {
      sql: `${CUBE}.unit_master_id = ${HospitalAppointmentUnitMasters}.id`,
      relationship: `belongsTo`
    },
    
    UnitMasters: {
      sql: `${CUBE}.unit_master_id = ${UnitMasters}.id`,
      relationship: `belongsTo`
    },
    
    ProductSalesChannelMasters: {
      sql: `${CUBE}.product_sales_channel_master_id = ${ProductSalesChannelMasters}.id`,
      relationship: `belongsTo`
    },
    
    GenericMasters: {
      sql: `${CUBE}.generic_master_id = ${GenericMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, brandName, genericName, createdAt, updatedAt]
    },
    
    unitPrice: {
      sql: `unit_price`,
      type: `sum`
    },
    
    cost: {
      sql: `cost`,
      type: `sum`
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    brandName: {
      sql: `brand_name`,
      type: `string`
    },
    
    brandDesc: {
      sql: `brand_desc`,
      type: `string`
    },
    
    type: {
      sql: `type`,
      type: `string`
    },
    
    route: {
      sql: `route`,
      type: `string`
    },
    
    dose: {
      sql: `dose`,
      type: `string`
    },
    
    genericName: {
      sql: `generic_name`,
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
