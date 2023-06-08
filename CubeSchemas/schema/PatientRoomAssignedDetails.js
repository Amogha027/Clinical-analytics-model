cube(`PatientRoomAssignedDetails`, {
  sql: `SELECT * FROM ebdb.patient_room_assigned_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PatientMasters: {
      sql: `${CUBE}.patient_master_id = ${PatientMasters}.id`,
      relationship: `belongsTo`
    },
    
    ClinicRoomBedMasters: {
      sql: `${CUBE}.clinic_room_bed_master_id = ${ClinicRoomBedMasters}.id`,
      relationship: `belongsTo`
    },
    
    InPatientDetails: {
      sql: `${CUBE}.in_patient_detail_id = ${InPatientDetails}.id`,
      relationship: `belongsTo`
    },
    
    PatientTransferDetails: {
      sql: `${CUBE}.patient_transfer_detail_id = ${PatientTransferDetails}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, updatesJson, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    dummy2: {
      sql: `dummy2`,
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
    
    admissionDt: {
      sql: `admission_dt`,
      type: `time`
    },
    
    dischargeDt: {
      sql: `discharge_dt`,
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
