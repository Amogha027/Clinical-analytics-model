cube(`PatientFamilyMemberDetails`, {
  sql: `SELECT * FROM ebdb.patient_family_member_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PatientMasters: {
      sql: `${CUBE}.patient_master_id = ${PatientMasters}.id`,
      relationship: `belongsTo`
    },
    
    PatientRelationshipMasters: {
      sql: `${CUBE}.patient_relationship_master_id = ${PatientRelationshipMasters}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, updatesJson, createdAt, updatedAt, activeTillDate]
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
    
    archivedAt: {
      sql: `archived_at`,
      type: `time`
    },
    
    activeTillDate: {
      sql: `active_till_date`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
