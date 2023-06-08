cube(`HospitalMasters`, {
  sql: `SELECT * FROM ebdb.hospital_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    FacilityTypeMasters: {
      sql: `${CUBE}.facility_type_master_id = ${FacilityTypeMasters}.id`,
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
      drillMembers: [id, patientIdFormat, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    hsptlNm: {
      sql: `hsptl_nm`,
      type: `string`
    },
    
    category: {
      sql: `category`,
      type: `string`
    },
    
    address: {
      sql: `address`,
      type: `string`
    },
    
    phnNmbrTyp: {
      sql: `phn_nmbr_typ`,
      type: `string`
    },
    
    nmbr: {
      sql: `nmbr`,
      type: `string`
    },
    
    logo: {
      sql: `logo`,
      type: `string`
    },
    
    wbstUrl: {
      sql: `wbst_url`,
      type: `string`
    },
    
    rgstrtonNo: {
      sql: `rgstrton_no`,
      type: `string`
    },
    
    cmmts: {
      sql: `cmmts`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
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
    
    patientIdFormat: {
      sql: `patient_id_format`,
      type: `string`
    },
    
    appLinkUrl: {
      sql: `app_link_url`,
      type: `string`
    },
    
    alertsString: {
      sql: `alerts_string`,
      type: `string`
    },
    
    management: {
      sql: `management`,
      type: `string`
    },
    
    ipNumber: {
      sql: `ip_number`,
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
    
    trmntnDt: {
      sql: `trmntn_dt`,
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
