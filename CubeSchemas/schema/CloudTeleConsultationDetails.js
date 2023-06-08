cube(`CloudTeleConsultationDetails`, {
  sql: `SELECT * FROM ebdb.cloud_tele_consultation_details`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    PatientEngagementDetails: {
      sql: `${CUBE}.patient_engagement_detail_id = ${PatientEngagementDetails}.id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, campaignName, callerId, agentName, agentid, agentUniqueId, createdAt, updatedAt, requestDatetime, receivedDatetime]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    campaignName: {
      sql: `campaign_name`,
      type: `string`
    },
    
    campaignType: {
      sql: `campaign_type`,
      type: `string`
    },
    
    callerId: {
      sql: `${CUBE}.\`caller_ID\``,
      type: `string`
    },
    
    skill: {
      sql: `skill`,
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
    
    timeToAnswer: {
      sql: `time_to_answer`,
      type: `string`
    },
    
    callDuration: {
      sql: `call_duration`,
      type: `string`
    },
    
    duration: {
      sql: `duration`,
      type: `string`
    },
    
    agentName: {
      sql: `agent_name`,
      type: `string`
    },
    
    agentid: {
      sql: `${CUBE}.\`agentID\``,
      type: `string`
    },
    
    agentPhoneNumber: {
      sql: `agent_phone_number`,
      type: `string`
    },
    
    agentUniqueId: {
      sql: `agent_unique_id`,
      type: `string`
    },
    
    agentStatus: {
      sql: `agent_status`,
      type: `string`
    },
    
    customerStatus: {
      sql: `customer_status`,
      type: `string`
    },
    
    receivedAudioPath: {
      sql: `received_audio_path`,
      type: `string`
    },
    
    savedAudioPath: {
      sql: `saved_audio_path`,
      type: `string`
    },
    
    receivedJson: {
      sql: `received_json`,
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
    
    requestDatetime: {
      sql: `request_datetime`,
      type: `time`
    },
    
    receivedDatetime: {
      sql: `received_datetime`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
