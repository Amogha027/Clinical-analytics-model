cube(`VaccineAppointmentDetails`, {
  sql: `SELECT * FROM ebdb.vaccine_appointment_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PatientMasters: {
      sql: `${CUBE}.patient_master_id = ${PatientMasters}.id`,
      relationship: `belongsTo`
    },
    
    VaccineMasters: {
      sql: `${CUBE}.vaccine_master_id = ${VaccineMasters}.id`,
      relationship: `belongsTo`
    },
    
    BrandMasters: {
      sql: `${CUBE}.brand_master_id = ${BrandMasters}.id`,
      relationship: `belongsTo`
    },
    
    AppointmentTrackings: {
      sql: `${CUBE}.appointment_tracking_id = ${AppointmentTrackings}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, updatesJson, createdAt, updatedAt, vaccineDate]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    certificateUrl: {
      sql: `certificate_url`,
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
    
    vaccineDate: {
      sql: `vaccine_date`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
