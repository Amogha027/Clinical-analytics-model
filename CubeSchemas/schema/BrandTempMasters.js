cube(`BrandTempMasters`, {
  sql: `SELECT * FROM ebdb.brand_temp_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    GenericMasters: {
      sql: `${CUBE}.generic_master_id = ${GenericMasters}.id`,
      relationship: `belongsTo`
    },
    
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
    
    TaxServiceMappingMasters: {
      sql: `${CUBE}.tax_service_mapping_master_id = ${TaxServiceMappingMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, brandName, createdAt, updatedAt]
    },
    
    unitPrice: {
      sql: `unit_price`,
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
    
    route: {
      sql: `route`,
      type: `string`
    },
    
    dose: {
      sql: `dose`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    hsncode: {
      sql: `hsncode`,
      type: `string`
    },
    
    category: {
      sql: `category`,
      type: `string`
    },
    
    mrp: {
      sql: `mrp`,
      type: `string`
    },
    
    medTime: {
      sql: `med_time`,
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
    
    dummy3: {
      sql: `dummy3`,
      type: `time`
    },
    
    deletedAt: {
      sql: `deleted_at`,
      type: `time`
    },
    
    effctvDt: {
      sql: `effctv_dt`,
      type: `time`
    },
    
    trmntnDt: {
      sql: `trmntn_dt`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
