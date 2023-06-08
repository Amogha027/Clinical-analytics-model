cube(`ScreeningCampMasters`, {
  sql: `SELECT * FROM ebdb.screening_camp_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    CareDeliveryProgramMasters: {
      sql: `${CUBE}.program_master_id = ${CareDeliveryProgramMasters}.id`,
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
    
    LocationMasters: {
      sql: `${CUBE}.location_master_id = ${LocationMasters}.id`,
      relationship: `belongsTo`
    },
    
    ExecutiveMasters: {
      sql: `${CUBE}.executive_master_id = ${ExecutiveMasters}.id`,
      relationship: `belongsTo`
    },
    
    DiagnosticTestMasters: {
      sql: `${CUBE}.diagnostic_test_master_id = ${DiagnosticTestMasters}.id`,
      relationship: `belongsTo`
    },
    
    DieticianFavouriteDiagnosticTestMasters: {
      sql: `${CUBE}.diagnostic_test_master_id = ${DieticianFavouriteDiagnosticTestMasters}.diagnostic_test_master_id`,
      relationship: `belongsTo`
    },
    
    DoctorFavouriteDiagnosticTestMasters: {
      sql: `${CUBE}.diagnostic_test_master_id = ${DoctorFavouriteDiagnosticTestMasters}.diagnostic_test_master_id`,
      relationship: `belongsTo`
    },
    
    ProgramMasters: {
      sql: `${CUBE}.program_master_id = ${ProgramMasters}.id`,
      relationship: `belongsTo`
    },
    
    ProgramEventDetails: {
      sql: `${CUBE}.program_event_detail_id = ${ProgramEventDetails}.id`,
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
      drillMembers: [id, activityDetailIds, campName, sponsorName, programMasterId, recIds, createdAt, updatedAt, screeningStartDate, screeningEndDate]
    },
    
    tentCost: {
      sql: `tent_cost`,
      type: `sum`
    },
    
    snacksCost: {
      sql: `snacks_cost`,
      type: `sum`
    },
    
    adminCost: {
      sql: `admin_cost`,
      type: `sum`
    },
    
    saathiCost: {
      sql: `saathi_cost`,
      type: `sum`
    },
    
    shCount: {
      sql: `sh_count`,
      type: `sum`
    },
    
    riCount: {
      sql: `ri_count`,
      type: `sum`
    },
    
    rcCount: {
      sql: `rc_count`,
      type: `sum`
    },
    
    dcCount: {
      sql: `dc_count`,
      type: `sum`
    },
    
    slotDuration: {
      sql: `slot_duration`,
      type: `sum`
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    activityDetailIds: {
      sql: `activity_detail_ids`,
      type: `string`
    },
    
    campName: {
      sql: `camp_name`,
      type: `string`
    },
    
    sponsorName: {
      sql: `sponsor_name`,
      type: `string`
    },
    
    startTime: {
      sql: `start_time`,
      type: `string`
    },
    
    endTime: {
      sql: `end_time`,
      type: `string`
    },
    
    doctorAttended: {
      sql: `doctor_attended`,
      type: `string`
    },
    
    cmmts: {
      sql: `cmmts`,
      type: `string`
    },
    
    programMasterId: {
      sql: `program_master_id`,
      type: `string`
    },
    
    recIds: {
      sql: `rec_ids`,
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
    
    screeningStartDate: {
      sql: `screening_start_date`,
      type: `time`
    },
    
    screeningEndDate: {
      sql: `screening_end_date`,
      type: `time`
    },
    
    archivedAt: {
      sql: `archived_at`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
