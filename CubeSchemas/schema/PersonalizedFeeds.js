cube(`PersonalizedFeeds`, {
  sql: `SELECT * FROM ebdb.personalized_feeds`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    DieticianFavouriteSymptomsDiseaseMasters: {
      sql: `${CUBE}.disease_master_id = ${DieticianFavouriteSymptomsDiseaseMasters}.disease_master_id`,
      relationship: `belongsTo`
    },
    
    DiseaseMasters: {
      sql: `${CUBE}.disease_master_id = ${DiseaseMasters}.id`,
      relationship: `belongsTo`
    },
    
    DoctorFavouriteSymptomsDiseaseMasters: {
      sql: `${CUBE}.disease_master_id = ${DoctorFavouriteSymptomsDiseaseMasters}.disease_master_id`,
      relationship: `belongsTo`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, title, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    feedUrl: {
      sql: `feed_url`,
      type: `string`
    },
    
    title: {
      sql: `title`,
      type: `string`
    },
    
    feedDesc: {
      sql: `feed_desc`,
      type: `string`
    },
    
    imageUrl: {
      sql: `image_url`,
      type: `string`
    },
    
    dummy2: {
      sql: `dummy2`,
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
    },
    
    deletedAt: {
      sql: `deleted_at`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
