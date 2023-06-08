cube(`PatientGroupOrEventMappingDetails`, {
  sql: `SELECT * FROM ebdb.patient_group_or_event_mapping_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PatientMasters: {
      sql: `${CUBE}.patient_master_id = ${PatientMasters}.id`,
      relationship: `belongsTo`
    },
    
    GroupMasters: {
      sql: `${CUBE}.group_master_id = ${GroupMasters}.id`,
      relationship: `belongsTo`
    },
    
    InsuranceGroupMasters: {
      sql: `${CUBE}.group_master_id = ${InsuranceGroupMasters}.id`,
      relationship: `belongsTo`
    },
    
    QuestnrGroupMasters: {
      sql: `${CUBE}.group_master_id = ${QuestnrGroupMasters}.id`,
      relationship: `belongsTo`
    },
    
    UserGroupMasters: {
      sql: `${CUBE}.group_master_id = ${UserGroupMasters}.id`,
      relationship: `belongsTo`
    },
    
    CorporateEventMasters: {
      sql: `${CUBE}.corporate_event_master_id = ${CorporateEventMasters}.id`,
      relationship: `belongsTo`
    },
    
    EmployeeMasters: {
      sql: `${CUBE}.employee_master_id = ${EmployeeMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, updatesJson, createdAt, updatedAt, startDate, endDate]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
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
    
    startDate: {
      sql: `start_date`,
      type: `time`
    },
    
    endDate: {
      sql: `end_date`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
