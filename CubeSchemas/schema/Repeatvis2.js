cube(`RepeatVisits2`, {
	sql: `SELECT COUNT(*) AS CNT, RV.patient_master_id AS PMID from ${RepeatVisits.sql()} AS RV GROUP BY PMID`,
	preAggregations: {// Pre-Aggregations definitions go here
	  // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
	},
	joins: {
		RepeatVisits:{
			relationship:`hasMany`,
			sql: `${CUBE}.PMID = ${RepeatVisits.patient_id}`,
		}
	},
	measures: {
	 
	},
	dimensions: {
		cnt: {
			sql: `CNT`,
			type: `number`
		  },
		patient_id:{
			sql:`PMID`,
			type:`number`
		}

	  }
	,
	dataSource:`default`
  });