cube(`ExpenseItemMasters`, {
  sql: `SELECT * FROM ebdb.expense_item_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    CareDeliveryProgramMasters: {
      sql: `${CUBE}.care_delivery_program_master_id = ${CareDeliveryProgramMasters}.id`,
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
      drillMembers: [id, itemName, createdAt, updatedAt]
    },
    
    subItemCount: {
      sql: `sub_item_count`,
      type: `sum`
    },
    
    totalItemPrice: {
      sql: `total_item_price`,
      type: `sum`
    },
    
    unitCost: {
      sql: `unit_cost`,
      type: `sum`
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    itemName: {
      sql: `item_name`,
      type: `string`
    },
    
    itemDesc: {
      sql: `item_desc`,
      type: `string`
    },
    
    packetType: {
      sql: `packet_type`,
      type: `string`
    },
    
    shrtNm: {
      sql: `shrt_nm`,
      type: `string`
    },
    
    recurrent: {
      sql: `recurrent`,
      type: `string`
    },
    
    supplier: {
      sql: `supplier`,
      type: `string`
    },
    
    brandNm: {
      sql: `brand_nm`,
      type: `string`
    },
    
    manufacturer: {
      sql: `manufacturer`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    picture: {
      sql: `picture`,
      type: `string`
    },
    
    hsncode: {
      sql: `hsncode`,
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
    
    effctvStartDt: {
      sql: `effctv_start_dt`,
      type: `time`
    },
    
    effctvEndDt: {
      sql: `effctv_end_dt`,
      type: `time`
    },
    
    dummy3: {
      sql: `dummy3`,
      type: `time`
    },
    
    deletedAt: {
      sql: `deleted_at`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
