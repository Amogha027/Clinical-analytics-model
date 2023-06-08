cube(`DoctorPrescriptionConfigurationHeaders`, {
  sql: `SELECT * FROM ebdb.doctor_prescription_configuration_headers`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    HospitalDoctors: {
      sql: `${CUBE}.hospital_doctor_id = ${HospitalDoctors}.id`,
      relationship: `belongsTo`
    },
    
    HospitalMasters: {
      sql: `${CUBE}.hospital_master_id = ${HospitalMasters}.id`,
      relationship: `belongsTo`
    },
    
    DepartmentMasters: {
      sql: `${CUBE}.department_master_id = ${DepartmentMasters}.id`,
      relationship: `belongsTo`
    },
    
    HospitalDieticians: {
      sql: `${CUBE}.hospital_dietician_id = ${HospitalDieticians}.id`,
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
    
    PrescriptionFieldMasters: {
      sql: `${CUBE}.prescription_field_master_id = ${PrescriptionFieldMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, prescriptionFieldMasterId, dischargeSummaryFieldMasterId, hospitalIds, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    prescriptionFieldMasterId: {
      sql: `prescription_field_master_id`,
      type: `string`
    },
    
    dischargeSummaryFieldMasterId: {
      sql: `discharge_summary_field_master_id`,
      type: `string`
    },
    
    hospitalIds: {
      sql: `hospital_ids`,
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
