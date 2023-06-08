cube(`PackageMasters`, {
  sql: `SELECT * FROM ebdb.package_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    CareDeliveryProgramMasters: {
      sql: `${CUBE}.care_delivery_program_master_id = ${CareDeliveryProgramMasters}.id`,
      relationship: `belongsTo`
    },
    
    WebsiteMasters: {
      sql: `${CUBE}.website_master_id = ${WebsiteMasters}.id`,
      relationship: `belongsTo`
    },
    
    ChargeCodeMasters: {
      sql: `${CUBE}.charge_code_master_id = ${ChargeCodeMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, clinicIds, packageGroupName, packageActionName, metaTitle, createdAt, updatedAt, startDate, endDate]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    pckgNm: {
      sql: `pckg_nm`,
      type: `string`
    },
    
    pckgDesc: {
      sql: `pckg_desc`,
      type: `string`
    },
    
    price: {
      sql: `price`,
      type: `string`
    },
    
    packageCost: {
      sql: `package_cost`,
      type: `string`
    },
    
    clinicIds: {
      sql: `clinic_ids`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    gstAmt: {
      sql: `gst_amt`,
      type: `string`
    },
    
    totalAmt: {
      sql: `total_amt`,
      type: `string`
    },
    
    actualPrice: {
      sql: `actual_price`,
      type: `string`
    },
    
    packageGroupName: {
      sql: `package_group_name`,
      type: `string`
    },
    
    packageGroupIconUrl: {
      sql: `package_group_icon_url`,
      type: `string`
    },
    
    packageImageUrl: {
      sql: `package_image_url`,
      type: `string`
    },
    
    packageContent: {
      sql: `package_content`,
      type: `string`
    },
    
    packageActionName: {
      sql: `package_action_name`,
      type: `string`
    },
    
    packageActionPath: {
      sql: `package_action_path`,
      type: `string`
    },
    
    faqs: {
      sql: `faqs`,
      type: `string`
    },
    
    metaTitle: {
      sql: `meta_title`,
      type: `string`
    },
    
    subPckgMetaDesc: {
      sql: `sub_pckg_meta_desc`,
      type: `string`
    },
    
    customUrl: {
      sql: `custom_url`,
      type: `string`
    },
    
    appImg: {
      sql: `app_img`,
      type: `string`
    },
    
    appBgColor: {
      sql: `app_bg_color`,
      type: `string`
    },
    
    ogImage: {
      sql: `og_image`,
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
    },
    
    dummy3: {
      sql: `dummy3`,
      type: `time`
    },
    
    archivedAt: {
      sql: `archived_at`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
