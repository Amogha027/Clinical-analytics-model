cube(`PatientPackageDetails`, {
  sql: `SELECT * FROM ebdb.patient_package_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PackageMasters: {
      sql: `${CUBE}.package_master_id = ${PackageMasters}.id`,
      relationship: `belongsTo`
    },
    
    WebsitePackageMasters: {
      sql: `${CUBE}.package_master_id = ${WebsitePackageMasters}.id`,
      relationship: `belongsTo`
    },
    
    ServiceMasters: {
      sql: `${CUBE}.service_master_id = ${ServiceMasters}.id`,
      relationship: `belongsTo`
    },
    
    WebsiteServiceMasters: {
      sql: `${CUBE}.service_master_id = ${WebsiteServiceMasters}.id`,
      relationship: `belongsTo`
    },
    
    AppointmentTypeMasters: {
      sql: `${CUBE}.appointment_type_master_id = ${AppointmentTypeMasters}.id`,
      relationship: `belongsTo`
    },
    
    PatientMasters: {
      sql: `${CUBE}.patient_master_id = ${PatientMasters}.id`,
      relationship: `belongsTo`
    },
    
    LocationMasters: {
      sql: `${CUBE}.location_master_id = ${LocationMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      sql: `count`,
      type: `sum`
    },
    
    gapDuration: {
      sql: `gap_duration`,
      type: `sum`
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    pkgLineDesc: {
      sql: `pkg_line_desc`,
      type: `string`
    },
    
    timeCycleType: {
      sql: `time_cycle_type`,
      type: `string`
    },
    
    serviceTime: {
      sql: `service_time`,
      type: `string`
    },
    
    serviceCost: {
      sql: `service_cost`,
      type: `string`
    },
    
    minPay: {
      sql: `min_pay`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    packageType: {
      sql: `package_type`,
      type: `string`
    },
    
    gstAmt: {
      sql: `gst_amt`,
      type: `string`
    },
    
    updatesJson: {
      sql: `updates_json`,
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
    
    procUpdatedAt: {
      sql: `proc_updated_at`,
      type: `time`
    },
    
    dummy3: {
      sql: `dummy3`,
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
    
    tbltCrtdAt: {
      sql: `tblt_crtd_at`,
      type: `time`
    },
    
    aprxNextDate: {
      sql: `aprx_next_date`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
