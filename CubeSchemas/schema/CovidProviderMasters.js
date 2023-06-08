cube(`CovidProviderMasters`, {
  sql: `SELECT * FROM ebdb.covid_provider_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    FacilityTypeMasters: {
      sql: `${CUBE}.facility_type_master_id = ${FacilityTypeMasters}.id`,
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
    },
    
    AddressDetails: {
      sql: `${CUBE}.address_detail_id = ${AddressDetails}.id`,
      relationship: `belongsTo`
    },
    
    OrderAddressDetails: {
      sql: `${CUBE}.address_detail_id = ${OrderAddressDetails}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, providerName, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    providerName: {
      sql: `provider_name`,
      type: `string`
    },
    
    management: {
      sql: `management`,
      type: `string`
    },
    
    char1: {
      sql: `char1`,
      type: `string`
    },
    
    char2: {
      sql: `char2`,
      type: `string`
    },
    
    char3: {
      sql: `char3`,
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
