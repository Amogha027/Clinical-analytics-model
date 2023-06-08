cube(`RepeatVisits4`, {
	sql: `Select Vis,Rep.count AS PEOPLE from ${RepeatVisits3.sql()} AS Rep`,
	preAggregations: {// Pre-Aggregations definitions go here
	  // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
	},
	joins: {
		RepeatVisits3:{
			relationship:`hasMany`,
			sql: `${CUBE}.PEOPLE = ${RepeatVisits3.count}`,
		}
	},
	measures: {
	 
	},
	dimensions: {
		visits: {
			sql: `Vis`,
			type: `string`
		  },
		count:{
			sql:`PEOPLE`,
			type:`number`
		}
	  }
	,
	dataSource:`default`
  })