cube(`HospitalSurgeryMappingMasters`, {
  sql: `SELECT * FROM ebdb.hospital_surgery_mapping_masters`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    Icd10PcsCodeMasters: {
      sql: `${CUBE}.icd10_pcs_code_master_id = ${Icd10PcsCodeMasters}.id`,
      relationship: `belongsTo`
    },
    
    HospitalMasters: {
      sql: `${CUBE}.hospital_master_id = ${HospitalMasters}.id`,
      relationship: `belongsTo`
    },
    
    RoleMasters: {
      sql: `${CUBE}.role_master_id = ${RoleMasters}.id`,
      relationship: `belongsTo`
    },
    
    SurgeryMasters: {
      sql: `${CUBE}.surgery_master_id = ${SurgeryMasters}.id`,
      relationship: `belongsTo`
    },
    
    PartnerPaymentDetails: {
      sql: `${CUBE}.payment_detail_id = ${PartnerPaymentDetails}.id`,
      relationship: `belongsTo`
    },
    
    ChargeCodeMasters: {
      sql: `${CUBE}.charge_code_master_id = ${ChargeCodeMasters}.id`,
      relationship: `belongsTo`
    },
    
    ClinicRoomTypeMasters: {
      sql: `${CUBE}.room_type_master_id = ${ClinicRoomTypeMasters}.id`,
      relationship: `belongsTo`
    },
    
    DepartmentMasters: {
      sql: `${CUBE}.department_master_id = ${DepartmentMasters}.id`,
      relationship: `belongsTo`
    },
    
    CustomTemplatePdfDetails: {
      sql: `${CUBE}.custom_template_pdf_detail_id = ${CustomTemplatePdfDetails}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, hospitalProcedureName, serviceId, createdAt, updatedAt]
    },
    
    price: {
      sql: `price`,
      type: `sum`
    },
    
    approxDuration: {
      sql: `approx_duration`,
      type: `sum`
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    hospitalProcedureName: {
      sql: `hospital_procedure_name`,
      type: `string`
    },
    
    serviceId: {
      sql: `service_id`,
      type: `string`
    },
    
    alias: {
      sql: `alias`,
      type: `string`
    },
    
    icdCode: {
      sql: `icd_code`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
      type: `string`
    },
    
    advAdmitHours: {
      sql: `adv_admit_hours`,
      type: `string`
    },
    
    expectedAdmitHours: {
      sql: `expected_admit_hours`,
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
    
    effctvDt: {
      sql: `effctv_dt`,
      type: `time`
    },
    
    trmntnDt: {
      sql: `trmntn_dt`,
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
