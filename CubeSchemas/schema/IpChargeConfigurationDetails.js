cube(`IpChargeConfigurationDetails`, {
  sql: `SELECT * FROM ebdb.ip_charge_configuration_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    ServiceMasters: {
      sql: `${CUBE}.service_master_id = ${ServiceMasters}.id`,
      relationship: `belongsTo`
    },
    
    WebsiteServiceMasters: {
      sql: `${CUBE}.service_master_id = ${WebsiteServiceMasters}.id`,
      relationship: `belongsTo`
    },
    
    BloodRequestDonorMappingMasters: {
      sql: `${CUBE}.mapping_master_id = ${BloodRequestDonorMappingMasters}.id`,
      relationship: `belongsTo`
    },
    
    CorporateUserMappingMasters: {
      sql: `${CUBE}.mapping_master_id = ${CorporateUserMappingMasters}.id`,
      relationship: `belongsTo`
    },
    
    DashboardReportMappingMasters: {
      sql: `${CUBE}.mapping_master_id = ${DashboardReportMappingMasters}.id`,
      relationship: `belongsTo`
    },
    
    DoctorHospitalUnitMappingMasters: {
      sql: `${CUBE}.mapping_master_id = ${DoctorHospitalUnitMappingMasters}.id`,
      relationship: `belongsTo`
    },
    
    FormQuestnrGroupMappingMasters: {
      sql: `${CUBE}.mapping_master_id = ${FormQuestnrGroupMappingMasters}.id`,
      relationship: `belongsTo`
    },
    
    HospitalDiagnosticLabMappingMasters: {
      sql: `${CUBE}.mapping_master_id = ${HospitalDiagnosticLabMappingMasters}.id`,
      relationship: `belongsTo`
    },
    
    HospitalPharmacyMappingMasters: {
      sql: `${CUBE}.mapping_master_id = ${HospitalPharmacyMappingMasters}.id`,
      relationship: `belongsTo`
    },
    
    HospitalReferralMappingMasters: {
      sql: `${CUBE}.mapping_master_id = ${HospitalReferralMappingMasters}.id`,
      relationship: `belongsTo`
    },
    
    HospitalSurgeryMappingMasters: {
      sql: `${CUBE}.mapping_master_id = ${HospitalSurgeryMappingMasters}.id`,
      relationship: `belongsTo`
    },
    
    LocationHospitalDieticianMappingMasters: {
      sql: `${CUBE}.mapping_master_id = ${LocationHospitalDieticianMappingMasters}.id`,
      relationship: `belongsTo`
    },
    
    LocationHospitalDoctorMappingMasters: {
      sql: `${CUBE}.mapping_master_id = ${LocationHospitalDoctorMappingMasters}.id`,
      relationship: `belongsTo`
    },
    
    LocationPhlebotomistMappingMasters: {
      sql: `${CUBE}.mapping_master_id = ${LocationPhlebotomistMappingMasters}.id`,
      relationship: `belongsTo`
    },
    
    ProgramGroupQuestnrMappingMasters: {
      sql: `${CUBE}.mapping_master_id = ${ProgramGroupQuestnrMappingMasters}.id`,
      relationship: `belongsTo`
    },
    
    QuestnrUnitMappingMasters: {
      sql: `${CUBE}.mapping_master_id = ${QuestnrUnitMappingMasters}.id`,
      relationship: `belongsTo`
    },
    
    RecommendationLogicTypeMappingMasters: {
      sql: `${CUBE}.mapping_master_id = ${RecommendationLogicTypeMappingMasters}.id`,
      relationship: `belongsTo`
    },
    
    TaxServiceMappingMasters: {
      sql: `${CUBE}.mapping_master_id = ${TaxServiceMappingMasters}.id`,
      relationship: `belongsTo`
    },
    
    TpaXlHeaderMappingMasters: {
      sql: `${CUBE}.mapping_master_id = ${TpaXlHeaderMappingMasters}.id`,
      relationship: `belongsTo`
    },
    
    WSectionMappingMasters: {
      sql: `${CUBE}.mapping_master_id = ${WSectionMappingMasters}.id`,
      relationship: `belongsTo`
    },
    
    PromoCodeServiceDetails: {
      sql: `${CUBE}.service_detail_id = ${PromoCodeServiceDetails}.id`,
      relationship: `belongsTo`
    },
    
    ClinicRoomTypeMasters: {
      sql: `${CUBE}.room_type_master_id = ${ClinicRoomTypeMasters}.id`,
      relationship: `belongsTo`
    },
    
    PartnerPaymentDetails: {
      sql: `${CUBE}.payment_detail_id = ${PartnerPaymentDetails}.id`,
      relationship: `belongsTo`
    },
    
    DepartmentMasters: {
      sql: `${CUBE}.department_master_id = ${DepartmentMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    finalPrice: {
      sql: `final_price`,
      type: `string`
    },
    
    percentIncrease: {
      sql: `percent_increase`,
      type: `string`
    },
    
    flatIncrease: {
      sql: `flat_increase`,
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
