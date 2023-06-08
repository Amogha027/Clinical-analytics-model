cube(`HSNCodes`, {
  sql: `SELECT * FROM ebdb.\`HSN_Codes\``,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
  
  joins: {
    
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id, companyName, brandName]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    companyName: {
      sql: `${CUBE}.\`company name\``,
      type: `string`
    },
    
    brandName: {
      sql: `brand_name`,
      type: `string`
    },
    
    hsncode: {
      sql: `${CUBE}.\`HSNcode\``,
      type: `string`
    },
    
    gstTax: {
      sql: `${CUBE}.\`GST tax\``,
      type: `string`
    },
    
    cgst: {
      sql: `${CUBE}.\`CGST\``,
      type: `string`
    },
    
    sgst: {
      sql: `${CUBE}.\`SGST\``,
      type: `string`
    }
  },
  
  dataSource: `default`
});
