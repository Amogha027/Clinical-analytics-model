cube(`RepeatVisits`, {
	sql: `SELECT *
 FROM ${AppFrequency.sql()} AS App
 WHERE ${FILTER_PARAMS.RepeatVisits.created_at.filter('created_at')}`,
	preAggregations: {// Pre-Aggregations definitions go here
	  // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
	},
	joins: {},
	measures: {
	 
	},
	dimensions: {
		created_at: {
			sql: `created_at`,
			type: `time`,
		  },
		  patient_id:{
			sql: `patient_master_id`,
			type:`number`
		  }
	  }
	,
	dataSource:`default`
  });