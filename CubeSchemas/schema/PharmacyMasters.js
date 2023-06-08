cube(`PharmacyMasters`, {
  sql: `SELECT * FROM ebdb.pharmacy_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    CareDeliveryProgramMasters: {
      sql: `${CUBE}.care_delivery_program_master_id = ${CareDeliveryProgramMasters}.id`,
      relationship: `belongsTo`
    },
    
    AddressDetails: {
      sql: `${CUBE}.address_detail_id = ${AddressDetails}.id`,
      relationship: `belongsTo`
    },
    
    OrderAddressDetails: {
      sql: `${CUBE}.address_detail_id = ${OrderAddressDetails}.id`,
      relationship: `belongsTo`
    },
    
    ContactDetails: {
      sql: `${CUBE}.contact_detail_id = ${ContactDetails}.id`,
      relationship: `belongsTo`
    },
    
    ReferralContactDetails: {
      sql: `${CUBE}.contact_detail_id = ${ReferralContactDetails}.id`,
      relationship: `belongsTo`
    },
    
    TabContactDetails: {
      sql: `${CUBE}.contact_detail_id = ${TabContactDetails}.contact_detail_id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, pharmacyName, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    pharmacyName: {
      sql: `pharmacy_name`,
      type: `string`
    },
    
    pharmacyLicenseCode: {
      sql: `pharmacy_license_code`,
      type: `string`
    },
    
    headerImgUrl: {
      sql: `header_img_url`,
      type: `string`
    },
    
    footerImgUrl: {
      sql: `footer_img_url`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    invoiceImgUrl: {
      sql: `invoice_img_url`,
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
