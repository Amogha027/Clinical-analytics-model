cube(`DiseaseManagementDetails`, {
  sql: `SELECT * FROM ebdb.disease_management_details`,
  
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
      drillMembers: [id, blogIds, packageIds, labIds, metaTitle, formId, createdAt, updatedAt]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    bannerUrl: {
      sql: `banner_url`,
      type: `string`
    },
    
    diseaseDesc: {
      sql: `disease_desc`,
      type: `string`
    },
    
    blogIds: {
      sql: `blog_ids`,
      type: `string`
    },
    
    packageIds: {
      sql: `package_ids`,
      type: `string`
    },
    
    labIds: {
      sql: `lab_ids`,
      type: `string`
    },
    
    comments: {
      sql: `comments`,
      type: `string`
    },
    
    metaTitle: {
      sql: `meta_title`,
      type: `string`
    },
    
    metaDescription: {
      sql: `meta_description`,
      type: `string`
    },
    
    ogImage: {
      sql: `og_image`,
      type: `string`
    },
    
    color: {
      sql: `color`,
      type: `string`
    },
    
    customUrl: {
      sql: `custom_url`,
      type: `string`
    },
    
    formId: {
      sql: `form_id`,
      type: `string`
    },
    
    dssImg: {
      sql: `dss_img`,
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
