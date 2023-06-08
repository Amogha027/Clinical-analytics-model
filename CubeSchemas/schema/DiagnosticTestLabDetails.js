cube(`DiagnosticTestLabDetails`, {
  sql: `SELECT * FROM ebdb.diagnostic_test_lab_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
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
    
    DiagnosticLabMasters: {
      sql: `${CUBE}.diagnostic_lab_master_id = ${DiagnosticLabMasters}.id`,
      relationship: `belongsTo`
    },
    
    CareDeliveryProgramMasters: {
      sql: `${CUBE}.program_master_id = ${CareDeliveryProgramMasters}.id`,
      relationship: `belongsTo`
    },
    
    ProgramMasters: {
      sql: `${CUBE}.program_master_id = ${ProgramMasters}.id`,
      relationship: `belongsTo`
    },
    
    CustomTemplatePdfDetails: {
      sql: `${CUBE}.custom_template_pdf_detail_id = ${CustomTemplatePdfDetails}.id`,
      relationship: `belongsTo`
    },
    
    PartnerPaymentDetails: {
      sql: `${CUBE}.payment_detail_id = ${PartnerPaymentDetails}.id`,
      relationship: `belongsTo`
    },
    
    DepartmentMasters: {
      sql: `${CUBE}.department_master_id = ${DepartmentMasters}.id`,
      relationship: `belongsTo`
    },
    
    ClinicRoomTypeMasters: {
      sql: `${CUBE}.room_type_master_id = ${ClinicRoomTypeMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, testName, idealRange, customTemplatePdfDetailId, ageRangeMasterIds, organMasterIds, diseaseMasterIds, createdAt, updatedAt]
    },
    
    testAmount: {
      sql: `test_amount`,
      type: `sum`
    },
    
    maxValue: {
      sql: `max_value`,
      type: `sum`
    },
    
    minValue: {
      sql: `min_value`,
      type: `sum`
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    testName: {
      sql: `test_name`,
      type: `string`
    },
    
    labTestCode: {
      sql: `lab_test_code`,
      type: `string`
    },
    
    sampleType: {
      sql: `sample_type`,
      type: `string`
    },
    
    units: {
      sql: `units`,
      type: `string`
    },
    
    volume: {
      sql: `volume`,
      type: `string`
    },
    
    price: {
      sql: `price`,
      type: `string`
    },
    
    idealRange: {
      sql: `ideal_range`,
      type: `string`
    },
    
    technology: {
      sql: `technology`,
      type: `string`
    },
    
    methodCode: {
      sql: `method_code`,
      type: `string`
    },
    
    methodDescription: {
      sql: `method_description`,
      type: `string`
    },
    
    active: {
      sql: `active`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    fieldType: {
      sql: `field_type`,
      type: `string`
    },
    
    optionValues: {
      sql: `option_values`,
      type: `string`
    },
    
    department: {
      sql: `department`,
      type: `string`
    },
    
    haveChild: {
      sql: `have_child`,
      type: `string`
    },
    
    testType: {
      sql: `test_type`,
      type: `string`
    },
    
    customTemplatePdfDetailId: {
      sql: `custom_template_pdf_detail_id`,
      type: `string`
    },
    
    ageRangeMasterIds: {
      sql: `age_range_master_ids`,
      type: `string`
    },
    
    organMasterIds: {
      sql: `organ_master_ids`,
      type: `string`
    },
    
    diseaseMasterIds: {
      sql: `disease_master_ids`,
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
    }
  },
  
  dataSource: `default`
});
